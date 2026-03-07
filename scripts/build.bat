@echo off
REM ITP Framework — Build output files (Windows)
REM
REM Usage:
REM   scripts\build.bat                 — build everything (entities + briefs)
REM   scripts\build.bat all             — same as above
REM   scripts\build.bat entities        — entity reports + content modules only
REM   scripts\build.bat briefs          — briefs only
REM   scripts\build.bat pdf             — PDF releases only
REM   scripts\build.bat pdf --briefs-only   — PDF briefs tier only
REM   scripts\build.bat variables       — single entity type
REM   scripts\build.bat --validate      — validate then build all
setlocal

set "REPO_ROOT=%~dp0.."
set "VENV_DIR=%REPO_ROOT%\.venv"

if not exist "%VENV_DIR%" (
    echo Error: Virtual environment not found at .venv\
    echo Run first:  scripts\setup.bat
    exit /b 1
)

call "%VENV_DIR%\Scripts\activate.bat"
cd /d "%REPO_ROOT%"

set "COMPONENT=%~1"
if "%COMPONENT%"=="" set "COMPONENT=all"

if /i "%COMPONENT%"=="all" goto :all
if /i "%COMPONENT%"=="entities" goto :entities
if /i "%COMPONENT%"=="briefs" goto :briefs
if /i "%COMPONENT%"=="pdf" goto :pdf
if /i "%COMPONENT%"=="--validate" goto :validatebuild
goto :passthrough

:all
python pipeline\build.py
if %errorlevel% neq 0 goto :fail
python pipeline\build_briefs.py
if %errorlevel% neq 0 goto :fail
goto :done

:entities
python pipeline\build.py
if %errorlevel% neq 0 goto :fail
goto :done

:briefs
python pipeline\build_briefs.py
if %errorlevel% neq 0 goto :fail
goto :done

:pdf
shift
python pipeline\build_pdf.py %*
if %errorlevel% neq 0 goto :fail
goto :done

:validatebuild
python pipeline\validate.py
if %errorlevel% neq 0 goto :fail
python pipeline\validate_briefs.py
if %errorlevel% neq 0 goto :fail
python pipeline\build.py
if %errorlevel% neq 0 goto :fail
python pipeline\build_briefs.py
if %errorlevel% neq 0 goto :fail
goto :done

:passthrough
python pipeline\build.py %*
if %errorlevel% neq 0 goto :fail
goto :done

:fail
call deactivate
endlocal
exit /b 1

:done
call deactivate
endlocal
