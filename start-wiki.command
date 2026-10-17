#!/bin/bash

# Change to the directory where this script is located
cd "$(dirname "$0")" || exit 1

# Ensure common Node / Homebrew paths are in PATH
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

echo "=========================================================="
echo " Starting Personal Wiki (Local Wikipedia Alternative)    "
echo "=========================================================="
echo ""

# Check if node is installed
if ! command -v node >/dev/null 2>&1; then
  echo "Error: Node.js is not found in PATH."
  echo "Please install Node.js from https://nodejs.org or via Homebrew (brew install node)."
  echo ""
  read -p "Press [Enter] to exit..."
  exit 1
fi

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
  echo "First run detected: Installing dependencies..."
  npm install
  if [ $? -ne 0 ]; then
    echo "Error: Failed to install npm dependencies."
    read -p "Press [Enter] to exit..."
    exit 1
  fi
fi

echo "Starting local Vite server..."
echo "Your encyclopedia will open in your default browser at http://localhost:5173"
echo "Press Ctrl+C in this terminal window to stop the server."
echo ""

# Start the dev server and automatically launch the browser
npm run dev -- --open
