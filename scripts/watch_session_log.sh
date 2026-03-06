#!/usr/bin/env bash
# watch_session_log.sh
#
# One-shot processor for CLAUDE_SESSION_LOG.md. Triggered by launchd
# WatchPaths when the log file changes. Checks whether new Chat Integration
# Requests have appeared; if so, invokes Claude Code CLI non-interactively.
# Exits after processing (launchd restarts it on the next file change).
#
# Loop prevention: compares current Chat IR count against stored state.
# Code's own writes (Integration Complete) don't increase the Chat IR count,
# so they don't trigger a Claude invocation.
#
# Log rotation: delegates to rotate_session_log.py when file exceeds
# ROTATION_THRESHOLD lines.
#
# Dependencies: claude CLI (resolved dynamically from ~/Library/...)
# State: .claude/watcher_state (last known IR count), .claude/watcher.lock
# Log:   .claude/watcher.log
#
# Install: bash scripts/install_watcher.sh
# Run manually: bash scripts/watch_session_log.sh

set -euo pipefail

REPO_ROOT="$HOME/Developer/Repositories/framework"
LOG_FILE="$REPO_ROOT/CLAUDE_SESSION_LOG.md"
STATE_DIR="$REPO_ROOT/.claude"
STATE_FILE="$STATE_DIR/watcher_state"
LOCK_FILE="$STATE_DIR/watcher.lock"
ROTATION_THRESHOLD=400

TRIGGER_PATTERN="— Chat — Integration Request"

# Route all output to watcher.log early (captures shell-level errors too)
mkdir -p "$STATE_DIR"
exec >> "$STATE_DIR/watcher.log" 2>&1

trap 'echo "[$(date "+%Y-%m-%d %H:%M:%S")] EXIT: status=$?"' EXIT

# Find claude binary — resolve latest installed version dynamically
CLAUDE_BIN=$(ls -1dt "$HOME/Library/Application Support/Claude/claude-code/"*/claude 2>/dev/null | head -1 || true)
if [[ -z "$CLAUDE_BIN" ]]; then
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ERROR: claude CLI not found"
    exit 1
fi

CLAUDE_PROMPT="You are Claude Code for the Iran Transition Project at $REPO_ROOT. \
A new Chat Integration Request has been detected in CLAUDE_SESSION_LOG.md. \
Read the session log, identify any pending requests (Chat Integration Request \
entries not yet followed by a Code Integration Complete), and process them \
per the Staging Directory Protocol in CLAUDE_CODE_INSTRUCTIONS.md. \
Commit all changes atomically and append an Integration Complete entry \
to the session log."

log() { echo "[$(date "+%Y-%m-%d %H:%M:%S")] $*"; }

count_requests() {
    grep -c "$TRIGGER_PATTERN" "$LOG_FILE" 2>/dev/null || echo "0"
}

# --- Check for new requests ---
current_count=$(count_requests)
last_count=0
[[ -f "$STATE_FILE" ]] && last_count=$(cat "$STATE_FILE")

# Always update state (so Code's own writes don't trigger on next run)
echo "$current_count" > "$STATE_FILE"

if (( current_count <= last_count )); then
    # No new Chat IR entries — nothing to do (Code's write or no change)
    exit 0
fi

log "Integration Request count: $last_count → $current_count"

# --- Lockfile: prevent concurrent invocations ---
if [[ -f "$LOCK_FILE" ]]; then
    log "Claude already running (lockfile present) — skipping"
    exit 0
fi

log "Triggering Claude Code (non-interactive)"
touch "$LOCK_FILE"

cd "$REPO_ROOT"
# env -u CLAUDECODE: strip nested-session guard so CLI starts outside a session
env -u CLAUDECODE \
    "$CLAUDE_BIN" -p \
    --permission-mode bypassPermissions \
    --model sonnet \
    "$CLAUDE_PROMPT" \
    && log "Claude Code run complete" \
    || log "ERROR: Claude Code exited with error (exit $?)"

rm -f "$LOCK_FILE"

# --- Log rotation ---
line_count=$(wc -l < "$LOG_FILE" | tr -d ' ')
if (( line_count > ROTATION_THRESHOLD )); then
    log "Rotation triggered ($line_count lines)"
    python3 "$REPO_ROOT/scripts/rotate_session_log.py" "$LOG_FILE" \
        && log "Rotation complete" \
        || log "WARNING: rotation failed — log continues to grow"
fi
