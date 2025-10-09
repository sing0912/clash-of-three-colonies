# === 고정 경로 (질문에서 주신 값) ===
GODOT_APP="/Applications/Godot.app"
GODOT_BIN="$GODOT_APP/Contents/MacOS/Godot"
VSCODE_APP="/Applications/Visual Studio Code.app"
VSCODE_CODE="$VSCODE_APP/Contents/Resources/app/bin/code"

# === 링크를 만들 위치(둘 다 시도; 하나만 있어도 OK) ===
BIN1="/opt/homebrew/bin"   # Apple Silicon Homebrew 기본
BIN2="/usr/local/bin"      # Intel/기타

# VS Code 'code' 등록
if [ -x "$VSCODE_CODE" ]; then
  sudo mkdir -p "$BIN1" "$BIN2"
  sudo ln -sf "$VSCODE_CODE" "$BIN1/code" 2>/dev/null || true
  sudo ln -sf "$VSCODE_CODE" "$BIN2/code" 2>/dev/null || true
  echo "✅ code linked"
else
  echo "❌ VS Code 실행 파일을 찾지 못했습니다: $VSCODE_CODE"
fi

# Godot 'godot' 등록
if [ -x "$GODOT_BIN" ]; then
  sudo ln -sf "$GODOT_BIN" "$BIN1/godot" 2>/dev/null || true
  sudo ln -sf "$GODOT_BIN" "$BIN2/godot" 2>/dev/null || true
  echo "✅ godot linked"
else
  echo "❌ Godot 실행 파일을 찾지 못했습니다: $GODOT_BIN"
fi

# 검증
echo "---- verify ----"
command -v code && code --version | head -n 1
command -v godot && godot --headless --version
