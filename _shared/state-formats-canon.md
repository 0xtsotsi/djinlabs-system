# state-formats-canon

> **Canoniek principe (Ronde 15):** Markdown = knowledge, JSON = state.

Eén canonieke claim met drie toepassingsgebieden. Dit bestand zegt welke file-soort
in welke rol thuishoort, en verwijst naar de plekken waar dit principe al
half-uitgesproken leeft.

## Vocabulary

### canonieke bron

De Markdown-file in `_shared/` of per-tenant die de regels vastlegt. Git-tracked,
mens-leesbaar, lang-cyclisch. Voorbeelden: `_shared/jev-policy-canon.md`,
`_shared/retention-policy-canon.md`, `_shared/agent-discipline-canon.md`,
`decisions.md` (de Ronde-log).

_Avoid_: bron-van-waarheid, spec

### runtime-state

JSON of YAML die een proces tijdens executie leest en schrijft. Kort-cyclisch,
tooling-leesbaar, niet canoniek. Voorbeelden: `~/.blobbies/blobs/<uuid>/routines.json`,
`~/.blobbies/blobs/<uuid>/runs.json`, `~/Library/Application Support/com.blobbies.app/settings.json`,
`~/Library/Application Support/com.blobbies.app/acp.json`.

_Avoid_: config, state-met-een-sterretje, cache

## De claim

**Markdown is voor kennis. JSON is voor state.**

Een bestand dat *regels* vastlegt voor mensen, op lange termijn, met versiegeschiedenis,
is Markdown. Een bestand dat een proces tijdens executie *leest of schrijft* om de
werkelijke toestand van een sessie, een device of een audit-spoor bij te houden, is JSON.

Wat het niet is:

- Het is **geen** uitspraak dat JSON niet als bron gebruikt *kan* worden. Sommige
  systemen lezen JSON als configuratie. Maar in deze codebase is configuratie die als
  bron fungeert óók een canon-issue: of de configuratie wordt naar Markdown vertaald
  (canoniek) en JSON wordt alleen door tooling gelezen, óf de configuratie is een
  runtime-state en hoort daar.
- Het is **geen** uitspraak dat YAML niet bestaat. YAML wordt in deze codebase niet
  gebruikt; als dat verandert, hoort het hier vermeld te worden.

## Cross-references

Drie plekken in de codebase waar dit principe al half-uitgesproken leeft. Geen van die
plekken is fout — elk noemt een feit dat onder dit principe past:

1. **`decisions.md` Ronde 14 / Q14.5** — zegt "canonieke bron ≠ runtime-bron (skills-only)".
   Onder dit canoniek principe wordt die uitspraak verbreed van skills-only naar
   canoniek-breed (canon, venture, klant, infra).

2. **`_shared/jev-policy-canon.md` regel 19, 74, 132** — noemt `routines.json`, `runs.json`
   en `jev-policy.json` als runtime-state-spiegels bij de canonieke bron. Onder dit
   principe zijn die JSON-files per definitie runtime-state, niet canoniek.

3. **`research/djinlabs-blobbies-fit-research.md` §3 rij "State files"** (gerenamed in Ronde 18) — identificeert
   "Gap: geen state.md met YAML-frontmatter". Onder dit principe is dat geen canoniek
   gat: blobbies heeft runtime-state in `settings.json` en `acp.json` (geen Markdown
   nodig); wat de onderzoeker bedoelde is een *blobbies-implementatie-keuze*, geen claim
   dat runtime-state Markdown moet zijn.

## Observatie-logs (canoniek-neutrale audit-trail in Markdown) — canoniek-uitbreiding-light, Ronde T-05 (2026-10-08)

**Status:** pre-generator hand-edit per sync-discipline R16 §3, gekoppeld aan T-05 closure.

**Context.** Een derde bucket ontstaat in de praktijk waar COS-pilot's `cos/audit-spoor/dispatch-<date>.md` in valt: audit-trail-data in Markdown, leesbaar voor founder-review, geen canon-beslissing, geen process-tooling input. Onder de canonieke claim "Markdown = knowledge, JSON = state" is een dispatch-log geen knowledge in de stricte zin (er staat geen regel in) en geen runtime-state in de stricte zin (geen process-tooling input).

**Canonieke status.** Observatie-logs zijn **toegestaan in `cos/audit-spoor/`** als Markdown-bestanden met een vast kolom-schema (zie `cos/tickets/T-05-state-model.md` §Resolutie voor het per-call kolom-schema). Ze zijn geen canonieke bron en geen runtime-state; ze zijn **kanoniek-neutraal staging-niveau audit-trail**.

**Retention.** Default `operationeel` per `retention-policy-canon.md`; incident-files krijgen `retention: canoniek` via frontmatter-override.

**Open canonieke vraag voor latere Ronde.** Of `state-formats-canon` uitgebreid moet worden met een derde bucket (bv. `observatie`, `kanoniek-neutraal staging`, of vergelijkbaar) is een aparte beslissing. Tot die Ronde leven observatie-logs onder bovenstaande toelating + retention-regime.

**Cross-references voor deze hint:**

- `cos/tickets/T-05-state-model.md` R1 closure — bron van deze hint.
- `cos/tickets/T-04-validatie.md` R1 closure — Q3 "alleen eigen zones" regime waarin `cos/audit-spoor/` valt.
- `_shared/retention-policy-canon.md` — abstracte bron van de retention-hiërarchie.
- `_shared/sync-discipline-canon.md` R16 §3 — pre-generator hand-edit discipline.

## Matrix canonieke bron ↔ runtime-state-spiegels

Niet uitputtend, maar onderhouden bij elke wijziging in `_shared/`. De matrix hoort
bij deze canon, niet bij de individuele canonieke bronnen.

| Canonieke bron (Markdown, git) | Runtime-state-spiegel (JSON, proces) |
|---|---|
| `_shared/jev-policy-canon.md` | `~/.blobbies/blobs/<uuid>/routines.json`, `runs.json` |
| `_shared/retention-policy-canon.md` | (geen directe JSON-spiegel; manifest van opslag, niet canoniek) |
| `_shared/agent-discipline-canon.md` | (geen JSON-spiegel; agents zijn folder-state) |
| `skills/<slug>/SKILL.md` | `~/.blobbies/skills/<slug>/SKILL.md` (Ronde 11 seed_bundled) |
| `_shared/handovers/handover-*.md` | (geen JSON-spiegel; audit-spoor is de file zelf) |
| `decisions.md` | (geen JSON-spiegel; de Ronde-log is git) |

Onderhoud: bij elke nieuwe canonieke bron of runtime-state-file, voeg een rij toe.

## Bewijs-pad

- **Design-doc:** `docs/r15-f1-state-formats-design.md` (de bron van deze canon).
- **Plan:** `docs/r15-f1-state-formats-plan.md`.
- **Frontier-bron:** `decisions.md` Frontier #1 (Ronde 15+).
- **Glossary:** `CONTEXT.md` (canonieke vocabulary).
