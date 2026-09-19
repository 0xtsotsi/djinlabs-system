# /webrnds/ — sub-router

Onderneming #2: **klantreis-uitvoering**. Webrnds is de KVK-ingeschreven entiteit die factureert. Het is instance #1 van het DjinLabs-template (zie `decisions.md` Ronde 1 + Ronde 5).

## Wat hier woont

- Werk-flow-pipeline: `01-research/` → `06-na-livegang/` (numbering = sequence matters).
- Klant-folders onder `clients/<slug>/` met canonieke sub-shape.
- Klant-spec agent-wrappers in `clients/<slug>/_agents/` (includeren Djin-agents universeel uit `/djinlabs/skills/`).
- Webrnds-spec R&D + leer-artefacten in `_internal/` (geen experimenten — die horen in `/djinlabs/_internal/experimenten/`).

## Routing

| Task | Go to | Read |
|------|-------|------|
| Intake voor een nieuwe prospect | `01-research/` | `CONTEXT.md` |
| Bouw een offerte | `02-offer/` | `CONTEXT.md` |
| Run klantreis-fase X voor klant Y | `clients/<slug>/klantreis-<id>/<fase>/` | `CONTEXT.md` |
| Werk aan support/retainer voor klant Y | `clients/<slug>/klantreis-<id>/05-na-livegang/` | `CONTEXT.md` |
| Klant-spec agent aanpassen | `clients/<slug>/_agents/` | de agent-file zelf |
| Webrnds-spec R&D loggen | `_internal/r-and-d/` | `CONTEXT.md` |
| Leer-artefact (retros, audit) | `_internal/leer-artefacten/` | `CONTEXT.md` |

## Wat NIET hier zit

- Djin-agents universeel → `/djinlabs/skills/`.
- Experimenten → `/djinlabs/_internal/experimenten/`.
- Hard-rules candidated draft → `/research/hard-rules-inventory.md`.
- Canonieke bronnen → `/_shared/`.

## ICM-discipline

- Elke fase-folder (`01-research/` etc.) heeft precies één `CONTEXT.md`.
- Elke klantreis-folder heeft `start.md` + `state.md`.
- Elke klantfolder heeft `start.md` + `state.md` + `_rules.local.md`.
- Per-run artifacts krijgen `review_status` in frontmatter.

## Webrnds-instance rules (`_rules.local.md`)

- **Max 3 actieve klantreizen per klant** (Ronde 8/Q8.2). Afgeronde reizen → `clients/<slug>/_archive/`. Cap wordt afgedwongen door folder-shape-hook bij create.
- Codavo-shape services als aanbod-palet: websites, webapps, klantportalen, API-koppelingen, AI-integraties, GEO/AI-vindbaarheid, SaaS MVP.
- Lowercase-hyphenated klant-slugs (zie `_shared/naming-conventions.md`).
