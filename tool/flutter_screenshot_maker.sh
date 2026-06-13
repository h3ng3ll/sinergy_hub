#!/bin/bash
set -e

ZIP_NUMBER="$1"
DEVICE="${2:-iPhone 14 Plus}" # Cause it supports uploading dimensions of screen for App Store

PROJECT_ROOT="$PWD"
OUTPUT_DIR="$PROJECT_ROOT/outputs/screenshots"

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
  --web-port 5000 \
  --web-hostname localhost \
  --flavor=development \
  --dart-define=DARTENV="development" \
  --dart-define=DEV_FIREBASE_WEB_PUSH_CERTIFICATE=BCKEAwpmH6SLxg7xEcpu6ClB70l6qDefo0EHIU2-gwR6WbmVsDE4vpDvpt0o1hjgWvE3Jvvz8GqTwEttKpeq-YE \
  --dart-define=DEV_SERVER_CLIENT_ID="752696702645-7bc646mgsn0vfe37qvquvf5fh4gjuehv.apps.googleusercontent.com" \
  --dart-define=FIREBASE_PROJECT_WEB_URL="synergyhub-a3e1b.web.app"
  -d "$DEVICE"

cd "$PROJECT_ROOT/outputs"

echo "✅ Screenshots saved to:"
echo "$OUTPUT_DIR"

