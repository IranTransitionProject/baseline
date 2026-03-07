#!/usr/bin/env bash
# ITP Framework — Build output files (macOS / Linux)
#
# Usage:
#   bash scripts/build.sh                 # build everything (entities + briefs)
#   bash scripts/build.sh all             # same as above
#   bash scripts/build.sh entities        # entity reports + content modules only
#   bash scripts/build.sh briefs          # briefs only
#   bash scripts/build.sh pdf             # PDF releases only
#   bash scripts/build.sh pdf --briefs-only   # PDF briefs tier only
#   bash scripts/build.sh variables       # single entity type (passed to build.py)
#   bash scripts/build.sh content         # content modules only
#   bash scripts/build.sh --validate      # validate then build all
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VENV_DIR="$REPO_ROOT/.venv"

if [[ ! -d "$VENV_DIR" ]]; then
    echo "Error: Virtual environment not found at .venv/"
    echo "Run first:  bash scripts/setup.sh"
    exit 1
fi

source "$VENV_DIR/bin/activate"
cd "$REPO_ROOT"

COMPONENT="${1:-all}"

case "$COMPONENT" in
    all)
        python pipeline/build.py
        python pipeline/build_briefs.py
        ;;
    entities)
        python pipeline/build.py
        ;;
    briefs)
        python pipeline/build_briefs.py
        ;;
    pdf)
        shift
        python pipeline/build_pdf.py "$@"
        ;;
    --validate)
        python pipeline/validate.py
        python pipeline/validate_briefs.py
        python pipeline/build.py
        python pipeline/build_briefs.py
        ;;
    *)
        # Pass through to build.py (e.g., variables, content, etc.)
        python pipeline/build.py "$@"
        ;;
esac

deactivate
