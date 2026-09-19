# 05-produce/ — bouw: per Codavo-dienst + per stack-pijler

De **bouw**-fase. Hier landen de deliverables van een klantreis-uitvoering: code, designs, configs, infra. Geen klant-context hier — alleen de **templates + libraries** die productie-supporten.

## Wat hier woont

- Per-dienst **bouw-templates** (website-template, webapp-template, klantportaal-template, API-koppeling-template, AI-integratie-template, GEO-template, SaaS-MVP-template).
- Per-stack-pijler **referentie-snippets**: frontend (Nuxt+Vue+TS+Tailwind), backend (Supabase Postgres+Auth+RLS+Storage), edge (Cloudflare CDN+Workers). Past bij Codavo's tech-as.
- Herbruikbare componenten + agent-prompts die per dienst ingezet worden.
- Build/test/CI-templates die elke klantreis kan includen.

## Wat hier NIET hoort

- Klant-specifieke code → `clients/<slug>/klantreis-<id>/03-ontwerp/` of `04-lancering/`.
- Klant-folders → `clients/`.
- Diensten-paletaanpassingen → `02-offer/`.

## Process (kanoniek)

1. **Trigger:** een klantreis zit in `03-ontwerp/` of `04-lancering/` en heeft een template nodig.
2. **Input:** de scope uit `clients/<slug>/klantreis-<id>/02-strategie/_dossier/scope.md` + de juiste dienst-template uit `02-offer/`.
3. **Actie:** agent (klant-spec wrapper in `clients/<slug>/_agents/bouw-agent.md`) includeert de relevante template uit `05-produce/<dienst>/` en vult klant-spec parameters in.
4. **Output:** concrete deliverable in de klantreis-fase-folder, met `review_status: pending` in frontmatter en pointer naar welke template uit `05-produce/` werd gebruikt.
5. **Human check:** user reviewt het deliverable; past frontmatter aan naar `reviewed`.
6. **Volgende stap:** het deliverable wordt onderdeel van de volgende fase in de klantreis.

## Verboden

- ❌ Geen klant-specifieke code in deze folder.
- ❌ Geen niet-geteste templates (een template zonder historisch gebruik = hypothese, markeer dat).
- ❌ Geen breaking changes aan een template zonder versionering in de file-naam.
