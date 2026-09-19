# 02-offer/ — productised diensten + prijsstructuur

Hier woont de **productized** kant van Webrnds' dienstenpalet: hoe een dienst eruitziet als een herhaalbaar product, met een vaste scope, een vaste prijs-band, en een vaste doorlooptijd.

## Wat hier woont

- Per-dienst offer-templates: website, webapp, klantportaal, API-koppeling, AI-integratie, GEO-pakket, SaaS MVP.
- Prijs-banden per dienst (zie Codavo-comparabel in `start.md`).
- Up-sell-paden: van eenmalig → retainer → SaaS-template-spawn.
- Veelgestelde vragen + tegen-argumenten voor sales.

## Wat hier NIET hoort

- Specifieke klant-offertes → `clients/<slug>/klantreis-<id>/02-strategie/`.
- Diensten die Webrnds niet levert (out-of-scope).
- Facturatie-policies → Webrnds' boekhouding (buiten deze repo).

## Process (kanoniek)

1. **Trigger:** user past een dienst aan, of een nieuwe dienst wordt toegevoegd.
2. **Input:** bevindingen uit `01-research/` + bestaande dienst-template.
3. **Actie:** pas template aan of schrijf nieuwe dienst-template in `02-offer/<dienst>/OFFER.md`. Frontmatter: `dienst`, `prijs_band`, `doorlooptijd`, `repeatable: true|false`.
4. **Output:** `OFFER.md` per dienst met scope, deliverables, prijs-band, veelgestelde vragen, up-sell-pad.
5. **Human check:** founder reviewt; past frontmatter aan naar `reviewed`.
6. **Volgende stap:** template wordt gebruikt in `04-close/` (intake → contract) bij nieuwe klantreizen.

## Verboden

- ❌ Geen klant-specifieke prijzen (dat hoort in de klantreis).
- ❌ Geen "Final"-achtige naamgeving.
- ❌ Geen ongeteste pricing (een prijs zonder historische data = hypothese, markeer dat in frontmatter).
