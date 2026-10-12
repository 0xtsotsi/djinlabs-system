# /webrnds/ — state

> Status: **skeleton met venture-context geland**. Ronde 19 (commit
> c1ebd5b, 2026-09-28) heeft Webrnds' relatie tot DjinLabs vastgelegd
> (instance #1; geen runtimes in DjinLabs zelf; Eve + Convex =
> optioneel Webrnds client-setup-patroon).
> Last update: 2026-10-10.

## Wat staat

- Sub-router `AGENTS.md` (≤60 regels) — bijgewerkt voor Ronde 19 + Context/-pointer.
- `start.md` — purpose + boundaries + done-definitie.
- `state.md` — dit bestand.
- `README.md` — entry-point met quick-links naar venture-context en mono-repo-context.
- `Context/context.md` + `Context/map.md` — venture-level runtime-truth + één-scherm overzicht.
- `_rules.local.md` — Webrnds-instance rules (Ronde 8/Q8.2 cap, services, naming, factory/product split).
- `_internal/CONTEXT.md` — parent-context voor Webrnds-spec R&D + leer-artefacten.
- `_templates/` — `fase-template/`, `klantreis-template/`.
- **6 numbered pipeline stages** met parent `CONTEXT.md`:
  - `01-research/CONTEXT.md` — ingevuld (referentie-template).
  - `02-offer/` t/m `06-na-livegang/` — `CONTEXT.md` nog in te vullen.
- `skills/CONTEXT.md` — klant-spec wrapper-templates per fase (parent-context).
- `clients/` — lege container; klant-folders worden aangemaakt via folder-shape-hook.
- `_archive/CONTEXT.md` — parent-context voor afgeronde klanten (regels voor archivering).

## Wat nog moet

- **Eerste echte klant** aanmaken via folder-shape-hook (om de skeleton te valideren tegen een echte casus). **W-01.**
- **Agent-wrapper-templates** schrijven in `skills/`. **W-02** (na W-01).
- **Klantfolder-template** invulling in `_templates/klantreis-template/`. **W-03** (na W-01).
- **Per-fase `CONTEXT.md` voor 02 t/m 06** — `01-research/CONTEXT.md` is de referentie. **W-04** (kan parallel, geen blocker).
- **Eve + Convex als Webrnds client-setup-patroon** (Ronde 19 motie 5). Patronen in `research/vercel-eve-cos-runtime-research.md` (gelabeld `client-patroon-research`). **W-05** (na W-01 + founder-call).

## Status-frontmatter van deze state

```yaml
---
review_status: reviewed
created: 2026-09-19
reviewer: founder
reviewed: 2026-09-19
last_update: 2026-10-10
last_update_reason: Venture-context aangemaakt + AGENTS.md bijgewerkt door COS
next_review: bij W-01 (eerste echte klant) of Ronde 20
---
```
