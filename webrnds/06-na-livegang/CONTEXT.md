# 06-na-livegang/ — uptime, change-requests, walkthroughs, support

De **post-live** discipline. Hier wonen de patronen en templates die Webrnds inzet _na_ lancering van een klantreis: retainer-coordinatie, support-templates, change-request-flow, Groei Pro-rapportage.

## Wat hier woont

- Uptime-monitoring templates (per hosting-patroon: Cloudflare Pages, Supabase, etc.).
- Change-request flow (hoe een klant een wijziging aanvraagt en hoe die door de fases gaat).
- Walkthrough-templates (hoe de founder een klant door het opgeleverde product heen loodst).
- Groei Pro-rapportage templates (`_maandrapport/YYYY-MM.md`).
- Support-ticketing flow + escalatie-regels.

## Wat hier NIET hoort

- Klant-specifieke logs → `clients/<slug>/klantreis-<id>/05-na-livegang/_logboek/`.
- Klant-specifieke change-requests → `clients/<slug>/klantreis-<id>/05-na-livegang/_requests/`.
- Klant-folders → `clients/`.

## Process (kanoniek)

1. **Trigger:** een klantreis is afgerond in `04-lancering/` (live), of de retainer-coordinator detecteert een issue.
2. **Input:** de live-status van de klantreis + patronen uit `clients/<slug>/klantreis-<id>/05-na-livegang/_logboek/`.
3. **Actie:** agent (klant-spec `support-agent.md` wrapper) past template toe of genereert rapport.
4. **Output:** rapport of change-request in de juiste klantreis-fase-folder, met `review_status` in frontmatter.
5. **Human check:** user reviewt (vooral bij escalaties); past frontmatter aan.
6. **Volgende stap:** patronen die in deze fase emergen (bv. "klant X wil SEO-dashboard") voeden `02-offer/` (Groei Pro-uitbreiding) of `_internal/leer-artefacten/` (patroon dat niet productiseert).

## Verboden

- ❌ Geen productiewijzigingen doorvoeren zonder change-request-flow.
- ❌ Geen escalatie zonder frontmatter-notificatie aan user.
- ❌ Geen klant-PII in deze templates.
