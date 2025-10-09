#!/usr/bin/env bash
set -e

ok() { printf "✅ %s\n" "$1"; }
ng() { printf "❌ %s\n" "$1"; }

echo "== Godot / VS Code / Android CLI 빠른 점검 =="

# 1) Godot
if command -v godot >/dev/null 2>&1; then
  godot --headless --version && ok "godot --headless --version"
else
  ng "godot 명령 미존재 (심볼릭 링크를 만들거나 VS Code에 실행 파일 절대경로를 넣으세요)"
fi

# 2) VS Code
if command -v code >/dev/null 2>&1; then
  code --version | head -n 1 && ok "code --version"
else
  ng "code 명령 미존재 (VS Code에서 Shell Command: Install 'code' in PATH 실행)"
fi

# 3) Java
if command -v java >/dev/null 2>&1; then
  java -version && ok "java -version"
else
  ng "java 미설치 (Temurin 17 등 설치 필요)"
fi

# 4) adb
if command -v adb >/dev/null 2>&1; then
  adb version && ok "adb version"
else
  ng "adb 미설치 (ANDROID_SDK_ROOT/platform-tools PATH 확인)"
fi

# 5) sdkmanager
if command -v sdkmanager >/dev/null 2>&1; then
  sdkmanager --version && ok "sdkmanager --version"
else
  ng "sdkmanager 미설치 또는 PATH 미설정 (cmdline-tools/latest/bin 추가)"
fi

# 6) emulator
if command -v emulator >/dev/null 2>&1; then
  emulator -version | head -n 1 && ok "emulator -version"
else
  ng "emulator 미설치 또는 PATH 미설정 (ANDROID_SDK_ROOT/emulator 추가)"
fi

echo "== 점검 완료 =="
