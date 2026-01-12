#!/bin/bash

echo "========================================"
echo " Internal Chat Desktop App Setup"
echo "========================================"
echo ""

echo "Step 1: Installing dependencies..."
npm install
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install dependencies"
    exit 1
fi

echo ""
echo "Detecting your platform..."
PLATFORM=$(uname)

if [ "$PLATFORM" == "Darwin" ]; then
    echo "Building for macOS..."
    npm run build:mac
elif [ "$PLATFORM" == "Linux" ]; then
    echo "Building for Linux..."
    npm run build:linux
else
    echo "Unknown platform: $PLATFORM"
    echo "Please run manually:"
    echo "  npm run build:mac   (for macOS)"
    echo "  npm run build:linux (for Linux)"
    exit 1
fi

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to build desktop app"
    exit 1
fi

echo ""
echo "========================================"
echo " BUILD COMPLETE!"
echo "========================================"
echo ""
echo "Your desktop app is ready!"
echo "Location: Frontend/release/"
echo ""

if [ "$PLATFORM" == "Darwin" ]; then
    echo "Look for: Internal-Chat-1.0.0.dmg"
else
    echo "Look for: Internal-Chat-1.0.0.AppImage"
    echo "          Internal-Chat-1.0.0.deb"
    echo "          Internal-Chat-1.0.0.rpm"
fi

echo ""


