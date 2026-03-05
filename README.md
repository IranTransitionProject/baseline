# Iran Transition Project

**Independent analytical framework for Iranian regime architecture and transition dynamics.**

🌐 [irantransitionproject.org](https://irantransitionproject.org)

📧 [admin@irantransitionproject.org](mailto:admin@irantransitionproject.org)

📄 Licensed under [CC BY-SA 4.0](LICENSE) · [Governance](GOVERNANCE.md) · [Contributing](CONTRIBUTING.md)

---

## What This Is

The Iran Transition Project is an open, independent analytical framework examining
how power actually operates inside the Iranian regime, where structural
vulnerabilities exist, and what conditions a viable transition would require.

This is not advocacy for any faction, opposition group, or foreign policy position.
The guiding question throughout is: *what must be true for a transition to succeed,
regardless of who governs?*

For the full project rationale and database architecture, see [ARCHITECTURE.md](ARCHITECTURE.md).

---

## Repository Structure

```
/
├── .github/workflows/           # CI configuration
├── data/                        # YAML source-of-truth files (validated against schemas)
│   ├── content/                 # Iran Transition Baseline (ITB) module prose
│   ├── briefs/                  # Convergence Brief source data
│   └── *.yaml                   # Variables, gaps, traps, observations, scenarios, sessions
├── schemas/                     # JSON Schema definitions for all data structures
├── templates/                   # Jinja2 templates for artifact generation
├── scripts/                     # One-time migration and utility scripts
├── build.py                     # Main build entry point (markdown output)
├── build_briefs.py              # Brief-specific build runner
├── build_pdf.py                 # PDF release bundle builder
├── validate.py                  # Schema validation runner
├── validate_briefs.py           # Brief schema validation runner
├── ARCHITECTURE.md              # Database design and build pipeline documentation
├── CLAUDE_CODE_INSTRUCTIONS.md  # Operating manual for AI-assisted sessions
├── CONTRIBUTING.md
├── GOVERNANCE.md
├── LICENSE
└── README.md                    # This file
```

---

## Build System

The project uses a YAML-first architecture. All analytical content lives in
validated YAML source files. Markdown and PDF outputs are generated
artifacts — never edited directly.

```bash
# Install dependencies
pip install pyyaml jsonschema jinja2 ftfy weasyprint markdown

# Validate all source files against schemas
python validate.py
python validate_briefs.py

# Build all markdown output
python build.py
python build_briefs.py

# Build PDF release bundles (run after build steps above)
python build_pdf.py
```

Requires Python 3.10+.

---

## Releases

PDF bundles are published as [GitHub Releases](../../releases). Each release includes:

| File | Contents | Audience |
|------|----------|----------|
| `ITP-Briefs-v{date}.pdf` | All policy briefs + reference appendix | General / policy |
| `ITP-Reference-v{date}.pdf` | Briefs + full ITB/ISA analytical library | Researchers |

---

## Current State

| Component | Coverage | Status |
|-----------|----------|--------|
| Iran Transition Baseline (ITB) | 8 pillars, 19 modules | Active |
| Iran Stress Architecture (ISA) | Traps, observations, scenarios | Active |
| Policy Briefs | 13 published + supplementals | Active |
| Analytical variables | 86 tracked | Active |
| Research gaps | 57 registered (49 open) | Active |

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). All contributors must sign the CLA.

Highest-priority needs: Persian-language source integration, subject matter
review, and methodological critique.

---

## License

[CC BY-SA 4.0](LICENSE) — open for reuse and adaptation with attribution,
derivative works must remain open under the same terms.

Alternative licensing available for policy institutions with copyleft
constraints — contact admin@irantransitionproject.org.
