# Pipeline

Build and validation scripts for the ITP analytical database.

| Script | Purpose |
|--------|---------|
| `validate.py` | Validate all `data/*.yaml` files against JSON schemas; cross-reference check |
| `validate_briefs.py` | Validate `data/briefs/*.yaml` files against brief schema |
| `build.py` | Render validated data to `output/*.md` via Jinja2 templates |
| `build_briefs.py` | Render brief YAML to markdown |
| `build_pdf.py` | Convert rendered markdown to PDF releases |

## Usage

Run from the **repository root**:

```bash
python pipeline/validate.py          # validate all entities
python pipeline/validate.py modules  # validate one entity type
python pipeline/validate_briefs.py   # validate briefs
python pipeline/build.py             # build all output
python pipeline/build_pdf.py        # generate PDF releases
```

## Dependencies

```bash
pip install pyyaml jsonschema jinja2 ftfy weasyprint
```
