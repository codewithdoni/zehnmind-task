#!/bin/zsh
set -euxo pipefail

cd "$CI_PRIMARY_REPOSITORY_PATH"

git clone --depth 1 -b stable https://github.com/flutter/flutter.git flutter
export FLUTTER_ROOT="$PWD/flutter"
export PUB_CACHE="$HOME/.pub-cache"
export PATH="$FLUTTER_ROOT/bin:$PUB_CACHE/bin:$PATH"

flutter --version
flutter precache --ios
flutter pub get

# FlutterFire CLI (for upload-crashlytics-symbols)
"$FLUTTER_ROOT/bin/dart" pub global activate flutterfire_cli
"$PUB_CACHE/bin/flutterfire" --version || true

# Optional codegen
"$FLUTTER_ROOT/bin/dart" run build_runner build --delete-conflicting-outputs || true

cd ios
pod install --repo-update
