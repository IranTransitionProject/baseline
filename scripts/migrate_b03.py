#!/usr/bin/env python3
"""Migrate Brief #3 from source markdown to YAML.
Preserves all escape sequences and formatting exactly."""

import sys
from pathlib import Path

try:
    import yaml
except ImportError:
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install",
                           "pyyaml", "--break-system-packages", "-q"])
    import yaml


# Custom representer for block scalars (literal style |)
def str_representer(dumper, data):
    if '\n' in data:
        return dumper.represent_scalar('tag:yaml.org,2002:str', data, style='|')
    return dumper.represent_scalar('tag:yaml.org,2002:str', data)


# Custom representer for folded scalars (>-)
class FlowStr(str):
    pass

def flowstr_representer(dumper, data):
    return dumper.represent_scalar('tag:yaml.org,2002:str', data, style='>')


yaml.add_representer(str, str_representer)
yaml.add_representer(FlowStr, flowstr_representer)


def parse_brief3(source_path: str) -> dict:
    """Parse Brief #3 markdown into structured data."""
    with open(source_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    text = ''.join(lines)

    # Split by ## headings
    import re
    # Find all ## sections
    sections_raw = re.split(r'\n## ', text)

    # First part is the header
    header = sections_raw[0]

    # Extract sections
    sections = []
    for i, raw in enumerate(sections_raw[1:]):
        # First line is the section title
        title_end = raw.index('\n')
        title = raw[:title_end].strip()
        content = raw[title_end:].strip()

        # Skip the subtitle (it's ## And Anyone Who Plans...)
        if title.startswith("And Anyone"):
            continue

        # Skip the --- separator sections and footer
        if not title or title == '---':
            continue

        # Strip footer content: everything after \n---\n in last section
        if '\n---\n' in content:
            content = content[:content.index('\n---\n')]
            content = content.strip()

        # Also strip trailing --- at end
        content = content.rstrip()
        if content.endswith('\n---'):
            content = content[:-4].rstrip()

        sections.append({
            'title': title,
            'level': 2,
            'content': content + '\n',
        })

    brief = {
        'brief_id': 'B03',
        'number': 3,
        'title': 'Iran Is Not Iraq',
        'subtitle': 'And Anyone Who Plans as if It Is Will Create Something Worse',
        'author': 'Hooman Mehr',
        'contact': 'hooman@mac.com',
        'series_link': 'https://hmehr.substack.com/p/iran-the-convergence-briefs',
        'brief_link': 'https://hmehr.substack.com/p/iran-is-not-iraq',
        'version': 'v2.0',
        'date': '2026-02-21',
        'date_published': '2026-02-21',
        'status': 'STABLE',
        'type': 'brief',
        'core_thesis': 'The Iraq comparison freezes policy thinking; Iran has 7 structural differences that make both optimism and pessimism from that analogy wrong.',
        'itb_anchors': ['ITB-A9', 'ITB-B', 'ITB-C', 'ITB-D', 'ITB-E', 'ITB-G'],
        'update_notes': [],
        'sections': sections,
        'source_summary': None,
        'companion_briefs': [
            {'number': 1, 'title': 'The Blind Spot in Every Iran Deal',
             'link': 'https://hmehr.substack.com/p/the-blind-spot-in-every-iran-deal',
             'description': 'the taqiyyah verification gap'},
            {'number': 2, 'title': 'The Country Inside the Country',
             'link': 'https://hmehr.substack.com/p/the-country-inside-the-country',
             'description': 'IRGC parallel civilization'},
            {'number': 3, 'title': 'Iran Is Not Iraq',
             'link': 'https://hmehr.substack.com/p/iran-is-not-iraq',
             'description': 'why the comparison fails'},
            {'number': 5, 'title': 'The Deal That Cannot Hold',
             'link': 'https://hmehr.substack.com/p/the-deal-that-cannot-hold',
             'description': 'the Pinochet Pivot and three failure fronts'},
            {'number': 6, 'title': 'The Day After',
             'link': 'https://hmehr.substack.com/p/the-day-after',
             'description': 'what determines regime survival after the next strike'},
            {'number': 7, 'title': 'Who Is Actually Running Iran?',
             'link': 'https://hmehr.substack.com/p/who-is-actually-running-iran',
             'description': 'the Larijani revelation'},
            {'number': 8, 'title': 'The Puppet Problem',
             'link': 'https://hmehr.substack.com/p/the-puppet-problem',
             'description': 'why the next Supreme Leader may not matter'},
            {'number': 9, 'title': 'The Doctrine Behind the Escalation',
             'link': 'https://hmehr.substack.com/p/the-doctrine-behind-the-escalation',
             'description': 'the coercive-endurance cycle'},
            {'number': 10, 'title': 'The Table After the Bombs',
             'link': 'https://hmehr.substack.com/p/the-table-after-the-bombs',
             'description': 'what post-strike negotiations actually look like'},
        ],
        'author_bio': 'Hooman Mehr is an independent analyst based in Kirkland, Washington. The Iran Transition Project publishes on [Substack](https://hmehr.substack.com) and [LinkedIn](https://www.linkedin.com/in/hoomanmehr). Contact: [hooman@mac.com](mailto:hooman@mac.com)',
        'changelog': [
            {'version': 'v2.0', 'date': '2026-02-21',
             'structural_changes': 'Removed framing box. Removed closing section "The Question Nobody Wants to Answer" (rhetorical closer).',
             'content_changes': 'None substantive. Light cleanup only.'},
            {'version': 'v3.0', 'date': '2026-02-23',
             'structural_changes': None,
             'content_changes': 'No changes. Content stable.'},
        ],
        'governance': {
            'routing_decision': None,
            'shelf_life': 'LONG',
            'pending_updates': 'Optional one-paragraph addition: diaspora capital as exclusively Type B (governance-sensitive). Very low priority.',
            'vulnerability': None,
        },
    }

    return brief


def write_yaml(data: dict, output_path: str):
    """Write brief data as YAML with proper formatting."""
    # Use custom dumper to get block scalars for multiline strings
    with open(output_path, 'w', encoding='utf-8') as f:
        yaml.dump(data, f,
                  default_flow_style=False,
                  allow_unicode=True,
                  width=120,
                  sort_keys=False)


if __name__ == '__main__':
    source = '/mnt/project/Brief_03_Iran_Is_Not_Iraq.md'
    output = Path(__file__).resolve().parent.parent / 'data' / 'briefs' / 'b03.yaml'

    brief = parse_brief3(source)

    # Debug: show parsed sections
    print(f"Parsed {len(brief['sections'])} sections:")
    for s in brief['sections']:
        print(f"  - {s['title']} ({len(s['content'])} chars)")

    write_yaml(brief, str(output))
    print(f"\nWritten to {output}")

    # Verify it parses back
    with open(output, 'r', encoding='utf-8') as f:
        roundtrip = yaml.safe_load(f)
    print(f"Roundtrip check: {len(roundtrip['sections'])} sections, "
          f"brief_id={roundtrip['brief_id']}")
