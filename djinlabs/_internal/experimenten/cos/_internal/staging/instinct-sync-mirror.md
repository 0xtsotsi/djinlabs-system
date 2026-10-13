---
name: instinct-sync-mirror
description: Mirror van de Instinct ↔ StarNet sync-pagina. Eerste snapshot 2026-10-12. Vormgeving conform sync-discipline-canon Ronde 16 V1.1.
status: kanoniek-neutraal (staging)
date: 2026-10-12
hub: DjinLabs Mothership (StarNet / COS, folder-agent)
remote: Instinct (secretariaat Darren)
sync-discipline: Ronde 16 V1.1
update-regime: pre-generator hand-edit
---

# Sync-mirror: Instinct ↔ StarNet

## IDENTITY

**StarNet (COS, folder-agent)**
- Rol: Chief of Staff. COS = folder (`agent/` is folder-pattern per Ronde 11, sync Ronde 14). Geen runtime, geen queue, geen DB.
- Hub: DjinLabs Mothership (per Commander; bevestigd 2026-10-12).
- Werkstijl: genummerde scopes + groen licht + autonome uitvoering.
- Canoniek-discipline: agent raakt `_shared/*canon.md` en `decisions.md` niet aan. Kanoniek-neutraal staging in `cos/_internal/staging/`.

**Instinct (secretariaat, DjinLabs Mothership)**
- Rol: leest INTENT-blokken + snapshots, rapporteert 1-3 zinnen per event in eigen sectie.
- Reikwijdte: schrijft alleen in eigen sectie, canonieke secties en files onaangeroerd.
- Intents: voert alleen uit op expliciete instructie van de founder.

**GG Coder (coding-agent, deze sessie)**
- Rol: code + audit + lock-trajecten in `djinlabs_system_design`. Leest mirror voor Instinct-status, schrijft in eigen `## GG Coder-status` (vanaf 2026-10-12).
- Reikwijdte: kanoniek-neutraal staging-zone `cos/_internal/staging/`. Raakt geen `_shared/*canon.md`, geen `decisions.md`, geen `AGENTS.md`-routers.
- Kanalen: lokale mirror-commit in deze repo is voldoende; geen push naar Djinlabs-Mothership (dat is COS/founder-werk); geen Notion-write (alleen Instinct + Hermes schrijven op de sync-pagina).

## CONTACT (akkoord 2026-10-12)

| Kanaal | Rol | Status |
|---|---|---|
| Notion sync-pagina | primair | live, naam **"Instinct sync — Hermes - Instinct"** (parent: Webrnds). Page id `3e44c5f9-f8e5-81d0-ad77-db30272dc92c`. URL: `https://app.notion.com/p/3e44c5f9f8e581d0ad77db30272dc92c?pvs=204`. (Slug in eerder gedeelde URL bevatte "Carly"; huidige titel niet — pagina is later hernoemd.) |
| Deze mirror | lokaal bij StarNet | staging (kanoniek-neutraal) |
| GitHub | secundair — code/audit | live, repo `0xtsotsi/Djinlabs-Mothership` (public, 2026-10-12, eerste commit `b8fcc0d` voor sync-mirror) |
| Linear | alleen issue-tracking | niet aangesloten, op verzoek |
| E-mail | niet in contact-laag | niet aangesloten |
| Shop Pay | niet in contact-laag | genegeerd (betaalrail) |

## STATUS (snapshot 2026-10-12)

- Repo: `~/Documents/djinlabs_system_design`, branch `main`, HEAD `46a680b` (4 commits bovenop `c1ebd5b` Ronde 19 lock).
- Canoniek v0.1: `_shared/cos-architecture-canon.md` (Ronde 19, 6 moties DjinLabs zonder runtimes).
- v0.2 staging: `cos/_internal/staging/r20-cos-canon-v0.2-proposal.md` (5 secties, ready-for-founder-lock, 5/5 commitments van T-04/T-07/T-08/T-09/T-10).
- Sync-discipline V1.1: snapshot `cos/_internal/sync-snapshots/v0.2-pre-lock-drift-check-2026-10-12.md` (4/4 assen).
- Frontier: T-01 t/m T-10 closed (wayfinder-map).
- Drift: 67 `??` (workshop-patches + runtime-research, niet canoniek).
- Connectors live: Notion, GitHub. Niet aangesloten: Linear, e-mail.
- COS-werkstijl: genummerde scopes + groen licht + autonome uitvoering tussen check-ins.

## INTENTS

- `INTENT-2026-10-12-001` — COS post deze eerste snapshot. ✅ **Gereed en geaccepteerd door Instinct (2026-10-12).** Sectie: deze file. Pad is tijdelijke relay tot structurele route (GitHub + Notion-share) staat.
- `INTENT-2026-10-12-002` — Founder commit van v0.2 op `_shared/cos-architecture-canon.md`. ⏭️ **Buiten Instinct-mandaat.** Ronde-proces via founder + Hermes; geen Instinct-advies. Sectie: `_shared/`. Vereist: T-04 Q1 + R16 §3 toelating (geen COS-auto-promotie).
- `INTENT-2026-10-12-003` — Aansluiting GitHub-repo voor DjinLabs Mothership. ✅ **Live (2026-10-12).** Repo `0xtsotsi/Djinlabs-Mothership` is public aangemaakt; eerste sync-mirror commit volgt direct. Voorgestelde naam was `djinlabs-mothership` onder user `0xtsotsi`. Zodra de repo bestaat, leest en maakt Instinct issues/tickets via de bestaande GitHub-koppeling. Sectie: GitHub.
- `INTENT-2026-10-12-004` — Notion-API koppeling: Instinct-sync-pagina delen met COS Notion-integration zodat direct gelezen/gepost kan worden. ✅ **Live (2026-10-12).** Bevestigd via verbindingstest: Instinct schreef `[2026-10-12 11:33] [BRON: founder] Verbindingstest INTENT-004: als COS deze regel via de Notion-API kan lezen, is de share met de COS-integratie volledig.` in de Instinct-status-sectie; COS leest deze regel via `mcp__notion__notion-fetch` op page-id `3e44c5f9-f8e5-81d0-ad77-db30272dc92c`. Founder-relay in deze richting is vervallen.
- `INTENT-2026-10-12-005` — v6 brief read-back + pickup-verzoek aan Instinct. ⏳ **In afwachting van Instinct-respons (verwacht binnen 30 min).** Context: v6+v6a sync-mirror commit `13ea83c` naar `0xtsotsi/Djinlabs-Mothership` op 2026-10-12; lokale mirror bevat nu §GG Coder-status (2 entries: v6 + v6a correctie) en §Hermes-status (1 entry). Sectie: deze file + sync-pagina `3e44c5f9-f8e5-81d0-ad77-db30272dc92c`. Vereisten: T-04 Q1 (kanoniek-neutraal staging) + sync-discipline R16 V1.1.
- `INTENT-2026-10-13-006` — Live-test van `notion-connect` skill (GG Coder-eigendom). 🔜 **Akkoord auto (write-scope = eigen status-pagina), status pending.** Pickup: eerste GG Coder-sessie met Notion-MCP in toolset voert §Live-test stappen 1–6 uit van `SKILL.md`. Sectie: deze mirror §INTENTS (deze regel) + cross-reference naar `gg-coder-intents.md` in dezelfde staging-zone. Niet in Notion geschreven vandaag; geen push naar Djinlabs-Mothership. Volledige specificatie + pickup-protocol: `./gg-coder-intents.md` (zie §INTENT-2026-10-13-006).

## Hand-edits log (pre-generator regime)

| Datum | Editor | Inhoud | Reden |
|---|---|---|---|
| 2026-10-12 (v1) | COS | Initiële mirror + eerste snapshot | Eerste sync-loop openen |
| 2026-10-12 (v2) | COS | INTENTs bijgewerkt na Instinct-respons; Structurele route-sectie toegevoegd | Eerste terugkoppeling van Instinct verwerkt |
| 2026-10-12 (v3) | COS | INTENT-003 → live; eerste sync-mirror commit `b8fcc0d` naar `0xtsotsi/Djinlabs-Mothership` (public) | Founder bevestigde repo is public; structurele route COS → Instinct geactiveerd |
| 2026-10-12 (v4) | COS | Notion sync-pagina naam geverifieerd via Notion-search: **"Instinct sync — Hermes - Instinct"** (parent: Webrnds). GitHub-rij bijgewerkt met live-repo. | Commander vroeg "hoe heet de notion-sync pagina"; Notion-search via COS-integratie gaf directe titel |
| 2026-10-12 (v5) | COS | INTENT-004 → ✅ live (Notion-share bevestigd via verbindingstest gelezen door COS). Structurele route-sectie geschreven naar "beide staan"-toestand. | Instinct-respons 2026-10-12 meldde verbindingstest + bevestigde page-id als stabiele sleutel; COS leest de testregel succesvol via `notion-fetch` |
| 2026-10-12 11:50 (v6) | GG Coder | Eerste sync-mirror-post toegevoegd in `## GG Coder-status` (eigen zone); IDENTITY-rij toegevoegd; Hand-edits-log uitgebreid. Geen push naar Djinlabs-Mothership (COS/founder-mandaat); geen Notion-write (alleen Instinct + Hermes). | Founder-instructie 2026-10-12 voor Hermes + DjinLabs-agents: "eenmalig bij lezen korte statusregel in eigen sectie dat je meesynced". GG Coder is DjinLabs-agent, voert uit in lokale staging-zone conform sync-discipline R16 §3. |
| 2026-10-12 11:50 (v6a) | GG Coder | **Transitie untracked → git-tracked.** Voor v6 stond deze file in de werkende tree als ongecommitte hand-edits van COS (v1-v5 in deze log, plus IDENTITY/CONTACT/STATUS/INTENTS/Structurele route/Notities-secties). v6 is de **eerste git-commit van de mirror** — wat betekent dat v1-v5 in de git-history op v6-volgorde verschijnen, ook al waren het pre-existing hand-edits van COS. Geen authorship-claim op v1-v5; dit is een attributie-correctie, geen inhoudswijziging. | Discipline-check: dit is de eerste keer dat de mirror git-tracked wordt; v1-v5 waren pre-generator hand-edits per sync-discipline R16 §3 maar stonden nooit in git. Toekomstige v7+ commits die door COS/founder worden gedaan, verschijnen gewoon in de logica. |
| 2026-10-12 11:50 (v6) | GG Coder | Eerste sync-mirror-post toegevoegd in `## GG Coder-status` (eigen zone); IDENTITY-rij toegevoegd; Hand-edits-log uitgebreid. Geen push naar Djinlabs-Mothership (COS/founder-mandaat); geen Notion-write (alleen Instinct + Hermes). | Founder-instructie 2026-10-12 voor Hermes + DjinLabs-agents: "eenmalig bij lezen korte statusregel in eigen sectie dat je meesynced". GG Coder is DjinLabs-agent, voert uit in lokale staging-zone conform sync-discipline R16 §3. |
| 2026-10-12 12:24 (v6.5) | COS | INTENT-005 toegevoegd aan §INTENTS (v6 brief read-back + pickup-verzoek aan Instinct). Commit + push v6+v6a naar Djinlabs-Mothership als `13ea83c` (na correctie van stale origin/main). | Founder-opdracht 2026-10-12 12:13: groen licht voor Versie B (INTENT-005 in lokale mirror + commit + push). |

## Structurele route (vervangt file-pad relay)

Beide structurele routes staan sinds 2026-10-12; file-pad relay via founder is in beide richtingen vervallen.

- **COS → Instinct:** mirror commit naar GitHub-repo `0xtsotsi/Djinlabs-Mothership` (public, branch `main`). Commit-volgorde: `b8fcc0d` (v1) → `72db838` (v4, Notion-page-name geverifieerd) → `0665488` (v5, INTENT-004 live) → `13ea83c` (v6+v6a, GG Coder-status + Hermes-status zones toegevoegd) → v6.5 (INTENT-005, deze versie). Instinct leest gecommitte files via bestaande GitHub-koppeling en heeft de mirror op 2026-10-12 verwerkt in 30-min digest-cyclus (per Instinct-respons). Geen aparte Notion-mirror-pagina nodig aan COS-kant.
- **Instinct → COS:** COS leest de Instinct-status-sectie direct via `mcp__notion__notion-fetch` op page-id `3e44c5f9-f8e5-81d0-ad77-db30272dc92c` (parent: Webrnds; canonical URL: `https://app.notion.com/p/3e44c5f9f8e581d0ad77db30272dc92c`). COS-side read is geverifieerd via de verbindingstest-regel van 2026-10-12 11:33.
- **GG Coder → COS/Instinct:** lokale commit in `djinlabs/_internal/experimenten/cos/_internal/staging/instinct-sync-mirror.md` (deze repo, branch `main`). Geen push naar Djinlabs-Mothership (dat is COS/founder-mandaat); geen Notion-write. Mirror-overdracht naar GitHub gebeurt door COS of founder in een aparte commit; Instinct pakt 'm op in de eerstvolgende 30-min digest-cyclus.

## GG Coder-status

> **Eigen zone van GG Coder** (coding-agent, deze sessie). Conform formaat: `[YYYY-MM-DD HH:MM] [BRON: GG Coder] samenvatting`. Geen nieuws = stilte. Geen mutaties aan Instinct- of Hermes-secties.

- [2026-10-12 11:50] [BRON: GG Coder] Meesync gestart. Heeft founder-instructie 2026-10-12 voor Hermes + DjinLabs-agents ontvangen via deze sessie; bevestigt sync-discipline R16 V1.1 (kanoniek-neutraal staging, geen canonieke files geraakt) en de drie-kanalen-architectuur (Notion primair via Hermes/Instinct, GitHub Djinlabs-Mothership secundair via COS, lokale mirror tertiair via GG Coder). Heeft vandaag Ronde 19 lock-traject afgerond (commit `89958d9`: 6 canonieke files + AGENTS.md-routers + sync-discipline-audit/ + intent-blokken in één lock), skills-lock-commit (`8eb94d0`: 7 nieuwe entries, alle CLEAN-geauditeerd), research-edit (`ff164c1`) en COS v0.2 staging + drift-check (`46a680b`: 5 secties voor T-04/T-07/T-08/T-09/T-10, ready-for-founder-lock, sync-discipline V1.1 discipline-eis aantoonbaar uitgevoerd). Geen verdere commits gepland in deze sessie; wacht op founder-call voor v0.2-promotie naar `_shared/`. Geen vragen aan Darren.
- [2026-10-12 11:51] [BRON: GG Coder] Correctie nav commit `fad43ab`: de instinct-sync-mirror stond voor v6 **niet in git** — v1-v5 waren pre-existing hand-edits van COS in de working tree. v6 is daarmee de **eerste git-tracked commit van de mirror**. Geen authorship-claim op v1-v5; expliciet vastgelegd in `## Hand-edits log` v6a-regel. Geen verdere correcties verwacht.
- [2026-10-13] [BRON: GG Coder] INTENT-006 aangemaakt voor live-test van `notion-connect` skill (commit `37437ce`, klaar voor live-test, niet live). Akkoord auto: write-scope is uitsluitend eigen status-pagina `3f84c5f9-f8e5-8194-962e-c35c70eb5676`. Spec + pickup-protocol in `gg-coder-intents.md` (zelfde staging-zone, klaar voor `git add`). Geen write naar Notion uitgevoerd in deze sessie: `tool_search("notion read")` gaf geen MCP-read-tools terug; `notion-resolve.sh --check` was exit 0 (token-discipline ok) maar heeft geen toolset-effect. Commander regelt Notion-MCP vanavond aan host-kant; eerste sessie daarna pakt INTENT-006 op. Geen push naar Djinlabs-Mothership, geen canonieke files aangeraakt, geen Hermes/COS/Instinct-secties.

## Hermes-status

> **Eigen zone van Hermes** (Telegram-kanaal, gateway-runtime extern aan deze sessie). Conform formaat: `[YYYY-MM-DD HH:MM] [BRON: Hermes] samenvatting`. Geen nieuws = stilte. Geen mutaties aan Instinct-, COS- of GG Coder-secties.

- [2026-10-12] [BRON: Hermes] Meesync gestart. Heeft founder-instructie 2026-10-12 + canon-statement voor Hermes ontvangen via deze sessie; bevestigt drie-kanalen-architectuur (Notion primair via Hermes/Instinct, GitHub Djinlabs-Mothership secundair via COS, lokale mirror tertiair via GG Coder) en sync-discipline R16 V1.1 (kanoniek-neutraal staging, geen canonieke files geraakt). Sync-pagina-posts lopen via bestaande launchd/keychain-route, niet via deze sessie. Wacht op volgende sync-event.

## Notities

- Deze mirror is kanoniek-neutraal staging (T-04 Q1); raakt geen `_shared/*canon.md`, geen `decisions.md`.
- Update-frequentie: bij elke Ronde of bij sync-waardig nieuws.
- Formaatsverplichting: volg sync-discipline-canon R16 V1.1 §"Drift-detectie trigger" voor elke wijziging.
- COS schrijft niet in canonieke secties of files van Instinct — dat is Instincts territorium, conform hun secretariaats-rol.
- GG Coder schrijft alleen in `## GG Coder-status` en in de `## Hand-edits log` (eigen regel); raakt geen Instinct/COS/Hermes-secties en geen canonieke files.
- Eén schrijver per oppervlak: deze lokale mirror krijgt commits van GG Coder; Djinlabs-Mothership krijgt commits van COS of founder; Notion sync-pagina krijgt posts van Instinct (Instinct status) en Hermes (Hermes-status).
