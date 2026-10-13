# Gate-matrix — 3 tiers, geldig voor alle DjinLabs-agents

Bron: Instinct-briefing 13 okt 2026, DEEL 1. Vastgelegd in `instinct-sync-mirror.md` Hand-edits-log v6.5 (COS-edit 2026-10-12 12:24).

## De drie tiers

### Tier 1 — auto

**Akkoord-klasse:** geen akkoord nodig.
**Default-acties waar dit op slaat:**

- Lezen (Notion, GitHub, lokale files, alles in read-scope van de skill)
- Samenvatten van wat gelezen is
- Status plaatsen op je **eigen** oppervlak (eigen Notion-status-pagina, eigen sectie in sync-mirror)

**Voorbeelden voor GG Coder:**

- `mcp__notion__notion-fetch` op sync-pagina, COS-status, eigen status
- Statuspost in `## GG Coder-status` van de lokale mirror
- Commit in deze repo binnen sync-discipline R16 §3 (kanoniek-neutraal staging)

### Tier 2 — Instinct-go

**Akkoord-klasse:** akkoord vereist via de sync-pagina **of** rechtstreeks van de Commander. Een INTENT is **niet** automatisch akkoord; Instinct (of de Commander) moet 'm expliciet goedkeuren.

**Default-acties waar dit op slaat:**

- Schrijven **buiten** je eigen oppervlak (Notion-pagina's van andere agents, sub-pages die niet van jou zijn)
- Repo-pushes naar `0xtsotsi/Djinlabs-Mothership` of andere shared repos
- Routines, schedulings, automatische agent-cycli aanpassen
- Page-create in Notion (nieuwe pagina's aanmaken, ook voor eigen doeleinden)
- Schrijven naar COS- of Hermes-secties van sync-mirror of sync-pagina

**Voor GG Coder:**

- Schrijven op COS-status of sync-pagina
- Push naar `0xtsotsi/Djinlabs-Mothership`
- Een Notion-page aanmaken, ook al is 'ie voor eigen gebruik

### Tier 3 — Darren-yes

**Akkoord-klasse:** expliciete toestemming van Darren (de founder). Een INTENT, agent-akkoord, of Instinct-go is **niet** voldoende voor deze klasse.

**Default-acties waar dit op slaat:**

- Geld, credits, betalingen, facturatie
- Klantcommunicatie (naar externe partijen, ook namens Darren)
- Handelen **namens Darren** in welke externe context dan ook
- **Canonieke promoties** (van staging naar `_shared/*canon.md`, of naar `decisions.md`)
- **Infra-wijzigingen** (servers, accounts, domeinen, secrets-rotatie, repo-instellingen, permissions)

**Voor GG Coder:**

- v0.2-promotie naar `_shared/cos-architecture-canon.md`
- Token-rotatie in `.gg/.env`
- Wijziging van `skills-lock.json` met nieuwe entries
- Wijziging van CI-workflows, repo-rulesets, branch-protection

## Anti-pattern: "een INTENT is akkoord"

Een INTENT is een **voorstel tot actie**, niet de actie zelf. Een goedgekeurd INTENT mag alleen uitgevoerd worden als:

- De goedgekeurde akkoord-klasse matcht de actie-klasse.
- De uitvoering binnen de gestelde termijn en scope blijft.

Een auto-INTENT mag niet leiden tot een Instinct-go- of Darren-yes-actie, ook al is 'ie goedgekeurd. En omgekeerd: een Darren-yes-vereiste kan niet "bevoorrecht" worden door een snelle goedkeuring via een ander kanaal.

## Welke tier voor wat — cheatsheet voor GG Coder

| Actie | Tier |
|---|---|
| Lezen van sync-pagina / COS-status / eigen status | auto |
| Statuspost op eigen Notion-status-pagina | auto |
| Commit in deze repo (kanoniek-neutraal staging) | auto |
| Lezen van GitHub mirror | auto |
| Schrijven op COS- of Hermes-sectie in sync-mirror | Instinct-go |
| Schrijven op sync-pagina zelf | Instinct-go |
| Push naar `0xtsotsi/Djinlabs-Mothership` | Instinct-go |
| Page-create in Notion | Instinct-go |
| Notion-call buiten read-scope of write-scope van een skill | Instinct-go |
| Wijziging in `.gg/.env` of andere secrets | Darren-yes |
| v0.2-promotie naar `_shared/` of `decisions.md` | Darren-yes |
| Klantcommunicatie namens Darren | Darren-yes |
| Geld/credits/facturatie | Darren-yes |
| CI-workflow, repo-ruleset, branch-protection | Darren-yes |

## Bij twijfel

Default naar de **strengste** tier die past. Een Instinct-go-vraag stellen voor iets dat misschien auto is, is geen probleem. Een auto-actie uitvoeren voor iets dat Darren-yes vereist, is een schending.
