# cowork-audit-plugin

A Claude Cowork plugin that adds local audit logging, compliance reporting, and CSV/JSON data exports — because Cowork doesn't have built-in audit logs yet.

> **Why this exists:** Claude Cowork runs locally on your machine, so Anthropic's built-in Audit Logs and Compliance API don't cover Cowork activity. This plugin fills that gap by maintaining a local audit trail.

---

## Features

- **Auto-logging** — Every tool invocation (file reads, writes, shell commands, web fetches) is automatically logged via pre/post hooks
- **Session summaries** — Human-readable session logs with task descriptions, tools used, and outcomes
- **Compliance reports** — Structured reports that check for policy violations, anomalous activity, and data handling issues
- **Data exports** — Export logs to CSV, JSON, or Markdown for sharing with IT or importing into SIEM tools
- **Manual notes** — Add your own entries to the audit trail

---

## Commands

Once installed, type `/` in any Cowork task to access:

| Command | Description |
|---|---|
| `/view-audit-log` | View recent Cowork activity |
| `/compliance-report` | Generate a structured compliance report |
| `/export-logs` | Export logs to CSV, JSON, or Markdown |
| `/log-note` | Add a manual note to the audit trail |

---

## Installation

1. Download or clone this repository
2. Open **Claude Desktop** and switch to the **Cowork** tab
3. Click **Customize** in the left sidebar
4. Click **Browse plugins** → **Upload plugin**
5. Select the `cowork-audit-plugin` folder
6. Click **Install**

Logs will start accumulating automatically from your next Cowork task.

---

## Log File Locations

All logs are stored locally on your machine. Nothing is sent to Anthropic or any external server.

| File | Contents |
|---|---|
| `~/.compliance-audit/audit.jsonl` | Raw tool-level events (one JSON object per line) |
| `~/.compliance-audit/sessions.log` | Human-readable session summaries |

---

## Plugin Structure

```
cowork-audit-plugin/
├── .claude-plugin/
│   └── plugin.json          # Plugin manifest
├── commands/
│   ├── view-audit-log.md    # /view-audit-log command
│   ├── compliance-report.md # /compliance-report command
│   ├── export-logs.md       # /export-logs command
│   └── log-note.md          # /log-note command
├── hooks/
│   └── hooks.json           # Pre/post tool hooks for auto-logging
├── scripts/
│   ├── log-pre-tool.sh      # Logs tool invocations
│   ├── log-post-tool.sh     # Logs tool results
│   └── export-logs.sh       # Exports logs to CSV or JSON
├── skills/
│   ├── audit-logger/        # Skill for session summaries
│   ├── compliance-checker/  # Skill for compliance review
│   └── data-exporter/       # Skill for log exports
└── README.md
```

---

## Verifying the Plugin
> Trust, but verify. This code is open — trust should come from reading it, not from anyone's words.
All plugin files are plain text. Before installing, you can inspect them directly:

```bash
# Check all scripts for any network calls
grep -r "curl\|wget\|http" cowork-audit-plugin/

# Read the hook scripts
cat cowork-audit-plugin/scripts/log-pre-tool.sh
cat cowork-audit-plugin/scripts/log-post-tool.sh
```

There are no compiled binaries, no external dependencies, and no network requests.

---

## Limitations

- Logs are **local only** — not synced to any cloud
- Requires macOS or Windows with Claude Desktop
- This plugin does not replace enterprise-grade SIEM solutions. It is a best-effort local audit trail for teams that need basic governance on Cowork activity
- For regulated industries (healthcare, finance, etc.), evaluate whether this meets your specific compliance requirements before relying on it

---

## Contributing

Issues and pull requests are welcome. If you find a security concern, please open an issue rather than a pull request.

---

## License

MIT
