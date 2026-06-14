#!/usr/bin/env bash
# Claude Code Config — one-line installer
# Usage: bash <(curl -fsSL https://raw.githubusercontent.com/12MICKY/claude-code-config/main/install.sh)

set -e

CLAUDE_DIR="$HOME/.claude"
REPO="https://raw.githubusercontent.com/12MICKY/claude-code-config/main"

echo "==> Installing Claude Code statusline..."

# Download statusline script
mkdir -p "$CLAUDE_DIR"
curl -fsSL "$REPO/statusline/statusline-command.sh" -o "$CLAUDE_DIR/statusline-command.sh"
chmod +x "$CLAUDE_DIR/statusline-command.sh"

# Patch settings.json
SETTINGS="$CLAUDE_DIR/settings.json"
if [ ! -f "$SETTINGS" ]; then
  echo '{}' > "$SETTINGS"
fi

# Add statusCommand if not already set
python3 - <<'PY'
import json, os
path = os.path.expanduser('~/.claude/settings.json')
with open(path) as f:
    cfg = json.load(f)
if not cfg.get('statusCommand'):
    cfg['statusCommand'] = '~/.claude/statusline-command.sh'
    with open(path, 'w') as f:
        json.dump(cfg, f, indent=2)
    print('  statusCommand set in settings.json')
else:
    print('  statusCommand already set, skipped')
PY

# Install slash command so /setup-statusline works in any project
COMMANDS_DIR="$CLAUDE_DIR/commands"
mkdir -p "$COMMANDS_DIR"
curl -fsSL "$REPO/.claude/commands/setup-statusline.md" -o "$COMMANDS_DIR/setup-statusline.md"
echo "  /setup-statusline command installed"

echo "==> Done! Restart Claude Code to see the statusline."
