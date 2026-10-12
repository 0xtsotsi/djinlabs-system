---
name: r20-cos-canon-v0.2-proposal
description: Voorstel voor v0.2 van `_shared/cos-architecture-canon.md`. Vijf nieuwe secties — §Shadow-mode-contract, §Jev-failure-mode, §Parallelle-sessies, §Pilot-scenario, §Out-of-scope — afgeleid uit T-04, T-07, T-08, T-09 en T-10 (alle closed). Status: ready-for-founder-lock. Niet zelf-promoten (sync-discipline R16 §3, T-04 Q1). Drift-check snapshot aanwezig in ../sync-snapshots/v0.2-pre-lock-drift-check-2026-10-12.md.
status: ready-for-founder-lock
date: 2026-10-12
owner: cos
review_status: pending
reviewer: founder
canonieke-discipline: per `_shared/icm-canon.md` (agent = folder) + T-04 Q1 (cos/_internal/staging/ = kanoniek-neutraal). Bevat géén runtime-blauwdruk; v0.2 = folder-canon-extensie.
related:
  - ../../../../../../_shared/cos-architecture-canon.md (v0.1, huidige canon)
  - ../../../../../../_shared/icm-canon.md
  - ../../../../../../_shared/jev-policy-canon.md (Ronde 17 V1.5, fail-CLOSED-regime)
  - ../../../../../../_shared/sync-discipline-canon.md (Ronde 16)
  - ../../../../../../_shared/agent-discipline-canon.md
  - ../../../../../../decisions.md (Ronde 19, Ronde 20+ kandidaat)
  - ../tickets/T-04-validatie.md (shadow-mode-contract, R1 closure 2026-10-08)
  - ../tickets/T-07-jev-failure.md (R1 closure 2026-10-10, 90-woord contract)
  - ../tickets/T-08-parallelle-sessies.md (R1 closure 2026-10-10, 88-woord contract)
  - ../tickets/T-09-eerste-use-case.md (R1 closure 2026-10-08, Telegram-inbox triage)
  - ../tickets/T-10-niet-doen.md (R1 closure 2026-10-10, 73-woord contract)
  - ../wayfinder-map.md
provenance: COS nightshift 2026-10-12 — frontier-closure Ronde 19 → v0.2-extensie
---

# COS-architecture canon — v0.2 voorstel (folder-canon-extensie)

> **Status:** proposal-draft. Niet canoniek. Founder-commit vereist vóór plaatsing in `_shared/cos-architecture-canon.md`.
> **Doel:** vijf nieuwe secties toevoegen aan v0.1, afgeleid uit T-04, T-07, T-08, T-09 en T-10 (alle closed). Geen runtime-uitbreiding, geen nieuwe scope — alleen de canonieke inkadering van beslissingen die de frontier al nam.
>
> **Correctie t.o.v. eerdere formulering:** T-04 ticket (regel 115) en T-09 ticket (regel 115) committen expliciet v0.2-promotie van respectievelijk §Shadow-mode-contract en §Pilot-scenario + §Success-criteria. Eerder voorstel (3 secties) implementeerde die commitments niet — dit is de volledige versie (5 secties).
> **Volgende stap:** in dezelfde Ronde locken als `decisions.md`-edit (Ronde 20+), founder-commit per sync-discipline-canon V1.1.

## Wat erin zit

Dit voorstel voegt vijf secties toe aan v0.1. De rest van v0.1 (definitie, autoriteit, routes, walk-test, sync-discipline-implicaties) blijft ongewijzigd — drift-detector moet wel lopen vóór lock.

1. **§Shadow-mode-contract** (uit T-04, 91 woorden) — direct na §Autoriteit
2. **§Jev-failure-mode** (uit T-07, 90 woorden) — direct na §Shadow-mode-contract
3. **§Parallelle-sessies** (uit T-08, 88 woorden) — direct na §Routes bij eerste launch
4. **§Pilot-scenario** (uit T-09, 78 woorden) — direct na §Parallelle-sessies (samen vormen ze de v0.2 §T-09-gebruik)
5. **§Out-of-scope** (uit T-10, 73 woorden) — vervangt §"Wat COS NIET is" en breidt die uit

---

## Voorgestelde §Shadow-mode-contract (kanoniek, T-04)

**Resolutie (T-04, founder-bevestigd 2026-10-08, 4/4 tests passing, 91 woorden):**

> In de COS-pilot geldt een shadow-mode-contract met drie actie-types: (1) research-zone writes zijn read-only — COS schrijft niets naar research/, staging-output gaat naar cos/_internal/staging/ of naar chat-rapporten; (2) handover-decisions zijn dry-run — COS doet alsof het routeert naar Hermes/GG/Jev-folders, maar schrijft alleen naar cos/_internal/handover-shadow/<agent>/, Hermes rapporteert wekelijks de match-rate tussen shadow en echte intent; (3) canonieke schrijfacties raken cos/audit-spoor/<YYYY-MM-DD>.jsonl + cos/tickets/T-NN-*.md aan — geen _shared/, geen decisions.md, geen AGENTS.md-routers. Bij incident (canonieke file aangeraakt of uitgesloten item verstuurd): fail-OPEN detectie + audit-spoor-entry in cos/audit-spoor/incident-<ts>.md + directe Hermes-ping + git revert op de canonieke file (fail-CLOSED herstel).

**Bijbehorende regels (canoniek-niveau, volgt uit de resolutie):**

- **Research-zone = read-only.** COS schrijft niets naar `research/`. Staging-output gaat naar `cos/_internal/staging/` of naar chat-rapporten. Geen cross-canoniek contaminatie.
- **Handover = dry-run.** COS doet alsof het routeert naar Hermes/GG/Jev-folders, maar schrijft alleen naar `cos/_internal/handover-shadow/<agent>/`. Hermes rapporteert wekelijks de match-rate (zie T-09 §Success-criteria). Geen echte agent-folder-write.
- **Canonieke schrijfacties = alleen eigen zone.** `cos/audit-spoor/<YYYY-MM-DD>.jsonl` + `cos/tickets/T-NN-*.md`. Geen `_shared/`, geen `decisions.md`, geen `AGENTS.md`-routers.
- **Incident-escape = fail-OPEN detect + audit-entry + Hermes-ping + git revert.** Bij canonieke-file-aanraking of uitgesloten-item-versturen: audit-spoor-entry in `cos/audit-spoor/incident-<ts>.md`, directe Hermes-ping, en git revert op de canonieke file (fail-CLOSED herstel). Vormt de basislaag voor T-07 §Jev-failure-mode.

**Uitgesloten alternatieven (bewust niet gekozen, T-04 risico-tabel):**

- Writes naar research/ (zou cross-canoniek drift veroorzaken).
- Writes naar echte agent-folders zonder shadow (zou agent-side-effects veroorzaken).
- Canonieke file-write in `_shared/`/`decisions.md`/`AGENTS.md` (zou process-wide drift veroorzaken).

**Cross-reference:** T-04 levert de basislaag voor T-07 §Jev-failure-mode (in-flight shadow-freeze + incident-escape komen uit T-04 Q2 + Q4). Bij v0.2-lock in `_shared/` komt dit direct na §Autoriteit te staan, vóór §Jev-failure-mode.

---

## Voorgestelde §Jev-failure-mode (kanoniek)

**Resolutie (T-07, founder-bevestigd 2026-10-10, 4/4 tests passing):**

> COS bij Jev-call unreachable volgt fail-CLOSED per jev-policy-canon §Fail-mode matrix: in-flight handover-shadows worden bevroren in `cos/_internal/handover-shadow/<agent>/<ts>.md` met freeze-flag, en incident-entry gaat naar `cos/audit-spoor/incident-<ts>.md` (T-04 incident-escape). Recovery: zodra Jev-call bereikbaar is, COS replayt bevroren shadows per shadow-mode-contract (T-04 Q2 dry-run) en doet Jev-call per item voordat definitieve dispatch. Founder wordt gealerteerd via audit-spoor-entry + Hermes-ping + chat-kanaal-ping bij high-urgency of N-failures-threshold; geen queue (Ronde 19: geen runtime), geen auto-fallback Hermes (zou T-02 Optie 5 schenden), geen hard-fail-OPEN (canon-inconsistent).

**Bijbehorende regels (canoniek-niveau, volgt uit de resolutie):**

- **Immediate fail-CLOSED.** Geen dispatch bij Jev-down. Geen auto-fallback. Geen queue.
- **In-flight shadow-freeze.** Handover-shadows die op het moment van Jev-down onderweg zijn, worden bevroren in `cos/_internal/handover-shadow/<agent>/<ts>.md` met `freeze: true` frontmatter-flag. Geen rollback, geen discard.
- **Incident-entry.** Per bevroren shadow een entry in `cos/audit-spoor/incident-<ts>.md` (T-04 Q4 incident-escape-pad).
- **Recovery via auto-replay.** Zodra Jev-call bereikbaar is, replayt COS de bevroren shadows in shadow-mode (T-04 Q2 dry-run) en doet Jev-call per item vóór definitieve dispatch.
- **Founder-alert.** Audit-spoor-entry + Hermes-ping + chat-kanaal-ping bij high-urgency of N-failures-threshold. Threshold-waarden horen thuis in T-10-vervolg (zie §Out-of-scope hieronder).

**Uitgesloten alternatieven (bewust niet gekozen, vastgelegd in T-07 risico-tabel):**

- Queue-pending (zou Ronde 19 motie 1 schenden — geen runtime).
- Auto-fallback Hermes (zou T-02 Optie 5 schenden — Jev is gate, niet Hermes).
- Hard-fail-OPEN (canon-inconsistent met jev-policy-canon fail-CLOSED-regime).

---

## Voorgestelde §Parallelle-sessies (kanoniek)

**Resolutie (T-08, founder-bevestigd 2026-10-10, 4/4 tests passing):**

> COS orkestreert parallelle sessies via vier ankerpunten: (1) per-bericht-filenames in handover-shadow voorkomen race-by-design; (2) per-chat-kanaal sequencer (Telegram-FIFO canoniek, geen DjinLabs-runtime); (3) Hermes/GG beoordelen wekelijks in batch (Ronde 19: peer, geen service); (4) dual-version behoud bij onverwachte race, founder arbitreert. Geen file-locks, geen DjinLabs-sequencer (Ronde 19), geen COS-merge (T-02 Optie 5), geen auto-revert (founder = baas). T-09 canon-implicatie: Hermes-als-writer herijkt naar weekly-batch.

**Bijbehorende regels (canoniek-niveau):**

- **Per-bericht-filenames als race-preventie.** Elke handover-shadow krijgt een unieke `<ts>-<msg-id>.md`-naam. Geen gezamenlijke file, geen append-mode.
- **Externe sequencer per chat-kanaal.** Telegram FIFO is canoniek sequencer voor chat-input. Geen DjinLabs-eigen sequencer (Ronde 19 motie 1).
- **Hermes/GG als weekly-batch peer.** Beoordeling van dispatch-suggesties gebeurt wekelijks in batch, niet real-time. Hermes wordt peer (Ronde 19), geen service.
- **Dual-version bij onverwachte race.** COS houdt beide versies; founder arbitreert. Geen COS-merge (T-02 Optie 5), geen auto-revert (founder = baas).

**T-09 canon-implicatie (verwerken in v0.2):** T-09 sloot Hermes-als-real-time-writer (per T-09 R1 closure 2026-10-08). T-08 herijkt dat impliciet naar weekly-batch. v0.2 §Pilot-scenario (zie hieronder) maakt expliciet dat de Telegram-inbox-triage-pilot draait op weekly-batch review, niet op real-time Hermes-write.

**Uitgesloten alternatieven (bewust niet gekozen, vastgelegd in T-08):**

- File-locks (zou agent=folder-principe ondermijnen — `_shared/icm-canon.md`).
- DjinLabs-sequencer (Ronde 19 motie 1).
- COS-merge (T-02 Optie 5 — founder is baas).
- Auto-revert (zelfde — founder arbitreert).

---

## Voorgestelde §Pilot-scenario (kanoniek, T-09)

**Resolutie (T-09, founder-bevestigd 2026-10-08, 4/4 tests passing, 78 woorden):**

> Telegram-inbox triage: COS leest chat-input (Telegram/WhatsApp/Notion-chat) als T-03 input-stroom 'directe founder-input', classificeert per T-03 triggers (intent-detectie, urgency-flag urgent/soon/later, side-effect-sniffer), schrijft dispatch-suggesties naar cos/_internal/handover-shadow/<agent>/<ts>.md (Hermes/GG/Jev), en logt elke sessie naar cos/audit-spoor/<YYYY-MM-DD>.jsonl. Hermes/GG beoordelen wekelijks de match-rate; bij false-positive wordt incident aangemaakt conform T-04 incident-escape (audit-entry + Hermes-ping + git revert op audit-spoor indien nodig).

**Bijbehorende regels (kanoniek-niveau):**

- **Scenario = Telegram-inbox triage.** COS leest chat-input (Telegram/WhatsApp/Notion-chat) als T-03 input-stroom 'directe founder-input'. Classificeert per T-03 triggers (intent-detectie, urgency-flag urgent/soon/later, side-effect-sniffer).
- **Output = dispatch-suggesties.** Geschreven naar `cos/_internal/handover-shadow/<agent>/<ts>.md` (Hermes/GG/Jev). Per sessie een JSONL-rij in `cos/audit-spoor/<YYYY-MM-DD>.jsonl`.
- **Beoordeling = wekelijks door Hermes/GG.** Geen real-time write naar agent-folders (consistent met §Parallelle-sessies). Hermes-rol = peer-review, niet writer.
- **Incident-handling.** Bij false-positive volgt T-04 incident-escape (audit-entry + Hermes-ping + git revert op audit-spoor indien nodig).

**Success-criteria (canoniek-niveau, meetbaar):**

- **Match-rate ≥ 80%.** Hermes' wekelijkse beoordeling van COS' dispatch-suggesties tegen wat Hermes zelf zou hebben gekozen. Ondergrens voor Go-call.
- **False-positive ≤ 5%.** COS stelt nooit een dispatch voor die Hermes zou wegeren. Bovengrens voor Go-call.
- **Beide criteria moeten gehaald worden** (Q2=A met drempel B per T-09 resolutie).

**Time-to-first-value:**

- **7 dagen + Go/No-Go-call.** Bij ≥ 80% match-rate: doorrollen naar T-06 (Jev-calls + match-rate-vraag) en T-05 (state-model). Bij < 80%: T-04-contract herzien (zie §Shadow-mode-contract).
- **Scope = alleen chat-kanaal.** cal.md-events, handover-files van andere agents, git-hook events blijven buiten pilot. Smal beginnen, T-03 input-set 1/6.

**Cross-reference:** v0.2 §Pilot-scenario leunt op v0.2 §Shadow-mode-contract (read-only staging, dry-run handover) + v0.2 §Parallelle-sessies (weekly-batch review, geen real-time write). Bij v0.2-lock in `_shared/` komt dit direct na §Parallelle-sessies te staan, als §T-09-gebruik.

---

## Voorgestelde §Out-of-scope (kanoniek)

**Resolutie (T-10, founder-bevestigd 2026-10-10, COS full-auto mandate D/D/D/D, 4/4 tests passing):**

> COS v0.1 doet expliciet NIET: (1) canon-promotie, agent-roster, klantuitvoer (founder-werk); (2) queue, database, dashboard, eigen runtime (Ronde 19 motie 1); (3) onbekende agent-classes, agents zonder agentId, Hermes-equivalenten (geen onveilige delegatie); (4) bij out-of-scope: defense-in-depth — founder-call voor high-impact, error-response voor low-impact, audit-entry+skip voor spam. Geen auto-promotie, geen eigen runtime, geen agent-zonder-id, geen onveilige escalatie.

**Bijbehorende regels (canoniek-niveau):**

- **Uitgesloten bewerkingen.** Canon-promotie naar `_shared/`, agent-roster-onderhoud, klantuitvoer = founder-werk. Geen auto-promotie.
- **Uitgesloten runtime-onderdelen.** Geen queue, geen database, geen dashboard, geen eigen runtime. Ronde 19 motie 1.
- **Uitgesloten agent-typen.** Geen onbekende agent-classes, geen agents zonder agentId, geen Hermes-equivalenten. Geen onveilige delegatie.
- **Defense-in-depth escalatie.** Bij OOS: founder-call voor high-impact, error-response voor low-impact, audit-entry+skip voor spam. Geen auto-escalatie.

**Open punten (T-10-pending, niet-blokkerend voor v0.2-lock):**

- High-impact vs low-impact classificatie: praktijk-casus per aanvraag, geen rigide regels (Ronde 19: COS = folder, geen classifier-runtime).
- N-failures-threshold voor T-07 founder-ping: parameter, niet canon-niveau; leeft in `cos/audit-spoor/` als runtime-waarde.
- Post-launch evaluatie (3 maanden live, Ronde 22+): welke OOS-keuzes te strak of te los?

**Uitgesloten patronen (bewust niet gekozen):**

- Auto-promotie naar `_shared/` (zou sync-discipline-canon V1.1 schenden — Ronde 16, founder-only).
- Onveilige escalatie via Hermes-peer-DM (zou T-02 Optie 5 schenden).
- Hermes-equivalenten als runtime (zou Ronde 19 motie 1 schenden).

---

## v0.2-promotie-checklist (voor founder, Ronde 20+)

Volgorde om v0.2 in `_shared/cos-architecture-canon.md` te landen, conform sync-discipline-canon V1.1:

- [ ] **Drift-detectie** op v0.1 draaien (zie `_shared/sync-discipline-canon.md` §Drift-detectie). v0.1 moet ongewijzigd zijn vóór v0.2-extensie. (Handmatig gedaan 2026-10-12; zie `cos/_internal/sync-snapshots/v0.2-pre-lock-drift-check-2026-10-12.md`.)
- [ ] **T-04 + T-07 + T-08 + T-09 + T-10 zijn closed** in `cos/wayfinder-map.md` en `cos/tickets/` — bevestigd 2026-10-12.
- [ ] **Vijf nieuwe secties** toevoegen aan `_shared/cos-architecture-canon.md` op de juiste plaats:
  - §Shadow-mode-contract direct na §Autoriteit (logisch: contract omschrijft wat de baas doet, vóór failure-mode).
  - §Jev-failure-mode direct na §Shadow-mode-contract (logisch: failure-mode van de Jev-gate, leunt op T-04 incident-escape).
  - §Parallelle-sessies direct na §Routes bij eerste launch (logisch: route-conflicten tussen meerdere sessies).
  - §Pilot-scenario direct na §Parallelle-sessies (samen vormen ze v0.2 §T-09-gebruik — pilot draait op weekly-batch review).
  - §Out-of-scope vervangt de v0.1 §"Wat COS NIET is"-alinea en breidt die uit (zie migratie-noot hieronder).
- [ ] **Frontmatter** bijwerken: `version: 0.2`, `date: 2026-10-XX` (lock-datum), `revised: 2026-10-XX`, `canonieke-discipline` aanvullen met v0.2-secties + T-04/T-09 commitments.
- [ ] **§"Wat deze canon NIET aangeeft"** in v0.1 verwijderen of herformuleren — T-04 t/m T-10 zijn niet meer pending (T-04, T-05, T-06, T-07, T-08, T-09, T-10 alle closed). T-11 (sync-discipline V2) blijft not-yet-specified.
- [ ] **`decisions.md` Ronde-rij** toevoegen: "Ronde 20+ — 2026-10-XX: v0.2-extensie (3 secties uit T-07/T-08/T-10)".
- [ ] **1 sync-pagina-snapshot** per sync-discipline V1.1.
- [ ] **Wayfinder-map** sluiting-rij toevoegen: T-07 + T-08 + T-10 closure-historiek met link naar v0.2 §Jev-failure-mode, §Parallelle-sessies, §Out-of-scope.
- [ ] **Cos-architecture-canon v0.1 niet-zelf-promoten** — deze staging-file is en blijft kanoniek-neutraal (T-04 Q1) tot founder-commit.

## Migratie-noot voor §Out-of-scope

v0.1 heeft een korte §"Wat COS NIET is" met drie regels (geen runtime, geen agent, geen visibility-laag). v0.2 §Out-of-scope is een uitbreiding daarvan — de drie regels blijven staan als eerste drie bullets, de rest (Ronde 19 motie 1 expliciet, T-02 Optie 5, defense-in-depth escalatie, agent-typen, open punten) komt erbij. Concrete vervanging in v0.1:

| v0.1 (huidig) | v0.2 (voorstel) |
|---|---|
| §"Wat COS NIET is" — 3 regels | §"Out-of-scope" — 4 ankerpunten + open punten + uitgesloten patronen |

## Cross-references voor v0.2

Bij lock toevoegen aan `_shared/cos-architecture-canon.md` §Cross-references:

- `cos/tickets/T-04-validatie.md` (shadow-mode-contract; v0.2 §Jev-failure-mode leunt op T-04 Q2 + Q4)
- `cos/tickets/T-07-jev-failure.md` (R1 closure 2026-10-10; bron §Jev-failure-mode)
- `cos/tickets/T-08-parallelle-sessies.md` (R1 closure 2026-10-10; bron §Parallelle-sessies)
- `cos/tickets/T-09-eerste-use-case.md` (R1 closure 2026-10-08; v0.2 §Parallelle-sessies T-09-implicatie)
- `cos/tickets/T-10-niet-doen.md` (R1 closure 2026-10-10; bron §Out-of-scope)
- `decisions.md` §"Ronde 20+ — 2026-10-XX: v0.2-extensie"

## Niet in v0.2 (bewust uitgesteld)

- T-11 sync-discipline V2 — wacht op Hermes-akkoord + Ronde-traject (`cos/tickets/T-11-sync-discipline-v2.md`).
- Not-yet-specified items uit wayfinder-map §"Not yet specified" — blijven in de wayfinder-map, geen canon-promotie zonder ticket.
- Runtime-implementatie — blijft expliciet out-of-scope per Ronde 19 motie 1 en T-10.

## Notities

- 2026-10-12: Voorstel aangemaakt door COS nightshift na bevestiging dat T-07/T-08/T-10 closed zijn op disk. Staging-zone `cos/_internal/staging/` aangemaakt per T-04 Q1 (was nog niet op disk).
- 2026-10-12: v0.1 §"Wat deze canon NIET aangeeft" bevat nog T-04 t/m T-10 als "pending r19-herijking" — dat is stale (alle tickets closed). Bij v0.2-lock moet deze sectie gemigreerd worden.
- 2026-10-12: `_shared/cos-architecture-canon.md` zelf verschijnt als `??` (untracked) in `git status` — drift-risico per sync-discipline-canon V1.1. Aandachtspunt voor founder-lock-traject.
- 2026-10-12: Uitbreiding van 3 → 5 secties. Eerste versie van staging noemde alleen T-07/T-08/T-10; T-04 en T-09 ticket-files committen expliciet v0.2-promotie van respectievelijk §Shadow-mode-contract en §Pilot-scenario + §Success-criteria. Toegevoegd om die commitments niet te laten vallen.
