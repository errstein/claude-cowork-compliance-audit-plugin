#!/bin/bash
LOG_DIR="$HOME/.compliance-audit"
LOG_FILE="$LOG_DIR/audit.jsonl"
mkdir -p "$LOG_DIR"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
SESSION_ID="${CLAUDE_SESSION_ID:-unknown}"
TOOL_NAME="${CLAUDE_TOOL_NAME:-unknown}"
TOOL_INPUT=$(echo "${CLAUDE_TOOL_INPUT:-{}}" | head -c 500)
echo "{\"timestamp\":\"$TIMESTAMP\",\"event\":\"tool_start\",\"session_id\":\"$SESSION_ID\",\"tool\":\"$TOOL_NAME\",\"input\":$TOOL_INPUT}" >> "$LOG_FILE"
