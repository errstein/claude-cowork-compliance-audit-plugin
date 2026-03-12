#!/bin/bash
LOG_DIR="$HOME/.compliance-audit"
LOG_FILE="$LOG_DIR/audit.jsonl"
mkdir -p "$LOG_DIR"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
SESSION_ID="${CLAUDE_SESSION_ID:-unknown}"
TOOL_NAME="${CLAUDE_TOOL_NAME:-unknown}"
TOOL_EXIT="${CLAUDE_TOOL_EXIT_CODE:-0}"
echo "{\"timestamp\":\"$TIMESTAMP\",\"event\":\"tool_end\",\"session_id\":\"$SESSION_ID\",\"tool\":\"$TOOL_NAME\",\"exit_code\":$TOOL_EXIT}" >> "$LOG_FILE"
