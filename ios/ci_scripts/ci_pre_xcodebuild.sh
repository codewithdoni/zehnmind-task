#!/bin/zsh
set -euxo pipefail
cd "$CI_PRIMARY_REPOSITORY_PATH"
export FLUTTER_ROOT="$PWD/flutter"
export PATH="$FLUTTER_ROOT/bin:$HOME/.pub-cache/bin:$PATH"
flutter --version
flutter pub get

# Extract version and build number from pubspec.yaml
VERSION_LINE=$(grep "^version:" pubspec.yaml)
VERSION_FULL=${VERSION_LINE#version: }
VERSION_FULL=${VERSION_FULL//\"/}  # Remove quotes if present
VERSION_NAME=${VERSION_FULL%+*}    # Everything before the +
BUILD_NUMBER=${VERSION_FULL#*+}    # Everything after the +

echo "Version: $VERSION_NAME, Build: $BUILD_NUMBER"

# Pass version explicitly to flutter build
flutter build ios \
  --config-only \
  --release \
  --build-name="$VERSION_NAME" \
  --build-number="$BUILD_NUMBER" \
  -t lib/main.dart
