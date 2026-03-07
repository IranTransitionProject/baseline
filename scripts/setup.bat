@echo off
REM ITP Framework — Python environment setup (Windows)
REM
REM Usage:  scripts\setup.bat
REM
REM Creates a virtual environment in .venv\ and installs all dependencies
REM from requirements.txt. Requires Python 3.9+ (3.11+ recommended, matching CI).
setlocal enabledelayedexpansion

set "REPO_ROOT=%~dp0.."
set "VENV_DIR=%REPO_ROOT%\.venv"
set "REQUIRED_MAJOR=3"
set "REQUIRED_MINOR=9"

REM --- Locate Python ----------------------------------------------------------

set "PYTHON_CMD="
for %%P in (python3.13 python3.12 python3.11 python3.10 python3.9 python3 python) do (
    where %%P >nul 2>&1
    if !errorlevel! equ 0 (
        set "PYTHON_CMD=%%P"
        goto :found_python
    )
)

echo Error: Python 3 not found.
echo Install Python %REQUIRED_MAJOR%.%REQUIRED_MINOR%+ from https://www.python.org/downloads/
exit /b 1

:found_python

REM --- Verify minimum version -------------------------------------------------

for /f "tokens=*" %%V in ('%PYTHON_CMD% -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"') do set "PYTHON_VERSION=%%V"
for /f "tokens=*" %%V in ('%PYTHON_CMD% -c "import sys; print(sys.version_info.major)"') do set "PY_MAJOR=%%V"
for /f "tokens=*" %%V in ('%PYTHON_CMD% -c "import sys; print(sys.version_info.minor)"') do set "PY_MINOR=%%V"

if %PY_MAJOR% lss %REQUIRED_MAJOR% (
    echo Error: Python %REQUIRED_MAJOR%.%REQUIRED_MINOR%+ required, found %PYTHON_VERSION%.
    exit /b 1
)
if %PY_MAJOR% equ %REQUIRED_MAJOR% if %PY_MINOR% lss %REQUIRED_MINOR% (
    echo Error: Python %REQUIRED_MAJOR%.%REQUIRED_MINOR%+ required, found %PYTHON_VERSION%.
    exit /b 1
)

echo Using %PYTHON_CMD% (Python %PYTHON_VERSION%)

REM --- Install system libraries (WeasyPrint) ----------------------------------

echo.
echo Checking system libraries for PDF support (WeasyPrint)...

REM WeasyPrint on Windows needs the GTK3 runtime. Try winget first, then advise.
where pango-querymodules >nul 2>&1
if %errorlevel% equ 0 (
    echo   GTK3 runtime already installed.
) else (
    echo   GTK3 runtime not detected.
    where winget >nul 2>&1
    if !errorlevel! equ 0 (
        echo   Installing GTK3 runtime via winget...
        winget install --id MSYS2.MSYS2 --accept-package-agreements --accept-source-agreements >nul 2>&1
        if !errorlevel! equ 0 (
            echo   MSYS2 installed. Open MSYS2 and run:
            echo     pacman -S mingw-w64-x86_64-pango mingw-w64-x86_64-gdk-pixbuf2
            echo   Then add MSYS2 mingw64\bin to your PATH and re-run this script.
        ) else (
            echo   winget install failed. Install GTK3 manually:
            echo     https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#windows
        )
    ) else (
        echo   Install GTK3 runtime for PDF support:
        echo     https://doc.courtbouillon.org/weasyprint/stable/first_steps.html#windows
        echo   (Core pipeline will still work without it)
    )
)

REM --- Create virtual environment ---------------------------------------------

if exist "%VENV_DIR%" (
    echo Removing existing virtual environment...
    rmdir /s /q "%VENV_DIR%"
)

echo Creating virtual environment in .venv\...
%PYTHON_CMD% -m venv "%VENV_DIR%"

REM --- Install dependencies ---------------------------------------------------

echo Upgrading pip...
"%VENV_DIR%\Scripts\pip" install --upgrade pip --quiet

echo Installing dependencies from requirements.txt...
"%VENV_DIR%\Scripts\pip" install -r "%REPO_ROOT%\requirements.txt"

REM --- Verify installation ----------------------------------------------------

echo.
echo Verifying core imports...
"%VENV_DIR%\Scripts\python" -c "import yaml, jsonschema, jinja2, ftfy; print('  Core pipeline dependencies: OK')"

"%VENV_DIR%\Scripts\python" -c "import weasyprint" >nul 2>&1
if %errorlevel% equ 0 (
    echo   PDF dependencies (WeasyPrint): OK
) else (
    echo   PDF dependencies (WeasyPrint): FAILED
    echo     WeasyPrint requires system libraries (GTK3 runtime).
    echo     See https://doc.courtbouillon.org/weasyprint/stable/first_steps.html
    echo     Core pipeline will still work without WeasyPrint.
)

echo.
echo Setup complete. Use scripts\validate.bat and scripts\build.bat to run the pipeline.

endlocal
