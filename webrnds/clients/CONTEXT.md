# clients/ — klant-folders

Eén folder per klant. Canonieke sub-shape per klant (Ronde 7/Q7.2). Hier wonen alle klantreizen, klant-spec agents, klant-portalen.

## Wat hier woont

Per klant:

- `start.md` — wie is de klant, wat is de engagement, huidige status.
- `state.md` — status van alle reizen + productisatie-flag.
- `_rules.local.md` — klant-specifieke regels (NDA, facturatie-eigenaardigheden, taal-keuze).
- `_agents/` — per-klant agent-wrappers, gedeeld over reizen (Ronde 10/Q10.3).
- `klantreis-<id>/` — meerdere reizen per klant, parallel (Ronde 7/Q7.3 parallel).
  - Elke reis heeft 6 numbered fase-folders (`01-kennismaking/` t/m `06-groei/`).
- `_archive/` — afgeronde reizen (Ronde 8/Q8.2 cap-randvoorwaarde).

## Wat hier NIET hoort

- Webrnds-pipeline-templates → `01-research/` t/m `06-na-livegang/`.
- Webrnds-spec R&D → `_internal/`.
- Djin-agents universeel → `/djinlabs/skills/`.
- Canonieke bronnen → `/_shared/`.

## Discipline

- **Cap:** max 3 actieve reizen per klant (zie `_rules.local.md` van Webrnds).
- **Naming:** lowercase-hyphenated bedrijfsnaam (zie `_shared/naming-conventions.md`).
- **Privacy:** geen PII in folder-namen (U3).
- **Status:** per-run artifacts in fase-folders krijgen `review_status` in frontmatter.
- **Boundary:** context van de ene klant mag nooit lekken naar een andere klant's folder.

## Hoe maak je een nieuwe klant aan

1. Kopieer `_templates/klant-template/` naar `clients/<slug>/`.
2. Vul `start.md` en `state.md` in.
3. Maak `_rules.local.md` aan met klant-specifieke uitzonderingen.
4. Initialiseer `_agents/` vanuit `skills/`-wrapper-templates.
5. Eerste `klantreis-<id>/` aanmaken via folder-shape-hook (zie `04-close/CONTEXT.md` voor de trigger).
