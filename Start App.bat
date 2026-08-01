@echo off
setlocal enabledelayedexpansion
title CLI Notes Archive - Launcher
cd /d "%~dp0"

echo ========================================
echo   CLI Notes Archive - Startup Script
echo ========================================
echo.

REM --- Step 1: Verify Python is installed ---
echo [1/5] Checking for Python...
where python >nul 2>nul
if errorlevel 1 (
    echo.
    echo [ERROR] Python was not found on this system.
    echo Please install Python from https://www.python.org/downloads/
    echo During installation, make sure to check "Add python.exe to PATH".
    echo.
    pause
    exit /b 1
)
echo       Python found.
echo.

REM --- Step 2: Create virtual environment if needed ---
echo [2/5] Checking for virtual environment...
if not exist "venv\" (
    echo       No virtual environment found. Creating one now...
    python -m venv venv
    if errorlevel 1 (
        echo [ERROR] Failed to create the virtual environment.
        pause
        exit /b 1
    )
    echo       Virtual environment created.
) else (
    echo       Virtual environment already exists.
)
echo.

REM --- Step 3: Activate virtual environment ---
echo [3/5] Activating virtual environment...
call "venv\Scripts\activate.bat"
if errorlevel 1 (
    echo [ERROR] Failed to activate the virtual environment.
    pause
    exit /b 1
)
echo       Virtual environment activated.
echo.

REM --- Step 4: Install missing dependencies ---
echo [4/5] Checking dependencies...
if exist "requirements.txt" (
    echo       Installing/updating dependencies from requirements.txt...
    pip install -r requirements.txt >nul
    if errorlevel 1 (
        echo [ERROR] Failed to install dependencies.
        pause
        exit /b 1
    )
    echo       Dependencies installed.
) else (
    echo       No requirements.txt found - this project has no external dependencies.
)
echo.

REM --- Step 5: Verify .env file (optional for this project) ---
if exist ".env.example" (
    if not exist ".env" (
        echo [NOTICE] No .env file found, but .env.example exists.
        echo          Copy .env.example to .env and fill in any required values before continuing.
        echo.
    )
)

REM --- Fix console encoding so emoji in the app display correctly ---
chcp 65001 >nul

REM --- Launch the application ---
echo [5/5] Launching CLI Notes Archive...
echo ========================================
echo.
python notes_app.py

if errorlevel 1 (
    echo.
    echo [ERROR] The application closed unexpectedly. See the message above for details.
    pause
    exit /b 1
)

echo.
echo Application closed normally.
pause
