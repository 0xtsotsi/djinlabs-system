# 03-market/ — outreach, positionering, GEO/AI-vindbaarheid

Hier wonen de **exposure**-activiteiten: hoe vindt Webrnds nieuwe klanten? Welke kanalen, welke boodschap, welke experimenten?

## Wat hier woont

- Outreach-templates (per kanaal: e-mail, LinkedIn, referral, event).
- Positionering-experimenten (welke boodschap werkt voor welke niche).
- GEO / AI-vindbaarheid experimenten (hoe zichtbaar is Webrnds in AI-zoekresultaten).
- Conversie-data per kanaal (response-rate, afspraak-rate, deal-rate).
- Case-study drafts (anoniem, met expliciete klant-go in frontmatter).

## Wat hier NIET hoort

- Klant-uitvoering → `clients/<slug>/`.
- Diensten-paletaanpassingen → `02-offer/`.
- Markt-onderzoek (verkennen) → `01-research/`.

## Process (kanoniek)

1. **Trigger:** user wil een nieuw kanaal proberen, of een bestaand kanaal tunen.
2. **Input:** bestaande templates + data uit `01-research/` + response-data van vorige experimenten.
3. **Actie:** maak een experiment-template aan: `YYYY-MM-DD-<kanaal>-<hypothese>.md` met `experiment_id` in frontmatter, hypothese, setup, stop-conditie.
4. **Output:** na afloop van het experiment: resultaten + volgende-stap in dezelfde file, frontmatter `review_status: reviewed`.
5. **Human check:** founder reviewt of het experiment-waardig was (geen ad-hoc-spam).
6. **Volgende stap:** positieve experimenten worden omgezet in repeatable templates; negatieve worden naar `_internal/leer-artefacten/` verplaatst.

## Verboden

- ❌ Geen klant-PII in outreach-templates (gebruik `[KLANT]` placeholders).
- ❌ Geen outreach sturen vanuit deze folder zonder user-go in `state.md` van het experiment.
- ❌ Geen experimenten zonder stop-conditie.
