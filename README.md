# claude-code-config

Personal Claude Code configuration — statusline, hooks, settings.

## Statusline

แสดงข้อมูลใน Claude Code status bar:
- **Host / Model / Repo / Branch**
- **Progress bar** rate limit (5h / 7d) สีเขียว→เหลือง→แดงตามการใช้งาน
- **Token usage** รวมทั้งหมด
- **เวลาปัจจุบัน**

### Install (one-line)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/12MICKY/claude-code-config/main/install.sh)
```

### Manual install

```bash
# 1. Download script
curl -fsSL https://raw.githubusercontent.com/12MICKY/claude-code-config/main/statusline/statusline-command.sh \
  -o ~/.claude/statusline-command.sh
chmod +x ~/.claude/statusline-command.sh

# 2. Add to ~/.claude/settings.json
# { "statusCommand": "~/.claude/statusline-command.sh" }
```

### Requirements

- `jq` — JSON parsing
- `git` — repo/branch detection
- Terminal with true-color support

```bash
# Ubuntu/Debian
sudo apt install jq

# macOS
brew install jq
```

### Preview

```
thiraphat@ThinkBook ❯ Sonnet 4.6 ❯ 12MICKY/claude-code-config main ❯ 5h:████░░░░░░42% ❯ 7d:██░░░░░░░░18% ❯ 14:30
```
