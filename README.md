# claude-code-config

Personal Claude Code configuration — statusline, hooks, settings.

## Statusline

Script ที่ใช้แสดงข้อมูลใน Claude Code status bar:
- Host / Model / Repo / Branch
- Progress bar การใช้งาน rate limit (5h / 7d)
- Token usage รวม
- เวลาปัจจุบัน

### Install

```bash
cp statusline/statusline-command.sh ~/.claude/statusline-command.sh
chmod +x ~/.claude/statusline-command.sh
```

แล้ว set ใน `~/.claude/settings.json`:

```json
{
  "statusCommand": "~/.claude/statusline-command.sh"
}
```
