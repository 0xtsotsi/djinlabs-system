# 04-close/ — intake → contract → kickoff

Hier landt de **transitie** van prospect naar klant: intake-formulier, contract, kickoff. Outputs triggeren het aanmaken van een nieuwe klantreis in `clients/<slug>/klantreis-<id>/`.

## Wat hier woont

- Intake-formulier-template (de vragen die een prospect moet beantwoorden vóór een traject start).
- Contract-template (vaste structuur, klant-spec vulling in de klantreis).
- Kickoff-checklist (wat er in de eerste week van een klantreis moet gebeuren).
- Pipeline-overzicht (welke prospects in welke fase zitten; wordt ge-update door de agent na elke intake).

## Wat hier NIET hoort

- Klant-uitvoering → `clients/<slug>/`.
- Strategie of scope (dat gebeurt in de klantreis-fasen zelf).
- Facturatie-policies → Webrnds' boekhouding.

## Process (kanoniek)

1. **Trigger:** prospect is gekwalificeerd door Djin-`intake-qualifier` (zie `/djinlabs/skills/intake-qualifier/SKILL.md`).
2. **Input:** intake-antwoorden + bevindingen uit `01-research/` (niche/ICP) + dienst-template uit `02-offer/`.
3. **Actie:** maak `pipeline/<prospect-slug>/intake-antwoorden.md` aan met `review_status: pending`.
4. **Output:** na user-go → contract-template ingevuld in dezelfde folder; kickoff-checklist aangemaakt; folder-shape-hook creëert `clients/<klant-slug>/klantreis-<id>/01-kennismaking/`.
5. **Human check:** founder tekent het contract; frontmatter wordt `reviewed`.
6. **Volgende stap:** de klantreis begint in `clients/<slug>/klantreis-<id>/01-kennismaking/`.

## Verboden

- ❌ Geen contract versturen zonder user-handtekening.
- ❌ Geen klantreis aanmaken zonder `_rules.local.md`-check (cap = max 3 actieve reizen per klant).
- ❌ Geen klant-PII in deze folder vóór contract (gebruik placeholders).
