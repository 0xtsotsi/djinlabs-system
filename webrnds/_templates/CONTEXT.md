# /webrnds/_templates/ — Webrnds-spec templates

Templates voor het aanmaken van nieuwe klant-folders en klantreizen. Hier staat de **canonieke skeleton** die de folder-shape-hook kopieert bij elke nieuwe klant of reis.

## Wat hier woont

- `klant-template/` — skeleton voor een nieuwe klantfolder (kopie naar `clients/<slug>/`).
- `klantreis-template/` — skeleton voor een nieuwe klantreis (kopie naar `clients/<slug>/klantreis-<id>/`).
- `fase-template/` — skeleton voor een fase-folder binnen een klantreis.
- `agent-wrapper-template/` — skeleton voor een klant-spec agent-wrapper.

## Discipline

- Templates zijn **leeg** (geen ingevulde klant-data).
- Een template wordt pas een instantie als de folder-shape-hook hem kopieert met `review_status: pending` in frontmatter.
- Templates worden nooit aangepast zonder dat `decisions.md` daarom vraagt.

## Wat NIET hier zit

- Klant-instanties → `clients/<slug>/`.
- Per-run artifacts → in de relevante fase-folder.
- Webrnds-wide regels → `_rules.local.md` van Webrnds.
