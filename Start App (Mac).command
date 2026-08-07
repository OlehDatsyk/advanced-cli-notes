#!/bin/bash
# CLI Notes Archive - macOS Launcher
# Double-click this file to run. If macOS blocks it, right-click -> Open once,
# or run: chmod +x "Start App (Mac).command"

cd "$(dirname "$0")" || exit 1

echo "================================================================"
echo "  CLI Notes Archive - Startup Script (Was made by Oleh Datsyk)"
echo "================================================================"
echo

fail() {
    echo
    echo "[ERROR] $1"
    echo
    read -n 1 -s -r -p "Press any key to close..."
    exit 1
}

# --- Step 1: Verify Python is installed ---
echo "[1/5] Checking for Python..."
if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD="python3"
elif command -v python >/dev/null 2>&1; then
    PYTHON_CMD="python"
else
    fail "Python was not found. Install it from https://www.python.org/downloads/ and try again."
fi
echo "      Python found ($PYTHON_CMD)."
echo

# --- Step 2: Create virtual environment if needed ---
echo "[2/5] Checking for virtual environment..."
if [ ! -d "venv" ]; then
    echo "      No virtual environment found. Creating one now..."
    "$PYTHON_CMD" -m venv venv || fail "Failed to create the virtual environment."
    echo "      Virtual environment created."
else
    echo "      Virtual environment already exists."
fi
echo

# --- Step 3: Activate virtual environment ---
echo "[3/5] Activating virtual environment..."
# shellcheck disable=SC1091
source "venv/bin/activate" || fail "Failed to activate the virtual environment."
echo "      Virtual environment activated."
echo

# --- Step 4: Install missing dependencies ---
echo "[4/5] Checking dependencies..."
if [ -f "requirements.txt" ]; then
    echo "      Installing/updating dependencies from requirements.txt..."
    pip install -r requirements.txt >/dev/null || fail "Failed to install dependencies."
    echo "      Dependencies installed."
else
    echo "      No requirements.txt found - this project has no external dependencies."
fi
echo

# --- Step 5: Verify .env file (optional for this project) ---
if [ -f ".env.example" ] && [ ! -f ".env" ]; then
    echo "[NOTICE] No .env file found, but .env.example exists."
    echo "         Copy .env.example to .env and fill in any required values before continuing."
    echo
fi

# --- Launch the application ---
echo "[5/5] Launching CLI Notes Archive..."
echo "========================================"
echo
"$PYTHON_CMD" notes_app.py
STATUS=$?

if [ $STATUS -ne 0 ]; then
    fail "The application closed unexpectedly (exit code $STATUS). See the message above for details."
fi

echo
echo "Application closed normally."
read -n 1 -s -r -p "Press any key to close..."
