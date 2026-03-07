#!/usr/bin/env bash
# ITP Framework — Validate data files (macOS / Linux)
#
# Usage:
#   bash scripts/validate.sh              # validate everything
#   bash scripts/validate.sh all          # same as above
#   bash scripts/validate.sh entities     # entities + content modules only
#   bash scripts/validate.sh briefs       # briefs only
#   bash scripts/validate.sh variables    # single entity type (passed to validate.py)
#   bash scripts/validate.sh gaps         # single entity type
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
        python pipeline/validate.py
        python pipeline/validate_briefs.py
        ;;
    entities)
        python pipeline/validate.py
        ;;
    briefs)
        python pipeline/validate_briefs.py
        ;;
    *)
        # Pass through to validate.py (e.g., variables, gaps, traps, etc.)
        python pipeline/validate.py "$@"
        ;;
esac

deactivate
