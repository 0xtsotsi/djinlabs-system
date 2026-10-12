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
| Runtime-truth + één-scherm (mono-repo) | `/Context/` | `context.md` + `map.md` |
| Werk aan een Djin-agents universeel | `/djinlabs/skills/<agent>/` | `SKILL.md` |
| Log een experiment | `/djinlabs/_internal/experimenten/` | `CONTEXT.md` (parent) of `cos/CONTEXT.md` (voor COS-frontier) |
| Schrijf een leer-artefact (Sunday-audit-uitkomst) | `/djinlabs/_internal/leer-artefacten/` | parent `CONTEXT.md` |
| Werk aan COS-frontier (T-01..T-11) | `/djinlabs/_internal/experimenten/cos/` | `CONTEXT.md` + `wayfinder-map.md` + `tickets/` |
| Update hard-rules candidated draft | `/research/hard-rules-inventory.md` | — |
| Beslissing vastleggen (Ronde) | `/decisions.md` | — |

## Architectuur-lock (Ronde 19)

DjinLabs is sinds 2026-09-28 (commit c1ebd5b) **runtime-vrij**:

- Geen eigen server / queue / database / dashboard.
- Agent = folder met platte bestanden.
- COS = folder-agent (orthogonaal aan ventures en agents). Geen
  COS-eigen runtime; autoriteit = folder-auteur + Jev als gate.
- Eve + Convex = optioneel Webrnds-patroon, geen DjinLabs-canon.

Zie mono-repo `AGENTS.md` (architecture-lock-sectie) + `_shared/cos-
architecture-canon.md` (canonieke bron).

## Wat NIET hier zit

- Klant-folders → horen in `/webrnds/clients/`.
- Webrnds-specifieke R&D → hoort in `/webrnds/_internal/`.
- Per-run artifacts van een klantreis → horen in `/webrnds/clients/<slug>/klantreis-<id>/<fase>/`.
- Runtime-state-bestanden (JSON) — die horen in process-memory, niet hier. Zie `_shared/state-formats-canon.md`.
- Sync-discipline — bij elke wijziging in `djinlabs/` (template-onderhoud, skills, _internal): check `_shared/sync-discipline-canon.md` of deze AGENTS.md-router + umbrella-router + design-doc mee gesynced moeten worden. Geen hand-edits zonder `decisions.md`-vermelding.

## ICM-discipline

- Elke werk-folder krijgt zijn eigen `CONTEXT.md` voordat er inhoud in komt (U2).
- Per-run artifacts krijgen `review_status` in frontmatter (U6).
- Geen nesting > 3 zonder `CONTEXT.md` op elk niveau.
