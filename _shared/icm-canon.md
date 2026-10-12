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

## Agent-as-Blob (Ronde 18 sync, 2026-09-27)

- **agent = Blob** — in GG Coder is een agent één Blob in `~/.blobbies/blobs/<uuid>/`; ICM spiegelt canonieke kennis (Markdown) in `~/.oathdriven-coder/icm/<tenant>/<slug>/`.
- ICM is canoniek (Markdown, leesbaar); Blob-folders zijn runtime-state (JSON, niet canoniek).
- **Bridge read-only v1** — `~/.blobbies/` wordt in v1 alleen gelezen via `@oathdriven/gg-blob-bridge`; geen write naar blobbies-state.
- **Sync-discipline R16 actief** — Markdown-tree ↔ JSON-state mogen nooit gelijktijdig muteren; één bron tegelijk is leidend.
- **Twee silos, één waarheid** — ICM (canoniek) is leidend; Blob-state wordt door reconciliatie gespiegeld, niet omgekeerd.

## Agent-as-folder + DjinLabs zonder runtimes (Ronde 19 sync, 2026-09-28)

- **agent = folder** — een agent is een map met platte bestanden (AGENT.md, skills/, memory/, state in Markdown/JSON). Een agent die alleen in een runtime of database bestaat, is geen DjinLabs-agent.
- **Walk-test verplicht** — voor élke nieuwe agent of substantiële wijziging: kan een verse AI de agent begrijpen door alléén de map te lezen (router + ≤2 reads)? Zo niet: stop, splits, of documenteer de ontbrekende file.
- **Geen runtime in DjinLabs** — geen eigen server, queue, database, dashboard of service in de DjinLabs-architectuur. Vercel Eve, Adam/Convex, DjinLabs HQ e.d. zijn expliciet uit (zie `decisions.md` Ronde 19 motie 1).
- **COS = folder-agent** — COS bestaat uit zijn folder in `cos/_internal/experimenten/`, gelezen door een bestaand agent-harnas (Hermes of Claude Code). Geen COS-eigen runtime, geen runtime-baas. Zie `_shared/cos-architecture-canon.md` voor de canon-versie en `cos/wayfinder-map.md` voor de frontier.
- **Folder-auteur = autoriteit** — voor COS is zijn baas de folder-auteur (degene die COS' folder schrijft); Jev is externe gate-verdict-autoriteit. Geen runtime-baas, geen visibility-laag als autoriteit (Ronde 19 motie 3, T-02 Optie 5).
- **Walk-test voor trigger-woorden** — bij twijfel of een woord canon-waarde is: vervang de term door `[orkestrator]` of `[agent]`. Blijft de zin kloppen, dan canon. Zo niet: implementation.
