---
name: notion-connect
description: Bereik Notion via de bestaande mcp-notion-wrapper en de drie-tier gate-matrix (auto / Instinct-go / Darren-yes). Read-scope is sync-pagina, COS-status, eigen GG Coder-status, GitHub mirror. Write-scope is uitsluitend de eigen GG Coder-status sub-page. Page-create en schrijven elders vereisen Instinct-go. Token-resolutie uitsluitend via de wrapper die `.gg/.env` sourcet — nooit de token in output, logs of commits.
status: kanoniek-neutraal staging (skill in `.agents/`, niet in `_shared/`)
date: 2026-10-13
owner: gg-coder
canonieke-discipline: volgt `_shared/sync-discipline-canon.md` Ronde 16 V1.1; geen canonieke files, geen `decisions.md`-edit, geen AGENTS.md-router-edit.
related:
  - ../../gg/.mcp.json (MCP-config die deze skill aanroept)
  - ../../gg/scripts/mcp-notion-wrapper.sh (wrapper die NOTION_TOKEN levert)
  - ../../gg/.env (token-bron, gitignored, chmod 600 — NOOIT openen door deze skill)
  - ../../../djinlabs/_internal/experimenten/cos/_internal/staging/instinct-sync-mirror.md (lokale sync-mirror; post eigen zone hier, niet op Notion behalve via de schrijf-scope hieronder)
provenance: GG Coder build op 2026-10-13 nav Instinct-briefing 13 okt (DEEL 3, NOTION-SKILL SPEC). Eerste git-commit van de skill; nog **niet live** — wacht op live-test door sessie met actieve Notion-MCP (zie §Live-test hieronder).
gate-matrix:
  auto: "lezen, samenvatten, status op je eigen oppervlak"
  instinct-go: "schrijven buiten je eigen oppervlak, repo-pushes, routines/schedules wijzigen"
  darren-yes: "geld/credits, klantcommunicatie, namens Darren, canonieke promoties, infra-wijzigingen"
---

# Notion-connect — SKILL

> **Status:** **klaar voor live-test**, niet live. Eerste commit op 2026-10-13 door GG Coder. De skill wordt pas "live" genoemd nadat een sessie met actieve Notion-MCP de route-test heeft gedraaid (zie §Live-test).

## Wat deze skill doet

Bereik de Notion sync-pagina + COS-status + eigen GG Coder-status + GitHub mirror vanuit deze repo, met strikte scope-discipline en read-back-verplichting na elke write.

## Wat deze skill **niet** doet

- **Geen** page-create. Page-create = Instinct-go.
- **Geen** schrijven buiten de eigen GG Coder-status sub-page `3f84c5f9-f8e5-8194-962e-c35c70eb5676`. Elders schrijven = Instinct-go.
- **Geen** acties in de Darren-yes-klasse (geld/credits/klantcommunicatie/canonieke promoties/infra-wijzigingen). Intent of agent-akkoord is **geen** toestemming voor deze klasse.
- **Geen** token in output, logs, commits of welke tekstuele representatie dan ook. Token-resolutie loopt uitsluitend via de bestaande wrapper (zie §Token-discipline).

## Activatie-trigger

Vragen die deze skill activeren (niet limitatief):

- "check notion" / "notion check" / "haal notion op"
- "post op notion" / "schrijf naar notion" (write-path)
- Elke vermelding van een Notion-page-id die in de read-scope of write-scope valt

## Laad-volgorde (in elke sessie die Notion nodig heeft)

Volg COS' laad-route (per Instinct-briefing 13 okt, DEEL 3 punt 1):

1. **Eerst:** `tool_search("notion read")` om read-MCP-tools te activeren.
2. **Pas bij schrijfwerk:** `tool_search("notion write")` om write-MCP-tools te activeren.
3. **Token-resolutie:** roep `scripts/notion-resolve.sh` aan. Die zoekt `cwd/.gg/.env`, valideert `NOTION_TOKEN` (fail-CLOSED als placeholder/empty), en exporteert de token in de subprocess-env zonder 'm te printen.
4. **Spawn de MCP-wrapper:** `cwd/.gg/scripts/mcp-notion-wrapper.sh` (exec `npx -y @notionhq/notion-mcp-server`).
5. **Eerste fetch:** verse `mcp__notion__notion-fetch` op de sync-pagina om te bevestigen dat de verbinding werkt voordat je iets doet.

Als stap 3 faalt (geen `.gg/.env`, lege token, placeholder): **stop**, post een INTENT op de eigen status-pagina via de lokale mirror (kanoniek-neutraal staging), wacht op Instinct-go. **Niet** gokken, **niet** een "lijkt te werken"-samenvatting typen.

## Read-scope

Vier doelen, allemaal read-only:

| Doel | Page-id | Doel |
|---|---|---|
| Sync-pagina | `3e44c5f9-f8e5-81d0-ad77-db30272dc92c` | Instinct ↔ Hermes ↔ COS primair kanaal |
| COS status sub-page | `3f84c5f9-f8e5-81c0-a516-d35621d83c51` | COS post hier |
| Eigen status sub-page | `3f84c5f9-f8e5-8194-962e-c35c70eb5676` | GG Coder post hier (write-scope) |
| GitHub mirror | `0xtsotsi/Djinlabs-Mothership`, file `cos/_internal/staging/instinct-sync-mirror.md` | COS-owned local-to-GitHub transfer |

Read-acties zijn **auto**-klasse: geen akkoord nodig, geen INTENT nodig.

## Write-scope

**Uitsluitend** de eigen GG Coder-status sub-page `3f84c5f9-f8e5-8194-962e-c35c70eb5676`. Alles buiten die pagina = Instinct-go (intents, repo-pushes, routines, schedulings) of Darren-yes (canonieke promoties, infra, klantcommunicatie, geld/credits).

**Entry-formaat** op de eigen status-pagina (verplicht, conform briefing 13 okt DEEL 3 punt 4):

```
[YYYY-MM-DD HH:MM] [BRON: GG Coder] <inhoud>
```

Tijd = lokale Amsterdam-tijd (Europe/Amsterdam), in 24-uurs `HH:MM`. Geen UTC, geen seconden.

**Inhoud-discipline:**

- Korte, feitelijke mededelingen. Geen aannames over wat anderen posten.
- Bij twijfel: stilte of een "vraag-aan-Instinct" blok.
- Geen emoji, geen decoratie — Markdown plain.
- Geen cross-references naar niet-canonieke bestanden zonder pad.

## Read-back na elke write (verplicht)

Na elke `mcp__notion__*`-write **moet** een verse `mcp__notion__notion-fetch` op de target-page de zojuist geschreven entry letterlijk teruglezen. De letterlijke tekst van het laatste block wordt **gerapporteerd in de sessie-output**, niet alleen in de GG Coder-status.

**Zonder read-back = geen "gelukt".** Een write zonder gerapporteerde read-back is een mislukte operatie, ook als de API-call geen error gaf. Noteer dit in de lokale mirror en de GG Coder-status-pagina.

## Anti-verzonnen clausule (exact overgenomen uit briefing 13 okt, DEEL 3 punt 6)

Bij lege bron of tool-fout: **benoem welke bron/tool faalde**. Nooit een plausibele digest typen.

Toepassing:

- Lege `mcp__notion__notion-fetch`-response → zeg letterlijk "Notion API gaf lege response op <page-id>", niet "pagina lijkt leeg".
- `tool_search` zonder resultaat → zeg "Notion-MCP read-tools niet gevonden in toolset", niet "Notion is niet bereikbaar".
- `notion-resolve.sh` exit-code ≠ 0 → zeg welke stap faalde (geen `.gg/.env` gevonden, token placeholder, etc.), niet "iets klopt niet met de authenticatie".
- 401/403/404 van Notion API → noem de exacte HTTP-status + page-id, niet "Notion gaf een fout".

## Token-discipline (verbatim uit briefing 13 okt, DEEL 3 punt 2)

Token-resolutie loopt **alleen** via `.gg/scripts/mcp-notion-wrapper.sh`. De wrapper:

1. Zoekt `cwd/.gg/.env`.
2. Source-t 'm met `set -a; . "$ENV_FILE"; set +a`.
3. Controleert dat `NOTION_TOKEN` niet leeg is en niet de placeholder `[REDACTED]`.
4. Exec-t `npx -y @notionhq/notion-mcp-server` zodat de token in de subprocess-env staat, niet in de parent-shell-omgeving en niet in een environment-variabele die zichtbaar is voor andere processen.

**Verboden in deze skill (en in de sessie die haar gebruikt):**

- ❌ Token printen, echo'en, loggen, in commit zetten, in skill-output zetten, in welke tekst dan ook.
- ❌ Token uit `.gg/.env` kopiëren naar een andere file (ook niet `~/.claude/.env` of een user-level dotenv).
- ❌ `process.env.NOTION_TOKEN` in een script dat output naar terminal schrijft.
- ❌ `env | grep NOTION` of equivalent.

**Toegestaan:**

- ✅ `notion-resolve.sh` aanroepen, exit-code en stderr-tekst gebruiken, **maar niet de token zelf**.
- ✅ Wrapper aanroepen, MCP-tools gebruiken, read-back-rapporten schrijven zonder de token te noemen.

## INTENT-register

Voor elke B/C-actie (schrijven buiten eigen oppervlak, repo-pushes, routines/schedules, canonieke promoties, infra-wijzigingen, klantcommunicatie) wordt een INTENT gemaakt. Velden:

- `intent_id`: `INTENT-YYYY-MM-DD-NNN`
- `owner`: GG Coder
- `actie`: korte omschrijving
- `bestemming`: page-id, repo, file, of infra-target
- `effecten`: welke side-effects
- `kosten`: tijd, infra, tokens, geld (laatste = Darren-yes verplicht)
- `akkoord_klasse`: auto | instinct-go | darren-yes
- `status`: pending | approved | executed | failed

INTENTs worden **niet** in deze skill zelf gemaakt (skill is read+write binnen eigen scope); INTENTs leven in de lokale mirror en op de eigen Notion-status-pagina als ze de eigen scope overstijgen.

## Live-test (eerste sessie met actieve Notion-MCP)

Volg COS' route-test-patroon, per briefing 13 okt DEEL 3 laatste alinea:

1. **Laad** read-tools via `tool_search("notion read")`.
2. **Fetch** de eigen status-pagina `3f84c5f9-f8e5-8194-962e-c35c70eb5676` en rapport de letterlijke laatste block-tekst.
3. **Schrijf** een test-entry in het verplichte formaat `[<ts>] [BRON: GG Coder] Live-test van notion-connect skill: route-test, eerste write op eigen sub-page.`.
4. **Verse fetch** opnieuw op dezelfde page, rapport de letterlijke laatste block-tekst (inclusief de test-entry).
5. **Alleen als read-back matcht:** rapporteer letterlijk aan de gebruiker in de sessie: "Live-test geslaagd: <letterlijke laatste block-tekst>".
6. **Als read-back niet matcht:** rapport letterlijk aan de gebruiker + zeg "Live-test mislukt: <wat er wel staat>", update de lokale mirror met een failure-notitie, wacht op Instinct-go voordat de skill als "live" wordt beschouwd.

Pas na een **geslaagde live-test** is de skill "live". Tot die tijd is de status "klaar voor live-test, wacht op MCP-activering".

## Niet adres in deze skill

- **Globale MCP-configuratie** (`~/.claude/settings.json` of equivalent) — user-level state, niet deze skill's verantwoordelijkheid. Project-scoped is de keuze, geen globale activatie.
- **Andere projecten** — deze skill werkt in `djinlabs_system_design`. Kopiëren naar andere projecten = handmatig, met eigen `.gg/.env` per project.
- **Hermes- of COS-skill-scope** — die zijn eigendom van Hermes/COS. GG Coder schrijft niet in hun Notion-secties of bestanden.

## Wijzigingen-log

| Datum | Editor | Inhoud | Reden |
|---|---|---|---|
| 2026-10-13 | GG Coder | Eerste commit van de skill: SKILL.md + scripts/notion-resolve.sh + references/page-id-format.md + references/gate-matrix.md. | Instinct-briefing 13 okt DEEL 3 (NOTION-SKILL SPEC). Status: **klaar voor live-test, niet live**. |
| 2026-10-13 | GG Coder | **Runner-discovery fix + INTENT-006 aangemaakt.** (a) Skill nu zichtbaar via `~/.gg/skills/notion-connect/` als echte directory (eerst symlink, toen ontdekt via `dist/core/skills.js` dat Node-Dirent.isDirectory geen symlinks volgt — gefixt met `cp -RL`). Idem gefixt voor `~/.gg/skills/opencli-browser/` en `~/.gg/skills/opencli-usage/`. `grill-with-ui` blijft een projectsymlink op verzoek van eigenaar. (b) `notion-resolve.sh --check` geverifieerd: exit 0, token-discipline ok, token niet in output (anti-verzonnen anker functioneert). (c) INTENT-006 in `gg-coder-intents.md` aangemaakt voor de live-test pickup. Geen Notion-fetch uitgevoerd in deze sessie: `tool_search("notion read")` gaf geen MCP-read-tools terug (Notion-MCP moet aan host-kant geactiveerd worden, niet door agent). Status blijft **klaar voor live-test, niet live**. | Skill was niet auto-ontdekt door runner door Node-Dirent.isDirectory bug; nu wel. Zonder deze fix zou geen enkele sessie de skill ooit uit zichzelf aanroepen. |
