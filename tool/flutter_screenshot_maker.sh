#!/bin/bash
set -e

# Usage:
#   flutter_screenshot_maker.sh <zip_number> [device]
#
# Project name is auto-derived from the current working directory
# (the folder you run this script from).
#
# Examples:
#   flutter_screenshot_maker.sh 4498
#   flutter_screenshot_maker.sh 4498 "iPhone 16 Pro Max"

if [ -z "$1" ]; then
  echo "Usage: $(basename "$0") <zip_number> [device]"
  echo ""
  echo "Example:"
  echo "  $(basename "$0") 4498"
  echo "  $(basename "$0") 4498 \"iPhone 16 Pro Max\""
  exit 1
fi

ZIP_NUMBER="$1"
DEVICE="${2:-iPhone 14 Plus}" # Cause it supports uploading dimensions of screen for App Store

PROJECT_ROOT="$PWD"
OUTPUT_DIR="$PROJECT_ROOT/outputs/screenshots"
ZIP_PATH="$PROJECT_ROOT/outputs/${ZIP_NUMBER}_screenshots.zip"

echo "Project root: $PROJECT_ROOT"
echo "Output dir: $OUTPUT_DIR"
echo "Device: $DEVICE"

mkdir -p "$OUTPUT_DIR"

echo "Booting simulator: $DEVICE"
xcrun simctl boot "$DEVICE" || true
open -a Simulator

echo "Waiting for simulator boot..."
xcrun simctl bootstatus "$DEVICE" -b || true

echo "Running Flutter integration test..."
cd "$PROJECT_ROOT"

export SCREENSHOT_DIR="$OUTPUT_DIR"

flutter drive \
  --driver=test_driver/integration_driver.dart \
  --target=integration_test/screenshots_test.dart \
  -d "$DEVICE"

echo "Creating archive..."
rm -f "$ZIP_PATH"

cd "$PROJECT_ROOT/outputs"
zip -r "$ZIP_PATH" screenshots

echo ""
echo "✅ Screenshots saved to:"
echo "$OUTPUT_DIR"

echo ""
echo "✅ Archive created:"
echo "$ZIP_PATH"