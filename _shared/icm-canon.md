# ICM-canon pointer

**ICM = Interpretable Context Methodology.** Ordinary folders + readable files die een AI de juiste context geven per stap.

Pointer naar de canonieke bron: `community-workflow-kit/workflow-package-builder/references/icm-design-rules.md` (Jake Van Clief / RinDig, MIT, ICM-architect). Pointer naar de community-aanpassing: dezelfde kit, met de interview-flow + HTML-package-builder.

## Wat we hier overnemen

- **Vormen** kies je op de repeating unit van het werk: Pipeline / Record library / Knowledge bundle / Umbrella / Context map / System map.
- **Eén werk-folder heeft één job**, uitgelegd in zijn eigen `CONTEXT.md`.
- **Factory/product-split**: stable rules + templates in `_reference/` of `_templates/`; per-run artifacts in de werkfolder.
- **Status in frontmatter** op het artifact zelf: `review_status: pending|reviewed`.
- **Numbered folders** = sequence (alleen als sequence echt telt). Unnumbered = topics.
- **Walk-test**: kan een verse AI in deze folder starten met router + max 2 reads?

## Wat we hier Webrnds-eigen maken (Q11.1)

- `_internal/` i.p.v. `_reference/` — past bij Webrnds' scope (R&D + leer-artefacten, geen externe reference-bibliotheek).
- `start.md` + `state.md` naast `CONTEXT.md` — `CONTEXT.md` is de fase-als-kamer; `start.md`/`state.md` zijn de U1-onderneming-als-bedrijf (U5 date-wins zit in de naam).
- Numbered pipeline stages (`01-research/` etc.) waar sequence telt (klantreis-fasen), niet waar het topics zijn (klant-overstijgende templates).

## Wat NIET ICM is

- ICM levert geen runtime queues, geen concurrent multi-user coordination, geen live integrations, geen autonomous branching. Dat is engineering, niet folder-design.
- Een folder-tree is geen exec-strategie. De tree faciliteert het werk; het werk bepaalt of de tree klopt.
