---
name: gg-coder-intents
description: GG Coder INTENT-register, gescheiden van de Instinct-sync-mirror. Conform sync-discipline-canon Ronde 16 V1.1 §GG Coder-scope. Akkoord-klasse per INTENT expliciet aangegeven. Voert alleen INTENTs uit in eigen zone; cross-scope acties via Instinct-go of Darren-yes.
status: kanoniek-neutraal (staging)
date: 2026-10-13
owner: gg-coder
related:
  - ./instinct-sync-mirror.md (andere INTENTs, andere owner — niet overschrijven)
  - ../../../_shared/sync-discipline-canon.md (sync-discipline R16 V1.1)
  - ../../../../.agents/skills/notion-connect/SKILL.md (Notion-connect skill, status: klaar voor live-test, niet live)
pickup-regime: elke agent-sessie van GG Coder leest dit bestand bij start-up en pakt pending INTENTs op die binnen scope + akkoord vallen
---

# GG Coder — INTENT-register

> Eigen zone van GG Coder. Bevat INTENTs die door GG Coder zijn aangemaakt of opgepakt. Niet uitwisselbaar met `instinct-sync-mirror.md §INTENTS` (Instinct/COS-eigendom); alleen cross-references toegestaan.

## INTENT-2026-10-13-006 — Live-test van notion-connect skill

| Veld | Waarde |
|---|---|
| `intent_id` | `INTENT-2026-10-13-006` |
| `owner` | GG Coder |
| `actie` | Eerste live-test van `notion-connect` skill op eigen status-pagina — uitvoeren volgens §Live-test stappen 1–6 van `SKILL.md`. |
| `bestemming` | Notion page-id `3f84c5f9-f8e5-8194-962e-c35c70eb5676` (eigen GG Coder-status sub-page). Read-back op dezelfde page. |
| `effecten` | (a) één test-entry op eigen status-pagina in formaat `[YYYY-MM-DD HH:MM] [BRON: GG Coder] Live-test van notion-connect skill: route-test, eerste write op eigen sub-page.` (b) read-back van het laatste block, letterlijk gerapporteerd in de sessie-output. (c) status-wijziging van skill `klaar voor live-test, niet live` → `live` alleen bij geslaagde read-back. (d) bij mislukking: failure-notitie in deze file + GG Coder-status-pagina. |
| `kosten` | tijd ≈ 5 min, infra = 1 Notion-API write + 2 reads + 1 write op lokale mirror. Tokens = ongeveer 1 read + 1 write op token-discipline-bewuste sub-shell. **Geen geld, geen credits, geen klantcommunicatie, geen externe calls.** |
| `akkoord_klasse` | **auto** — live-test schrijft op eigen status-pagina (write-scope per `references/gate-matrix.md` + `SKILL.md §Write-scope`). Geen Instinct-go vereist. Geen Darren-yes. |
| `status` | **pending** — wacht op eerste sessie met actieve Notion-MCP (Commander regelt vanavond aan host-kant). |
| `pickup-trigger` | Elke GG Coder-sessie detecteert `pending` status en Notion-MCP in toolset; voert uit zonder extra akkoord. |
| `commit-discipline` | Geen push naar Djinlabs-Mothership (Instinct/COS-mandaat). Geen canonieke files aangeraakt. Geen Notion-write buiten eigen status-pagina. Geen Hermes/COS/Instinct-sectie in mirror aangeraakt — alleen `## GG Coder-status` en cross-reference-regel in `§INTENTS`. |

## Pickup-protocol voor de volgende sessie

Wanneer een GG Coder-sessie dit bestand leest met Notion-MCP **in de toolset**, voer dan onderstaande stappen uit. Bij twijfel: stop, post INTENT-006 als **failed** in dit bestand met de faal-stap, wacht op Instinct-go.

1. **Validatie vóór uitvoering** (auto-checks, geen write):
   - `tool_search("notion read")` → bevestig read-tools aanwezig. Zo niet: zeg letterlijk *"Notion-MCP read-tools niet gevonden in toolset"* (§Anti-verzonnen clausule), zet INTENT-006 op `failed` met reden, stop.
   - `notion-resolve.sh --check` vanuit de project-root van `djinlabs_system_design` → verwacht exit 0, stderr *"OK — token gevonden in .../.gg/.env"*. Andere output = fail-CLOSED, zet INTENT-006 op `failed` met exit-code, stop.

2. **Eerste read** (fetch + rapporteer letterlijk, geen write):
   - `mcp__notion__notion-fetch` op page `3f84c5f9-f8e5-8194-962e-c35c70eb5676`.
   - Rapporteer in de sessie-output, letterlijk, het laatste block.
   - Lege response → zeg *"Notion API gaf lege response op <page-id>"*, zet INTENT-006 op `failed`, stop.

3. **Write** (één entry, eigen scope):
   - Voeg in `mcp__notion__*` write-call een block toe op page `3f84c5f9-...-8194` met inhoud:
     ```
     [YYYY-MM-DD HH:MM] [BRON: GG Coder] Live-test van notion-connect skill: route-test, eerste write op eigen sub-page.
     ```
     Tijd = lokale `Europe/Amsterdam` in 24-uurs `HH:MM`. Geen seconden.
   - HTTP 401/403/404 → zet INTENT-006 op `failed` met exacte HTTP-status + page-id, stop.

4. **Verse read-back** (verplicht):
   - Verse `mcp__notion__notion-fetch` op dezelfde page.
   - Rapporteer letterlijk het laatste block.

5. **Verdict**:
   - **Read-back matcht** de geschreven entry letterlijk → zet INTENT-006 op `executed` in dit bestand; rapporteer letterlijk aan de gebruiker: *"Live-test geslaagd: <letterlijke laatste block-tekst>"*; update `SKILL.md` frontmatter `status` van *klaar voor live-test, niet live* → *live, status bevestigd op <datum>* via lokale commit (niet naar remote).
   - **Read-back matcht niet** → INTENT-006 → `failed`, reden, update lokale mirror, wacht op Instinct-go.

6. **Logging**: voeg een regel toe aan `## Hand-edits log` van `instinct-sync-mirror.md` met INTENT-006 uitkomst (executed/failed), datum, sessie-editor "GG Coder". Voeg een regel toe aan `## GG Coder-status` met dezelfde korte samenvatting.

## Status-log

- **2026-10-13 — GG Coder — INTENT-006 aangemaakt** — akkoord auto, status pending, wacht op Notion-MCP-sessie. Aanleiding: skill `notion-connect` was klaar voor live-test (commit `37437ce`) maar MCP-toolset niet in deze sessie; Commander regelt host-kant tonight.

## Niet in deze file

- INTENTs van COS, Hermes, of Instinct → die leven in `instinct-sync-mirror.md §INTENTS`.
- Canonieke files (`_shared/*canon.md`, `decisions.md`, `AGENTS.md`-routers) — niet aangeraakt.
- Token-waarden — niet vastgelegd, niet geciteerd. Token-discipline per `SKILL.md §Token-discipline`.
