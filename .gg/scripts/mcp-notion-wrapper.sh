#!/bin/bash
# Wrapper to start the @notionhq/notion-mcp-server stdio subprocess with the
# Notion integration secret read from .gg/.env (gitignored).
#
# Why a wrapper:
# .gg/.mcp.json declares env.NOTION_TOKEN = "${env:NOTION_TOKEN}", but
# Claude Code resolves that against the parent's process environment at MCP
# startup. The shell env does NOT carry NOTION_TOKEN, so the subprocess
# spawns with an empty token, the server's first Notion call returns 401,
# and the MCP registration silently fails (tools never appear in the
# session). This wrapper sources .gg/.env and execs the server so the token
# is present in the subprocess env, with the secret kept out of the JSON
# config (per .gg/.mcp.json docstring).
#
# Token rotation: edit .gg/.env (NOTION_TOKEN=...) and restart the MCP
# client. No JSON edit needed.

set -eu

ENV_FILE="$(cd "$(dirname "$0")/.." && pwd)/.env"

if [ ! -f "$ENV_FILE" ]; then
  echo "mcp-notion-wrapper: missing $ENV_FILE" >&2
  exit 1
fi

# Fail closed if the token is the unrotated placeholder.
set -a
. "$ENV_FILE"
set +a

if [ -z "${NOTION_TOKEN:-}" ] || [ "$NOTION_TOKEN" = "[REDACTED]" ]; then
  echo "mcp-notion-wrapper: NOTION_TOKEN missing or placeholder in $ENV_FILE" >&2
  exit 1
fi

exec npx -y @notionhq/notion-mcp-server "$@"