#!/usr/bin/env bash
# ITP Framework — Python environment setup (macOS / Linux)
#
# Usage:  bash scripts/setup.sh
#
# Creates a virtual environment in .venv/ and installs all dependencies
# from requirements.txt. Requires Python 3.9+ (3.11+ recommended, matching CI).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VENV_DIR="$REPO_ROOT/.venv"
REQUIRED_MAJOR=3
REQUIRED_MINOR=9

# --- Locate Python -----------------------------------------------------------

find_python() {
    # Prefer exact version match, then fall back to generic python3
    for cmd in "python3.13" "python3.12" "python3.11" "python3.10" "python3.9" "python3"; do
        if command -v "$cmd" &>/dev/null; then
            echo "$cmd"
            return
        fi
    done
    echo ""
}

PYTHON_CMD="$(find_python)"
if [[ -z "$PYTHON_CMD" ]]; then
    echo "Error: Python 3 not found."
    echo "Install Python ${REQUIRED_MAJOR}.${REQUIRED_MINOR}+ from https://www.python.org/downloads/"
    exit 1
fi

# Verify minimum version
PYTHON_VERSION=$("$PYTHON_CMD" -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
PYTHON_MAJOR=$("$PYTHON_CMD" -c "import sys; print(sys.version_info.major)")
PYTHON_MINOR=$("$PYTHON_CMD" -c "import sys; print(sys.version_info.minor)")

if (( PYTHON_MAJOR < REQUIRED_MAJOR || (PYTHON_MAJOR == REQUIRED_MAJOR && PYTHON_MINOR < REQUIRED_MINOR) )); then
    echo "Error: Python ${REQUIRED_MAJOR}.${REQUIRED_MINOR}+ required, found ${PYTHON_VERSION}."
    echo "Install from https://www.python.org/downloads/"
    exit 1
fi

echo "Using $PYTHON_CMD (Python ${PYTHON_VERSION})"

# --- Install system libraries (WeasyPrint) ------------------------------------

install_system_deps() {
    if [[ "$(uname)" == "Darwin" ]]; then
        if ! command -v brew &>/dev/null; then
            echo "Warning: Homebrew not found. WeasyPrint system libraries must be"
            echo "  installed manually: cairo, pango, gdk-pixbuf, libffi"
            echo "  Install Homebrew from https://brew.sh then re-run this script."
            return 1
        fi
        local missing=()
        for pkg in cairo pango gdk-pixbuf libffi; do
            if ! brew list "$pkg" &>/dev/null; then
                missing+=("$pkg")
            fi
        done
        if [[ ${#missing[@]} -gt 0 ]]; then
            echo "Installing system libraries via Homebrew: ${missing[*]}"
            brew install "${missing[@]}"
        else
            echo "System libraries already installed (cairo, pango, gdk-pixbuf, libffi)"
        fi
    else
        # Linux (Debian/Ubuntu)
        local missing=()
        for pkg in libcairo2-dev libpango1.0-dev libgdk-pixbuf2.0-dev libffi-dev; do
            if ! dpkg -s "$pkg" &>/dev/null 2>&1; then
                missing+=("$pkg")
            fi
        done
        if [[ ${#missing[@]} -gt 0 ]]; then
            echo "Installing system libraries via apt: ${missing[*]}"
            sudo apt-get update -qq
            sudo apt-get install -y -qq "${missing[@]}"
        else
            echo "System libraries already installed"
        fi
    fi
}

echo ""
echo "Checking system libraries for PDF support (WeasyPrint)..."
if ! install_system_deps; then
    echo "  (Continuing without PDF support — core pipeline will still work)"
fi

# --- Create virtual environment -----------------------------------------------

if [[ -d "$VENV_DIR" ]]; then
    echo "Removing existing virtual environment..."
    rm -rf "$VENV_DIR"
fi

echo "Creating virtual environment in .venv/..."
"$PYTHON_CMD" -m venv "$VENV_DIR"

# --- Install dependencies -----------------------------------------------------

echo "Upgrading pip..."
"$VENV_DIR/bin/pip" install --upgrade pip --quiet

echo "Installing dependencies from requirements.txt..."
"$VENV_DIR/bin/pip" install -r "$REPO_ROOT/requirements.txt"

# --- Verify installation ------------------------------------------------------

echo ""
echo "Verifying core imports..."
"$VENV_DIR/bin/python" -c "
import yaml, jsonschema, jinja2, ftfy
print('  Core pipeline dependencies: OK')
"

# WeasyPrint may fail if system libraries (Cairo, Pango) are missing
if "$VENV_DIR/bin/python" -c "import weasyprint" 2>/dev/null; then
    echo "  PDF dependencies (WeasyPrint): OK"
else
    echo "  PDF dependencies (WeasyPrint): FAILED"
    echo "    WeasyPrint requires system libraries. Install them:"
    if [[ "$(uname)" == "Darwin" ]]; then
        echo "      brew install cairo pango gdk-pixbuf libffi"
    else
        echo "      sudo apt install libcairo2-dev libpango1.0-dev libgdk-pixbuf2.0-dev libffi-dev"
    fi
    echo "    Then re-run: bash scripts/setup.sh"
    echo "    (Core pipeline will still work without WeasyPrint)"
fi

echo ""
echo "Setup complete. Use scripts/validate.sh and scripts/build.sh to run the pipeline."
