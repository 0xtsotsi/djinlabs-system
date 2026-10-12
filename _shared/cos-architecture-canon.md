---
name: cos-architecture-canon
description: Canonieke folder-architectuur voor COS (Chief of Staff). Vastgelegd in Ronde 19 als gevolg van de 6 moties DjinLabs zonder runtimes. v0.1 = folder-canon (geen runtime-blauwdruk); runtime-vragen blijven in `cos/wayfinder-map.md` T-04 t/m T-10.
status: canon
version: 0.1
date: 2026-09-28
owner: djin
review_status: reviewed
reviewer: founder
canonieke-discipline: agent = folder per `_shared/icm-canon.md` §Ronde 19 sync. Runtime-vrij per Ronde 19 motie 1.
related:
  - ../_shared/icm-canon.md
  - ../_shared/jev-policy-canon.md
  - ../_shared/sync-discipline-canon.md
  - ../_shared/agent-discipline-canon.md
  - ../djinlabs/_internal/experimenten/cos/CONTEXT.md
  - ../djinlabs/_internal/experimenten/cos/wayfinder-map.md
  - ../djinlabs/_internal/experimenten/cos/architecture-design.md
  - ../djinlabs/_internal/experimenten/cos/tickets/T-01-cos-definitie.md
  - ../djinlabs/_internal/experimenten/cos/tickets/T-02-cos-baas.md
  - ../djinlabs/_internal/experimenten/cos/tickets/T-03-cos-routes.md
  - ../decisions.md (Ronde 19)
provenance: decisions.md §"Ronde 19 — 2026-09-28: DjinLabs zonder runtimes (6 moties)"
---

# COS-architecture canon — v0.1 (folder-canon, Ronde 19)

> **Status:** canon, v0.1. Folder-canon alleen — runtime-implementatie van COS blijft in de frontier (`cos/wayfinder-map.md` T-04 t/m T-10).
> **Ronde-lock:** Ronde 19 (2026-09-28, commit c1ebd5b).
> **Sync-discipline:** generator-only is Ronde 17+; deze v0.1 is handmatig gecomponeerd uit T-01/T-02/T-03 R2-closure en de 6 moties. Volgende Ronde die deze file raakt, hoort de drift-detector te draaien.

## Wat COS is

**Één-regel-definitie** (T-01, closed 2026-09-21):

> "COS is je Chief of Staff — hij leest je inbox en stuurt elk bericht naar de juiste agent."

**Operationalisatie** (v0.1 canon):

- COS is een map in `djinlabs/_internal/experimenten/cos/` met `CONTEXT.md`, `architecture-design.md`, `wayfinder-map.md`, `tickets/`, `research/`.
- COS wordt gelezen door een bestaand agent-harnas (Hermes, Claude Code, of een vergelijkbare Claude-/agent-loop). Het harnas gedraagt zich naar COS' folder; COS er is geen eigen runtime.
- COS is **folder-orthogonaal** aan andere agents: het is geen venture-specifieke agent, geen canon-onderdeel, geen transport-laag.

## Wat COS NIET is

- **Geen runtime, geen service, geen queue, geen database, geen dashboard.** Vercel Eve, Adam/Convex, DjinLabs HQ, paperclip-control-plane, en in vergelijkende architecturen zijn uit (Ronde 19 motie 1).
- **Geen agent in de zin van "een process dat ik kan starten".** COS is een map; de agent-harnas leest 'm.
- **Geen visibility-laag met beslissingsautoriteit.** Notion is communicatiemiddel tijdens ontwerp; geen onderdeel van het eind-systeem (T-02 C5-verscherping).

## Autoriteit (T-02 Optie 5, herzien 2026-09-28)

- **Baas van COS** = de folder-auteur (degene die COS' folder schrijft).
- **Externe gate** = Jev (per `_shared/jev-policy-canon.md`, Ronde 17 V1.5). COS doet een verdict-call naar Jev voor hoge-impact beslissingen; Jev antwoordt met APPROVED / CHANGES_REQUESTED / HOLD.
- **Geen runtime-baas.** Geen Hermes-peer-DM, geen visibility-laag, geen Notion-kanaal als autoriteit.

## Routes bij eerste launch (T-03 R2, closed 2026-09-28)

**Resolutie** (89 woorden, 6/6 tests passing):

> COS kent 6 input-stromen (Notion sync-pagina tijdens ontwerp, _shared/ + research/, directe founder-input, cal.md-events, andere agent-folders via handover/, git-hook events), routeert naar 7 outputs (Hermes-folder, GG-folder, Jev-folder via sync-pagina, research-zone, ticket-updates, audit-spoor, sync-pagina tijdens ontwerp), met 4 triggers (intent-detectie, urgency-flag urgent/soon/later, side-effect-sniffer, canonieke-wijziging) en 3 fallbacks (sync-page-mirror Hermes-bridge, queue-pending, no-op met stilte); 7 items uitgesloten (Vercel Eve, Adam, DjinLabs HQ, Hermes-peer-DM, klant-betalingen, e-mail, venture-code inclusief Webrnds sub-folders).

**Vereenvoudigde samenvatting** (canoniek-anchor-jump):

- **Triggers** lezen **signalen** (frontmatter `intent: <urgent|review|info|done>`, urgency-flag urgent/soon/later, bestandsnaam-prefixen, post-commit-hook op canonieke files).
- **Routes** schrijven naar **agent-folders** (handover-files), **research-zone** (kanoniek-neutraal), of **Ronde-traject** (decisions.md-edit + commit).
- **Approval** = Jev-call (externe gate) of founder-confirm (directe input-stroom).

## Walk-test (verplicht, Ronde 19 sync uit `_shared/icm-canon.md`)

Voor élke nieuwe COS-ticket, élke agent-dispatch of substantiële wijziging aan COS' folder: kan een verse AI de stap begrijpen door alléén `CONTEXT.md` + `wayfinder-map.md` (+ max 1 ticket-resolution-file) te lezen?

- **Ja** → ga door.
- **Nee** → stop, splits de verandering in meerdere tickets, of maak een ontbrekende CONTEXT.md aan.

## Wat deze canon NIET aangeeft (open frontier)

Volgens Ronde 19 motie 1 (geen runtimes) en `cos/CONTEXT.md` §"Wat hier zit" (canonieke file pas na voldoende frontier-resolution): deze v0.1-canon beschrijft **alleen** de folder-discipline. Wat volgt, blijft in de wayfinder-map:

- **T-04** validatie-mechanisme (shadow-mode-contract, risico per actie-type) — deblokkeerd na T-03 closure.
- **T-05** state-model (per-sessie JSON vs per-ronde Markdown; canon vs runtime onderscheid) — pending r19-herijking.
- **T-06** Jev-calls (welke classifications, welke confidence-band defaults) — pending r19-herijking.
- **T-07** failure-mode bij Jev-down (wachtrij, hard-fail, no-op) — pending r19-herijking.
- **T-08** parallelle-sessies-orkestratie (Hermes + GG conflict lock) — pending r19-herijking.
- **T-09** eerste live use-case (concreet piloot-scenario) — deblokkeerd na T-03 closure.
- **T-10** out-of-scope bij eerste launch — pending r19-herijking.

Runtime-implementatie, deployment, CI/CD, en taal-keuze blijven expliciet **out of scope** voor deze canon.

## Sync-discipline-implicaties

- **Bij elke wijziging aan deze file**: trek de frontier door in `cos/wayfinder-map.md` (welke vraag is nu opgelost, wat blijft er over). Geen directory-eis: trek de inleiding door in `_shared/icm-canon.md` als de agent-folder-discipline verandert.
- **Bij elke nieuwe COS-ticket-resolution** (T-04 t/m T-10): check of deze canon gewijzigd moet worden. Zo ja, in dezelfde Ronde locken.
- **Drift-detectie trigger** (Ronde 16): als `cos/_shared/cos-architecture-canon.md` ≠ deze file, is dat een drift-geval — gelijk aan de andere `_shared/`-files die canon zijn voor COS.

## Cross-references

- `_shared/icm-canon.md` — agent = folder + Ronde 19 walk-test-discipline (anker)
- `_shared/jev-policy-canon.md` — Jev als externe autoriteit, geen runtime (Ronde 17 V1.5)
- `_shared/sync-discipline-canon.md` — sync bij elke Ronde, generator-only principe (Ronde 16)
- `_shared/agent-discipline-canon.md` — drie basisregels voor samengestelde verzoeken
- `djinlabs/_internal/experimenten/cos/CONTEXT.md` — product-context, COS = folder-architectuur
- `djinlabs/_internal/experimenten/cos/wayfinder-map.md` — frontier (T-04 t/m T-10)
- `djinlabs/_internal/experimenten/cos/architecture-design.md` — design-doc (anti-patterns §4)
- `djinlabs/_internal/experimenten/cos/tickets/T-01-cos-definitie.md` — 20-woord-definitie
- `djinlabs/_internal/experimenten/cos/tickets/T-02-cos-baas.md` — Optie 5, folder-auteur = baas
- `djinlabs/_internal/experimenten/cos/tickets/T-03-cos-routes.md` — 89-woord route-beschrijving
- `decisions.md` §"Ronde 19 — 2026-09-28: DjinLabs zonder runtimes (6 moties)" — bron