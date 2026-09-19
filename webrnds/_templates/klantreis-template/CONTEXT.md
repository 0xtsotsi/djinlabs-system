# klantreis-template/ — skeleton voor een nieuwe klantreis

Dit is de **lege skeleton** die de folder-shape-hook kopieert naar `clients/<slug>/klantreis-<id>/` bij elke nieuwe klantreis (Ronde 7/Q7.3 parallel).

## Wat bij het kopiëren wordt aangepast

- `<reis-id>` wordt vervangen door de gekozen stable identifier (datum-prefix of mnemonisch).
- `start.md` en `state.md` worden aangemaakt met `review_status: pending`.
- De 6 numbered fase-folders worden aangemaakt, elk met een eigen `CONTEXT.md`.

## Wat niet wordt aangepast

- De 6-fasen structuur zelf (kanoniek).
- De `review_status`-discipline (per-run artifacts in fase-folders).

## Wat deze template NIET bevat

- Geen klant-data → die wordt door de agent ingevuld na kopiëren.
- Geen agent-content → die wordt geïnitialiseerd vanuit `skills/`-wrappers.
- Geen `_dossier/`-naming (Ronde 9/Q9.2) → die sub-folders worden door de agent aangemaakt bij eerste dossier-output, niet bij skeleton-init.

## Hoe gebruik je deze template

Niet handmatig. De folder-shape-hook doet het:

```
kopieer /webrnds/_templates/klantreis-template/ → /webrnds/clients/<slug>/klantreis-<id>/
vul <reis-id> in start.md en state.md
maak 01-kennismaking/ t/m 06-groei/ aan met CONTEXT.md per fase
check cap (max 3 actieve reizen per klant, zie _rules.local.md)
```
