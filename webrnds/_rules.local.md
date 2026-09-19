# Webrnds instance rules

Per-instance rules die niet universeel zijn (zie `_shared/hard-rules.md` voor de U-rules). Alleen Webrnds-specifieke beperkingen, vrijheden, en afspraken.

## Cap op actieve klantreizen (Ronde 8/Q8.2)

**Max 3 actieve klantreizen per klant.**

- Actief = de reis zit in `clients/<slug>/klantreis-<id>/` (niet in `_archive/`).
- Afgeronde reizen verhuizen naar `clients/<slug>/_archive/` en tellen niet mee voor de cap.
- Bij overschrijding: folder-shape-hook weigert de create en vraagt de agent eerst te consolideren.
- Bij twijfel of een reis "afgerond" is: user beslist, niet de agent.

## Services palette (Ronde 1/Q2 + Ronde 7/Q7.1)

Webrnds levert Codavo-shape diensten:

- Websites (maatwerk)
- Webapplicaties
- Klantportalen
- API-koppelingen
- AI-integraties
- GEO / AI-vindbaarheid
- SaaS MVP

Dienstenpalet kan veranderen zonder de boom te hernoemen (Codavo-template les). Nieuwe dienst = nieuw agent-wrapper in `skills/`, geen folder-wijziging.

## Naming (zie `_shared/naming-conventions.md`)

- Klant-slugs: lowercase-hyphenated bedrijfsnaam. Geen PII (U3).
- Klantreis-IDs: stable na aanmaken, niet wijzigen.
- Datestamps: `YYYY-MM-DD` of `YYYY-MM`.

## Factory/product split

- Stable: `_internal/`, `_templates/`, `skills/`, `AGENTS.md`, `start.md`, `state.md`, dit bestand.
- Per-instance (per klant): `clients/<slug>/klantreis-<id>/`.
- Per-run: artifacts in de relevante fase-folder met `review_status` in frontmatter.

## Wat NIET in `_rules.local.md` zit

- Universele U-rules → `_shared/hard-rules.md`.
- ICM-discipline (router, CONTEXT, factory/product, walk-test) → `_shared/icm-canon.md`.
- Agent-definities → `/djinlabs/skills/` (scaffold) of `clients/<slug>/_agents/` (wrapper).
