Install the Claude Code statusline from 12MICKY/claude-code-config by running these shell commands:

```bash
curl -fsSL "https://raw.githubusercontent.com/12MICKY/claude-code-config/main/statusline/statusline-command.sh" \
  -o "$HOME/.claude/statusline-command.sh" && chmod +x "$HOME/.claude/statusline-command.sh"
```

Then patch `~/.claude/settings.json` to add `statusCommand`:

```bash
python3 - <<'EOF'
import json, os
p = os.path.expanduser("~/.claude/settings.json")
with open(p) as f:
    cfg = json.load(f)
cfg["statusCommand"] = os.path.expanduser("~/.claude/statusline-command.sh")
with open(p, "w") as f:
    json.dump(cfg, f, indent=2)
EOF
```

After both commands succeed, tell the user: "Statusline installed. Restart Claude Code to see it."
