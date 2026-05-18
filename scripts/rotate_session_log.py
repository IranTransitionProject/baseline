#!/usr/bin/env python3
"""rotate_session_log.py

Prunes CLAUDE_SESSION_LOG.md in two passes:

Pass 1 — Resolved-pair pruning:
  A "resolved pair" is a Chat Integration Request immediately followed
  (as the next entry) by a Code Integration Complete. These pairs are
  removed because the work is done and the data is in git history.

Pass 2 — Keep-last-N trimming:
  After pair pruning, if more than KEEP_LAST entries remain, the oldest
  entries are dropped from the front until only KEEP_LAST entries remain.

Git history always preserves the full record.

Usage:
    python3 scripts/rotate_session_log.py CLAUDE_SESSION_LOG.md

Exit codes:
    0 — rotation performed and committed
    1 — nothing to prune (nothing to do, not an error)
    2 — error
"""

import re
import sys
import subprocess
from datetime import date
from pathlib import Path

KEEP_LAST = 10  # maximum number of entries to retain after rotation

LOG_SECTION_HEADER = "## Log"
END_MARKER = "<!-- END LOG -->"
ENTRY_RE = re.compile(
    r"^(### \d{4}-\d{2}-\d{2} — (?:Chat|Code) — .+)$",
    re.MULTILINE,
)


def split_log(content: str) -> tuple[str, str]:
    """Split file into protocol header and log body."""
    idx = content.find(LOG_SECTION_HEADER)
    if idx == -1:
        raise ValueError(f'"{LOG_SECTION_HEADER}" marker not found in log file')
    return content[: idx + len(LOG_SECTION_HEADER)], content[idx + len(LOG_SECTION_HEADER) :]


def parse_entries(body: str) -> list[dict]:
    """Parse log body into a list of entry dicts with keys: header, text, is_chat_ir, is_code_ic."""
    matches = list(ENTRY_RE.finditer(body))
    entries = []
    for i, m in enumerate(matches):
        start = m.start()
        end = matches[i + 1].start() if i + 1 < len(matches) else len(body)
        text = body[start:end].rstrip("\n")
        header = m.group(1)
        entries.append(
            {
                "header": header,
                "text": text,
                "is_chat_ir": "— Chat —" in header and "Integration Request" in header,
                "is_code_ic": "— Code —" in header and "Integration Complete" in header,
            }
        )
    return entries


def find_resolved_indices(entries: list[dict]) -> set[int]:
    """Return indices of matched Chat IR + Code IC pairs."""
    resolved = set()
    for i, entry in enumerate(entries):
        if entry["is_chat_ir"] and i + 1 < len(entries):
            if entries[i + 1]["is_code_ic"]:
                resolved.add(i)
                resolved.add(i + 1)
    return resolved


def build_cleanup_entry(pruned_pairs: int, trimmed: int) -> str:
    today = date.today().strftime("%Y-%m-%d")
    parts = []
    if pruned_pairs:
        parts.append(
            f"Pruned {pruned_pairs} resolved pair(s) "
            f"(Chat Integration Request + Code Integration Complete)."
        )
    if trimmed:
        parts.append(
            f"Trimmed {trimmed} oldest entr{'y' if trimmed == 1 else 'ies'} "
            f"to enforce keep-last-{KEEP_LAST} policy."
        )
    detail = " ".join(parts) if parts else "No changes."
    return (
        f"### {today} — Code — Cleanup\n\n"
        f"**Log rotation.** {detail} "
        f"Git history preserves full record.\n"
    )


def rotate(log_path: Path) -> bool:
    """Rotate the log. Returns True if any rotation was performed."""
    content = log_path.read_text(encoding="utf-8")
    header, body = split_log(content)

    entries = parse_entries(body)
    if not entries:
        print("No entries found — nothing to rotate")
        return False

    # Pass 1: drop resolved adjacent IR+IC pairs
    resolved = find_resolved_indices(entries)
    kept = [e for i, e in enumerate(entries) if i not in resolved]
    pruned_pairs = len(resolved) // 2

    # Pass 2: trim from oldest end to enforce KEEP_LAST
    # Reserve one slot for the cleanup entry we are about to append.
    target = KEEP_LAST - 1
    trimmed = max(0, len(kept) - target)
    if trimmed:
        kept = kept[trimmed:]

    if not pruned_pairs and not trimmed:
        print("No resolved pairs and log is within keep-last limit — nothing to do")
        return False

    # Reconstruct: header + kept entries + cleanup entry + END marker
    kept_text = "\n\n".join(e["text"] for e in kept)
    cleanup = build_cleanup_entry(pruned_pairs, trimmed)

    new_content = (
        header
        + "\n\n"
        + (kept_text + "\n\n" if kept_text else "")
        + cleanup
        + "\n"
        + END_MARKER
        + "\n"
    )

    log_path.write_text(new_content, encoding="utf-8")
    total_after = len(kept) + 1  # +1 for cleanup entry
    print(
        f"Pass 1: pruned {pruned_pairs} resolved pair(s). "
        f"Pass 2: trimmed {trimmed} oldest entr{'y' if trimmed == 1 else 'ies'}. "
        f"{total_after} entries remain."
    )

    # Commit
    repo_root = log_path.parent
    subprocess.run(["git", "add", str(log_path)], cwd=repo_root, check=True)
    msg_parts = []
    if pruned_pairs:
        msg_parts.append(f"pruned {pruned_pairs} resolved pair(s)")
    if trimmed:
        msg_parts.append(f"trimmed {trimmed} oldest entr{'y' if trimmed == 1 else 'ies'}")
    summary = ", ".join(msg_parts) if msg_parts else "no changes"
    subprocess.run(
        [
            "git", "commit", "-m",
            (
                f"Session log rotation: {summary}\n\n"
                f"Git history preserves full record.\n\n"
                f"Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
            ),
        ],
        cwd=repo_root,
        check=True,
    )
    subprocess.run(["git", "push"], cwd=repo_root, check=True)
    print("Committed and pushed rotation")
    return True


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} CLAUDE_SESSION_LOG.md", file=sys.stderr)
        sys.exit(2)

    path = Path(sys.argv[1])
    if not path.exists():
        print(f"ERROR: file not found: {path}", file=sys.stderr)
        sys.exit(2)

    try:
        performed = rotate(path)
        sys.exit(0 if performed else 1)
    except Exception as e:
        print(f"ERROR: {e}", file=sys.stderr)
        sys.exit(2)
