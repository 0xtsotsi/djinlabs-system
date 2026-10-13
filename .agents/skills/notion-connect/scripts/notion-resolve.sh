#!/bin/bash
# notion-resolve.sh — token-resolutie voor notion-connect skill.
#
# Doel: vind de lokale .gg/.env in de huidige werkdirectory, valideer dat
# NOTION_TOKEN aanwezig is en niet de placeholder is, en exec de Notion-MCP
# server met de token in de subprocess-env. De token wordt NOOIT naar
# stdout/stderr/returnwaarde geschreven.
#
# Discipline (per SKILL.md §Token-discipline + briefing 13 okt):
# - Geen echo van de token. Niet in exit-messages, niet in logs.
# - Geen kopie naar een andere file.
# - Bij failure: benoem de faal-stap, niet "iets klopt niet met auth".
#
# Gebruik:
#   ./notion-resolve.sh                  # exec Notion-MCP server (stdio transport)
#   ./notion-resolve.sh --check          # alleen valideren, geen exec; exit 0 = ok
#
# Afhankelijkheden:
#   - bash, set -eu
#   - Node.js + npx (npx -y @notionhq/notion-mcp-server)

set -eu

# --- 1. Bepaal huidige werkdirectory en zoek .gg/.env ---
# We zoeken in de huidige werkdirectory of één niveau omhoog (project kan in een
# sub-tenant zitten). .gg/.env moet gitignored en chmod 600 zijn.
CWD="$(pwd)"
ENV_FILE=""

for candidate in \
    "$CWD/.gg/.env" \
    "$CWD/../.gg/.env" \
    "$CWD/../../.gg/.env"; do
    if [ -f "$candidate" ]; then
        # Resolve symlinks + zorg dat het pad canonisch is
        ENV_FILE="$(cd "$(dirname "$candidate")" && pwd)/$(basename "$candidate")"
        break
    fi
done

if [ -z "$ENV_FILE" ]; then
    echo "notion-resolve: FOUT — geen .gg/.env gevonden in $CWD (of één niveau omhoog)." >&2
    echo "notion-resolve: verwacht gitignored, chmod 600, met NOTION_TOKEN=..." >&2
    echo "notion-resolve: bron: de mcp-notion-wrapper-discipline zoals vastgelegd in commit a56cb5f." >&2
    exit 1
fi

# --- 2. Source de env-file in een sub-shell, valideer token ---
# We sourcen niet in de parent-shell (zou de token in process-env lekken).
# We gebruiken een tijdelijke sub-shell die de env-variabelen set, en checken
# daarna dat NOTION_TOKEN niet leeg is en niet de placeholder.

# shellcheck disable=SC1090
NOTION_TOKEN="$(bash -c "set -a; . '$ENV_FILE'; set +a; printf '%s' \"\${NOTION_TOKEN:-}\"")"

if [ -z "$NOTION_TOKEN" ]; then
    echo "notion-resolve: FOUT — NOTION_TOKEN is leeg in $ENV_FILE." >&2
    echo "notion-resolve: token-resolutiebron = $ENV_FILE; geen waarde gevonden." >&2
    exit 2
fi

if [ "$NOTION_TOKEN" = "[REDACTED]" ]; then
    echo "notion-resolve: FOUT — NOTION_TOKEN is de unrotated placeholder '[REDACTED]' in $ENV_FILE." >&2
    echo "notion-resolve: rotatie vereist — zie commit a56cb5f wrapper-discipline." >&2
    exit 3
fi

# Token-waarde wissen uit de parent-shell ASAP (defense in depth)
unset NOTION_TOKEN

# --- 3. Check-modus: alleen valideren, niet exec ---
if [ "${1:-}" = "--check" ]; then
    echo "notion-resolve: OK — token gevonden in $ENV_FILE, exec niet uitgevoerd (--check)." >&2
    exit 0
fi

# --- 4. Exec de Notion-MCP server met token in subprocess-env ---
# We gebruiken de bestaande wrapper zodat de token-resolutie-paden identiek zijn
# aan wat de .gg/.mcp.json config voorschrijft. De wrapper zelf doet dezelfde
# validatie; deze skill-script doet 'm vooraf zodat we fail-fast kunnen zijn
# zonder dat npx een process opstart dat meteen weer stopt.

# Source opnieuw in een sub-shell voor de exec (token leeft alleen kort in
# die sub-shell, wordt nooit naar parent-env geschreven).
exec bash -c "set -a; . '$ENV_FILE'; set +a; exec npx -y @notionhq/notion-mcp-server"
