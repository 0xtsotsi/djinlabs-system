# /djinlabs/ — sub-router

Onderneming #1: **template-onderhoud**. DjinLabs is geen KVK-ingeschreven entiteit (zie Ronde 3/Q3.1 verduidelijking in `decisions.md`); het is de interne orchestration layer + merklaag + strategie.

## Wat hier woont

- Het DjinLabs-template (de canonieke skeleton die Webrnds en toekomstige tenants includen).
- Djin-agents universeel (scaffold-only; klant-spec wrappers leven in Webrnds).
- R&D-pot-tracking, leer-artefacten, klant-overstijgende experimenten.
- Template-onderhoud dat via Sunday-audit wordt gescand.

## Routing

| Task | Go to | Read |
|------|-------|------|
| Werk aan een Djin-agents universeel | `/djinlabs/skills/<agent>/` | `SKILL.md` |
| Log een experiment | `/djinlabs/_internal/experimenten/` | `CONTEXT.md` (nog niet aangemaakt) |
| Schrijf een leer-artefact (Sunday-audit-uitkomst) | `/djinlabs/_internal/leer-artefacten/` | `CONTEXT.md` (nog niet aangemaakt) |
| Update hard-rules candidated draft | `/research/hard-rules-inventory.md` | — |
| Beslissing vastleggen | `/decisions.md` | — |

## Wat NIET hier zit

- Klant-folders → horen in `/webrnds/clients/`.
- Webrnds-specifieke R&D → hoort in `/webrnds/_internal/`.
- Per-run artifacts van een klantreis → horen in `/webrnds/clients/<slug>/klantreis-<id>/<fase>/`.

## ICM-discipline

- Elke werk-folder krijgt zijn eigen `CONTEXT.md` voordat er inhoud in komt (U2).
- Per-run artifacts krijgen `review_status` in frontmatter (U6).
- Geen nesting > 3 zonder `CONTEXT.md` op elk niveau.
