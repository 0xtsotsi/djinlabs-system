# /webrnds/_archive/ — afgeronde klanten

Hier verhuizen klanten na volledige afronding van alle klantreizen. Een klant komt in `_archive/` als:

- Alle klantreizen zijn afgerond (in `clients/<slug>/klantreis-<id>/06-groei/` of `_archive/` per reis).
- Er geen lopende facturatie of support-relatie meer is.
- De user expliciet akkoord gaat met archivering.

Wat hier NIET hoort:

- Lopende klanten → `clients/`.
- Afgeronde reizen van een lopende klant → `clients/<slug>/_archive/` (per-klant, niet top-level).

Discipline: archivering is geen verwijdering. De folder blijft bestaan met `state.md` op `archived: true`.
