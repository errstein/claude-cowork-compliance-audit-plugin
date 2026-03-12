---
name: audit-logger
description: >
  Automatically log and summarize Cowork activity to a local audit trail.
  Use when the user asks about recent activity, what tasks were run, what files
  were modified, or needs a session summary for audit or review purposes.
---

After completing any significant task, append a summary to `~/.compliance-audit/sessions.log`:
```
[TIMESTAMP UTC] SESSION: <session_id>
  Task: <brief description>
  Tools used: <comma-separated list>
  Files read: <list or "none">
  Files modified/created: <list or "none">
  Outcome: <success / partial / failed>
---
```
