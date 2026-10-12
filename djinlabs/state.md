# /djinlabs/ — state

> Status: **skeleton met cos-experimenten geland**. Ronde 19 (commit
> c1ebd5b, 2026-09-28) heeft architectuur gelocked: geen runtimes,
> agent = folder, COS = folder-agent. Canonieke boom staat in
> `decisions.md` (Ronde 7-19) en `_shared/`.
> Last update: 2026-10-10.

## Wat staat

- Sub-router `AGENTS.md` (≤60 regels) — laat een agent weten wat hier woont. Bijgewerkt voor Ronde 19.
- `start.md` — purpose + boundaries + done-definitie.
- `state.md` — dit bestand.
- `_internal/experimenten/cos/` — **substantieel geland**. Ronde 18-19 frontier:
  - `CONTEXT.md` (cos-architecture-product, draft v0.1)
  - `wayfinder-map.md` (verse-AI walk-test, max 2 reads)
  - `architecture-design.md` (orthogonale orkestratie-architectuur)
  - `tickets/` — T-01..T-11 (COS-definitie, baas, routes, validatie, state, Jev, failure, parallelle sessies, use-case, niet-doen, sync v2)
  - `tools/` — cyrillic-guard + repro-note
  - `research/` — sync-discipline v2 + agent-is-folder ICM-notion
  - 2x `.ARCHIVED-2026-09-XX` files (Sharbel-trail, multi-runtime brainstorm)
- `_internal/experimenten/rondasync/` — apart experiment, eigen CONTEXT.md + rondasync.py + design.md.
- `_internal/CONTEXT.md` — aanwezig (parent-context voor R&D/leer/experimenten).
- `skills/CONTEXT.md` — aanwezig (parent-context voor agent-scaffolds; scaffolds zelf nog niet geschreven).
- `tenants/djin/` — Djin gespiegeld via symlinks; 10 symlinks + 6 canonieke files. Zie `tenants/djin/AGENTS.md` voor de matrix.

## Wat nog moet

- **Agent-scaffolds schrijven** voor de 4 universeel-Djin-agents: `intake-qualifier`, `strategist`, `retainer-coordinator`, `growth-spotter`. Elk krijgt `skills/<naam>/SKILL.md` met: doel, input, output-shape, verbod-lijst, voorbeeld-output.
- **Eerste Sunday-audit-uitkomst** landen in `_internal/leer-artefacten/`.
- **T-04..T-11 besluiten** — wachten op founder-call (Ronde 20+).
- **Tweede instance** scaffolden zodra founder instance #2 wil starten (Ronde 4/Q4.1).
- **`_shared/cos-architecture-canon.md`** committen wanneer frontier voldoende resolved is (zie sync-discipline-audit `INTENT-2026-09-28T1212-GG-na3.md`).

## Ronde 19 cleanup-status (2026-10-10)

- `/tmp/eve-test` verwijderd.
- Sharbel-trail gepauzeerd in `research/_paused/sharbel/`.
- Eve + Adam gelabeld als `client-patroon-research`.
- Inventory-manifest: `audit-spoor/cleanup-2026-10-10-r19-inventory.md`.
- Mono-repo `Context/` aangemaakt (runtime-truth + één-scherm).

## Audit-spoor-lock (Ronde 19, WEB-16)

| Audit-spoor | Ronde | Commit | Status | Cross-ref |
|---|---|---|---|---|
| `WEB-16` | Ronde 19 | `c1ebd5b` (2026-09-28) | **locked** | `decisions.md` Ronde 19; `djinlabs/_internal/experimenten/cos/research/2026-09-28-r19-staging-djinlabs-zonder-runtimes.md`; `audit-spoor/cleanup-2026-10-10-r19-inventory.md` |

**6 moties (Ronde 19, één regel):** geen runtimes in DjinLabs / agent = folder / COS = folder-agent / T-03 t/m T-10 herijken / Eve + Convex = optioneel Webrnds client-setup-patroon / opruimen + stil zetten.

## Status-frontmatter van deze state

```yaml
---
review_status: reviewed
created: 2026-09-19
reviewer: founder
reviewed: 2026-09-19
last_update: 2026-10-10
last_update_reason: Ronde 19 lock + cleanup-sweep uitgevoerd door COS
next_review: bij Ronde 20 of T-04..T-11-resolutie
---
```
