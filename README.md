# claude-code-config

Personal Claude Code configuration — statusline script, hooks, and settings.

## Statusline

Displays useful context in the Claude Code status bar:

- **Host / Model / Repo / Branch**
- **Rate limit progress bars** (5h / 7d) — color shifts green → yellow → red
- **Total token usage** across all sessions
- **Current time**

```
thiraphat@ThinkBook ❯ Sonnet 4.6 ❯ 12MICKY/claude-code-config main ❯ 5h:████░░░░░░42% ❯ 7d:██░░░░░░░░18% ❯ 14:30
```

### Quick install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/12MICKY/claude-code-config/main/install.sh)
```

This will:
1. Download `statusline-command.sh` to `~/.claude/`
2. Set `statusCommand` in `~/.claude/settings.json` automatically

Restart Claude Code to apply.

### Manual install

```bash
# Download the script
curl -fsSL https://raw.githubusercontent.com/12MICKY/claude-code-config/main/statusline/statusline-command.sh \
  -o ~/.claude/statusline-command.sh
chmod +x ~/.claude/statusline-command.sh
```

Add to `~/.claude/settings.json`:

```json
{
  "statusCommand": "~/.claude/statusline-command.sh"
}
```

### Requirements

| Tool | Purpose |
|------|---------|
| `jq` | JSON parsing |
| `git` | Repo/branch detection |
| Terminal with true-color | Color output |

```bash
# Ubuntu / Debian
sudo apt install jq

# macOS
brew install jq
```
