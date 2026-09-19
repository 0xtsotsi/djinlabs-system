# _shared/ — canonieke bronnen

Gedeelde waarheid voor alle ondernemingen in deze mono-repo (DjinLabs, Webrnds, en toekomstige tenants).

## Wat zit er

- `hard-rules.md` — de universele U-rules + per-instance contrast. Pointer naar `research/hard-rules-inventory.md` voor de candidated draft met provenance.
- `naming-conventions.md` — slug-format, datestamps, status-frontmatter. Consistent over alle ondernemingen.
- `icm-canon.md` — wat is een Record library, wat is Umbrella, de walk-test. Pointer naar de ICM-canon (`workflow-package-builder/references/icm-design-rules.md`) in de community-workflow-kit.

## Wat NIET hier zit

- Klant- of project-data → hoort in `/webrnds/clients/`.
- Experimenten → horen in `/djinlabs/_internal/experimenten/`.
- Templates per onderneming → horen in `/<instance>/_templates/`.
- Per-run artifacts → horen in de product-folders, niet hier.

## Onderhoud

Een file in `_shared/` wordt alleen bijgewerkt als een beslissing in `decisions.md` daarom vraagt. Geen ad-hoc-edits.
