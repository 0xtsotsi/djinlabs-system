# /webrnds/ — state

> Status: **skeleton-only**. Klant-folders, agent-wrappers en per-run artifacts zijn nog leeg; de canonieke boom staat op papier in `decisions.md` (Ronde 7-11).
> Last update: 2026-09-19.

## Wat staat

- Sub-router `AGENTS.md` (≤60 regels) — laat een agent weten wat hier woont.
- `start.md` — purpose + boundaries + done-definitie.
- `state.md` — dit bestand.
- `_rules.local.md` — Webrnds-instance rules (Ronde 8/Q8.2 cap).
- `_internal/` — Webrnds-spec R&D + leer-artefacten (lege folders).
- `_templates/` — Webrnds-spec templates voor klant-folders en agent-wrappers.
- 6 numbered pipeline stages (`01-research/` t/m `06-na-livegang/`).
- `skills/` — klant-spec wrapper-templates per fase.
- `clients/` — lege container; klant-folders worden aangemaakt via folder-shape-hook.
- `_archive/` — voor afgeronde klanten.

## Wat nog moet

- Eerste echte klant aanmaken via folder-shape-hook (om de skeleton te valideren tegen een echte casus).
- Agent-wrapper-templates schrijven in `skills/`.
- Klantfolder-template in `_templates/klant-template/`.
- Per-fase `CONTEXT.md`'s invullen met concrete inputs/process/outputs/human check.

## Status-frontmatter van deze state

```yaml
---
review_status: reviewed
created: 2026-09-19
reviewer: founder
reviewed: 2026-09-19
---
```
