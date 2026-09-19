# Hard rules — universeel + per-instance

Pointer: de candidated draft van de 8 universele U-rules + per-instance contrast staat in `research/hard-rules-inventory.md` (met verification trail). Dit bestand is de **canonieke pointer** die alle ondernemingen includen.

## Universeel (U1–U8, candidated)

- **U1** folder=company + start/state → elke werk-folder heeft `start.md` + `state.md` op het canonieke niveau.
- **U2** alles via hooks → geen folder aanmaken zonder folder-shape-hook die start + state + skeleton-CONTEXT aanmaakt.
- **U3** no-secrets-to-logs → geen API-keys, wachtwoorden, klant-PII in folder-namen of frontmatter.
- **U4** top-file-only-routes → root-routers (≤60 regels) verwijzen naar kamers; kamers lezen alleen hun eigen contract.
- **U5** state-date-wins-over-mtime → `state.md`-datum is authoritative; afgeronde reizen verhuizen naar `_archive/`.
- **U6** newest-date-wins → bij twijfel tussen twee artifacts wint de nieuwste `review_status: reviewed`-datum.
- **U7** sunday-audit → periodieke scan op ontbrekende start/state, "Final"-achtige namen, nesting > 3, cap-overschrijding.
- **U8** failures-as-negative-examples → mislukte reizen worden niet verwijderd; ze worden geland als leer-artefacten in `_internal/leer-artefacten/`.

## Per-instance (contrast)

Wat bewust NIET universeel is:

- **Naam-conventies voor klant-slugs** → per onderneming (Webrnds gebruikt lowercase-hyphenated bedrijfsnaam).
- **Cap op actieve klantreizen per klant** → per onderneming in `_rules.local.md` (Webrnds = max 3, afgeronde naar `_archive/`).
- **Agent-definities en scaffold-keuze** → Djin-agents universeel in DjinLabs; klant-spec wrappers in Webrnds.
- **Templates** → per onderneming in `_templates/`. Geen cross-instance imports zonder pointer in `AGENTS.md`.

## Wat deze file NIET doet

- ❌ Definieert de U-rules niet zelf (pointer naar `research/hard-rules-inventory.md`).
- ❌ Bevat geen per-instance rules (die leven in `/<instance>/_rules.local.md`).
- ❌ Wordt niet aangepast zonder dat `decisions.md` daarom vraagt.
