# 01-research/ — marktonderzoek, niches, ICP-refinement

Werken die nog vóór een specifieke klant liggen: doelgroep-begrip, niche-verkenning, ICP-refinement, market-signals. Outputs hier voeden `02-offer/` en de intake voor een nieuwe klantreis.

## Wat hier woont

- ICP-refinement notities (per niche, per segment).
- Markt-onderzoek: concurrent-snapshots, prijsvergelijkingen, trend-notities.
- Signals: outreach-response-data, conversie-data, zoekvolume-data.
- Templates en checklists die bij marktonderzoek horen (in `_templates/`).

## Wat hier NIET hoort

- Specifieke klant-dossiers → `clients/<slug>/`.
- Diensten-paletaanpassingen → `start.md` van Webrnds + Ronde 1-beslissingen.
- Codavo-specifieke concurrent-analyse → `/research/codavo-competitive-brief.md` (aldaar geland met provenance).

## Process (kanoniek)

1. **Trigger:** user of agent identificeert een niche-vraag of ICP-twijfel.
2. **Input:** bestaande notities in deze folder + open vragen in `state.md` van Webrnds.
3. **Actie:** voer klein onderzoek uit (≤2 uur effort per sessie); leg bevindingen vast in `YYYY-MM-DD-onderwerp.md` met `review_status: pending` in frontmatter.
4. **Output:** `YYYY-MM-DD-onderwerp.md` (≤500 woorden, conclusie + 3 acties).
5. **Human check:** founder leest, past frontmatter aan naar `reviewed` of stuurt bij.
6. **Volgende stap:** bevindingen voeden `02-offer/` (dienst-paletaanpassing) of direct een nieuwe klantreis (intake in `04-close/`).

## Verboden

- ❌ Geen klant-PII in research-notities.
- ❌ Geen claims zonder bron-pointer.
- ❌ Geen "Final"-achtige naamgeving (anti-pattern U7 detecteert).
