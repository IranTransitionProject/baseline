# Pipeline

Build and validation scripts for the ITP analytical database.

| Script | Purpose |
|--------|---------|
| `validate.py` | Validate all `data/*.yaml` files against JSON schemas; cross-reference check |
| `validate_briefs.py` | Validate `data/briefs/*.yaml` files against brief schema |
| `build.py` | Render validated data to `output/*.md` via Jinja2 templates |
| `build_briefs.py` | Render brief YAML to markdown |
| `build_pdf.py` | Convert rendered markdown to PDF releases |

## Setup

Requires Python 3.9+ (3.11+ recommended). Run the setup script once to create a virtual environment:

```bash
# macOS / Linux
bash scripts/setup.sh

# Windows
scripts\setup.bat
```

This creates `.venv/` with all dependencies from `requirements.txt`.

## Usage

Use the wrapper scripts (they activate the virtual environment automatically):

```bash
# macOS / Linux
bash scripts/validate.sh              # validate everything
bash scripts/validate.sh entities     # entities only
bash scripts/validate.sh briefs       # briefs only
bash scripts/validate.sh variables    # single entity type

bash scripts/build.sh                 # build everything
bash scripts/build.sh briefs          # briefs only
bash scripts/build.sh pdf             # PDF releases
bash scripts/build.sh --validate      # validate then build

# Windows
scripts\validate.bat
scripts\build.bat
```

Or run pipeline scripts directly (with the virtual environment activated):

```bash
source .venv/bin/activate             # macOS / Linux
python pipeline/validate.py
python pipeline/build.py
deactivate
```

## Dependencies

Managed via `requirements.txt` in the repository root. Core pipeline needs
`pyyaml`, `jsonschema`, `jinja2`, `ftfy`. PDF generation additionally needs
`weasyprint` and `markdown` (plus system libraries — see `requirements.txt`
for platform-specific install notes).
