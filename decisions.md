# DjinLabs × Webrnds — Grilling Decisions Log (cumulative)

> Status: **cumulative decisions log**, not the final spec. Grilling at **Ronde 12 (Djin embedding in DjinLabs-Webrnds-Umbrella)**; canonical Webrnds tree is geland op disk; Djin is gespiegeld als eerste tenant via symlinks; X (Q6.2 trigger), merklaag, prijspunten, and agent-mapping (Q13) stay parked for the user.
> Source of truth for everything we decided so far, including rounds that landed before the host-gate stall.
> Last update: 2026-09-19.
> Awaiting: nothing blocking. Ronde 13 opent met agent-mapping + skills-hosting + Money-discipline zodra user dat wil.

## TL;DR (decisions so far)

DjinLabs is an **internal orchestration layer** (not a KVK entity, not a holding) that owns the 1-folder template + ICM + Jev decision layer + ~8 universal hard rules. **Webrnds is the first instance** of that template, lives in the same monorepo as workspace #2, runs the Codavo-shaped services (websites, webapps, klantportalen, API-koppelingen, AI-integraties, GEO/AI-visibility) at Codavo-comparable prices, and pays for the DjinLabs-side of the codebase out of an internal R&D pot. The second instance that proves DjinLabs is a real template — not a holding-grap — is **created deliberately by the founder**, on their own schedule.

The whole point of the four-layer rot-prevention (map / state / enforcement / cadence) is to make sure the folder tree ends up looking like *OathDriven as you run it*, not like the anti-pattern example below — and the candidated draft of U1–U8 exists specifically to enforce that.

## Anti-pattern reference (saved here because it informed Ronde 7 item 3)

This is what the folder system *must not become*. Without start files, state files, hooks, and a Sunday audit, this is what 2–3 weeks of unattended growth produces:

```
📁 One Folder
 ┣ 📁 Important
 ┣ 📁 Really Important
 ┣ 📁 Final
 ┣ 📁 Final Final
 ┣ 📁 FINAL_USE_THIS
 ┣ 📁 Old
 ┣ 📁 New
 ┣ 📁 Misc
 ┣ 📁 Misc 2
 ┣ 📁 Stuff
 ┣ 📁 Stuff (1)
 ┣ 📁 Stuff (Final)
 ┣ 📁 Untitled
 ┣ 📁 Untitled (2)
 ┣ 📁 Projects
 ┣ 📁 Archive
 ┣ 📁 Archive (Old)
 ┣ 📁 Archive (Older)
 ┣ 📁 Do Not Delete
 ┣ 📁 Do Not Delete (2)
 ┣ 📁 Backup
 ┣ 📁 Backup of Backup
 ┣ 📁 Random
 ┣ 📁 Temp
 ┣ 📁 Maybe Delete
 ┣ 📁 Probably Delete
 ┣ 📁 Actually Useful Maybe?
 ┣ 📁 IDK
 ┣ 📁 Stuff I Might Need
 ┣ 📁 Things
 ┣ 📁 More Things
 ┣ 📁 Even More Things
 ┣ 📁 Seriously, Don't Delete
 ┣ 📁 To Sort
 ┗ 📁 Nested Stuff
    ┗ 📁 Even Deeper
       ┗ 📁 Deepest Level
          ┗ 📁 Are We There Yet?
             ┗ 📁 Almost There
                ┗ 📁 One More
                   ┗ 📁 More Stuff
                      ┗ 📁 More Stuff 2
                         ┗ 📁 Last Folder
                            ┗ 📁 No Really Last Folder
```

The structural rules we derived to prevent this are in `research/hard-rules-inventory.md` (U1 folder=company+start/state, U4 top-file-only-routes, U5 state-date-wins-over-mtime, U7 sunday-audit). The foldertree decision (Ronde 7 item 3) is the place where those rules become concrete shape.

## Decision log

### Ronde 1 — what Webrnds is

| Question | Answer |
|---|---|
| Q1 — What is Webrnds, fundamentally? | **Instance of a DjinLabs template**, not a freelance agenda. The system is the product, not the engineer's calendar. |
| Q2 — Who is the buyer? | **Same Dutch MKB audience as Codavo** (techniek, logistiek, SaaS, klinieken, etc.), with the **same underlying services** (websites, webapps, klantportalen, API-koppelingen, AI-integraties, GEO/AI-vindbaarheid). |
| Q3 — Revenue model? | **Hybrid**: platform-licentie op het 1-folder/ICM/Jev-systeem + Codavo-shaped bouwdiensten bovenop. |
| Q5 — The `rnds` in Webrnds? | **R**esearch **a**nd **D**evelopment **S**ervice (afkorting, niet uitgesproken). |

**Structural implication:** DjinLabs ≠ Webrnds. DjinLabs is the umbrella + folder-template-system that sits *above* Webrnds. Webrnds is instance #1.

### Ronde 2 — structure, contents, licensing, role split

| Question | Answer |
|---|---|
| Q1 — Folder hierarchy | **One template, multiple instances.** DjinLabs contains the template; Webrnds is instance #1; Webrnds' customers also get instances. |
| Q4 — What ships in a Webrnds customer folder | **Business layer + bare UI shell** (login, billing, agent-inbox). Customer fills it with Codavo-shaped services. |
| Q6 — Licensing model | **Webrnds pays DjinLabs internally**; customers don't see DjinLabs in their contract path. (NB: DjinLabs has no KVK entry, so this is a *cost line on Webrnds' books*, not an inter-company invoice.) |
| Q7 — What is DjinLabs without Webrnds? | **Holding cost-centre, not an external product.** No standalone revenue yet. |

### Ronde 3 — how the cost-centre runs

| Question | Answer |
|---|---|
| Q3.1 — When does DjinLabs become a "real" template company? | **Trigger N=1** — when the founder deliberately creates a second venture. Then DjinLabs stops being a holding and becomes a template-company with one external tenant + Webrnds as showcase. *(Revised in Ronde 5 — see below; the second venture is internal, not a separate KVK entry.)* |
| Q3.2 — What does DjinLabs deliver to Webrnds? | **Template + ICM/Jev/agent + updates + Sunday-audit as managed service.** (User repeated the Q3.1 answer for Q3.2; treated as "no extra deliverables beyond the above".) |
| Q3.3 — What does DjinLabs do with the fees? | **Reinvest in engineer-hours + infra.** No dividend while there's only one tenant; dividend starts at the Q3.1 trigger. |
| Verduidelijking | **DjinLabs is geen echte LLC, geen KVK-inschrijving.** Only Webrnds is in the KVK. DjinLabs is merklaag + strategie + folder in de monorepo. Webrnds is the executing entity. |

### Ronde 4 — who is the second instance

| Question | Answer |
|---|---|
| Q4.1 — Who is the second venture? | **Deliberately created by the founder** (not dependent on Webrnds' customer base). Schedule is the founder's call. |

### Ronde 5 — what the second venture actually is, where the template lives

| Question | Answer |
|---|---|
| Q5.1 — What is the second venture? | **Internal R&D function** that maintains DjinLabs-template work and serves Webrnds + future tenants. **Never registered at KVK** — it operates as an *orchestration layer* within the monorepo, not a separate business. *(This revised Ronde 3/Q3.1 — DjinLabs' "template status" is now measured by behaviour, not by an external entity.)* |
| Q5.2 — Where does the template live? | **Separate monorepo `/djinlabs`** with workspaces. Webrnds is workspace #1; future tenants become other workspaces. |
| Q5.3 — How many hard rules ship universally? | **~8 fundamental rules** (e.g. "no secrets to logs", "everything via hooks", "every folder has start + state"); the rest stay per-instance. Otherwise the template becomes either a coercive mould or an empty husk. |

### Ronde 6 — workspace layout, who maintains, rule inventory

| Question | Answer |
|---|---|
| Q6.1 — How is DjinLabs visible in the monorepo? | **DjinLabs as workspace, Webrnds as workspace, peer level.** That is what "monorepo with workspaces" literally means. |
| Q6.2 — Who does DjinLabs maintenance in practice? | **Founder alone in the showcase phase (option a)**, with an explicit trigger to move to (b) hire a part-time engineer or (c) rotate Webrnds engineers when Webrnds' facturatie > **X**. **X is still open — needs founder's number.** |
| Q6.3 — Which 8 rules ship universally? | **Candidated draft landed at `research/hard-rules-inventory.md`** — 8 candidates (U1 folder=company + start/state, U2 everything-via-hooks, U3 no-secrets-to-logs, U4 top-file-only-routes, U5 state-date-wins-over-mtime, U6 newest-date-wins, U7 sunday-audit, U8 failures-as-negative-examples) + per-instance rules listed for contrast. **Draft only — needs user to confirm, amend, or paste the real 16.** |

### Ronde 7 — foldertree top-level shape, klant-home, klantreis-vorm

| Question | Answer |
|---|---|
| Q7.1 — Top-level werk-folders | **Werk-flow as canoniek** (research/offer/market/close/produce/na-livegang). Werk-flow is canonieker dan dienst-catalogus; dienstenpalet kan veranderen zonder de boom te hernoemen. Na-livegang verdient eigen discipline. |
| Q7.2 — Waar woont de klant | **Eén `clients/<slug>/` met canonieke sub-shape per klant**. Voorspelbaar voor ICM en agents; rot-vrij. |
| Q7.3 — Welke Codavo-as wordt de `clients/<slug>/` shape | **(a) parallel** — meerdere `klantreis-<id>/` per klant. Elke rit heeft eigen start + state; kanonieke fasen (kennismaking/strategie/ontwerp/lancering/na-livegang/groei) als submappen. Meerdere reizen per klant is een feature, geen bug. |

### Ronde 8 — naam-conventie, cap, _internal_ inhoud

| Question | Answer |
|---|---|
| Q8.1 — `<klant-slug>` naam-conventie | **Lowercase-hyphenated bedrijfsnaam** (bv. `youri-van-koppen-golf`). Leesbaar voor mens en agent; privacy afgedekt door U3 (geen PII in foldernaam). |
| Q8.2 — Hoeveel klantreizen tegelijk per klant | **Max 3 actieve reizen** (cap, optie b). Hook checkt bij create; afgeronde reizen verhuizen naar `clients/<slug>/_archive/` en tellen niet mee voor de cap. (Anders wordt de cap een mal.) |
| Q8.3 — Wat zit er in `_internal/` | **(b) R&D-pot-tracking + leer-artefacten** (Sunday-audit-uitkomsten, retros, lessons-learned). Klant-overstijgende experimenten in `/djinlabs` workspace, niet in Webrnds. |

### Ronde 9 — ICM-subruimtes per fase (kanonieke discipline per fase)

| Question | Answer |
|---|---|
| Q9.1 — Waar woont de agent-definitie | **Hybride**: Djin-agents universeel in DjinLabs, klant-specifieke agents in Webrnds. |
| Q9.2 — Output naar `_dossier/` of ander pad | **`_dossier/` als verborgen map** (prefix underscore). Dossier is voor agent-output, niet sibling van `_specificatie/`. |
| Q9.3 — Wie start de agent | **Hook detecteert, user bevestigt** via commando (bv. `/djin run intake-qualifier klantreis-47`). Geen stiekeme agent-triggers. |

### Ronde 10 — agents-verdeling Djin universeel vs klant-specifiek

| Question | Answer |
|---|---|
| Q10.1 — Hoe worden klant-specifieke agents gedefinieerd | **(b) Djin-scaffold + klant-wrapper**. Inheritance via include; scaffold is DjinLabs' waarheid, wrapper is Webrnds' waarheid. Past bij U2 (alles via hooks) en U3 (geen globale aannames). |
| Q10.2 — Hoeveel klant-specifieke agents per klant | **Eén agent per fase** (ontwerp-agent, bouw-agent, support-agent, growth-agent). Fase = eigen bounded context; geen god-agent. |
| Q10.3 — Waar leeft de klant-specifieke agent fysiek | **`clients/<slug>/_agents/<fase>-agent.md`** (optie b). Support-agent en growth-agent gelden over reizen van dezelfde klant heen; per-klant is canoniek. |

### Ronde 11 — ICM-canon toepassen op de boom

| Question | Answer |
|---|---|
| Q11.1 — Hoe strak volgen we de ICM-canon | **(b) Strict op discipline, vrij op naam**. Canonieke ICM-discipline (router, CONTEXT.md, factory/product-split, status-frontmatter, walk-test) verplicht; Webrnds houdt eigen namen (`_internal/` i.p.v. `_reference/`). |
| Q11.2 — Waar staat de Webrnds-root router fysiek | **(c) Umbrella-vorm**. Eén root-router (`/djinlabs_system_design/AGENTS.md`) + twee sub-routers (`/djinlabs/AGENTS.md` + `/webrnds/AGENTS.md`). Past bij "twee verschillende workflows onder één root". |
| Q11.3 — Eén folder of een mono-repo | **(a) Mono-repo** `/djinlabs_system_design/` met `/djinlabs/`, `/webrnds/`, `/_shared/`. Past bij "1 LLC, meerdere merken eronder" (SESSION-BRIEF). |

### U9-call (ge vouwen na Ronde 11)

**Beslissing:** de actieve-reizen-cap (max 3 per klant, Ronde 8/Q8.2) wordt een **instance-rule** in Webrnds' `/webrnds/_rules.local.md`, expliciet geschreven. U1+U5+U7 dwingen rot-vrij af maar geen aantallen — dat is een capacity-rule, niet een capability-rule.

Aanvullend in `/webrnds/AGENTS.md`: "afgeronde reizen verhuizen naar `clients/<slug>/_archive/`" is een U5-ding en staat in de instance-rule.

### Ronde 12 — Djin embedden in DjinLabs-Webrnds-Umbrella

**Context:** Djin is een bestaande Bolt-app op `/Users/gogetta/Documents/projects/slack/` met zes ICM-mappen (`Clients/`, `Sales/`, `Work/`, `Money/`, `Team/`, `Context/`), 3 live agents (`sales/`, `work/`, `notes/`) + 3 scaffold agents, een eigen `.gg/` flow-engine, en een `src/icm.ts` containment-API. User-call: Djin is **in opdracht van DjinLabs**, niet andersom. Djin's filosofie en functionaliteit blijven intact; zijn embedding in de umbrella wordt ge-update.

| Question | Answer |
|---|---|
| Q12.1 — Klant-folder conflict (Djin `Clients/` vs Webrnds `clients/`) | **(a) Twee aparte domeinen.** Djin's `Clients/` = relatie-data (facturatie-relatie, history, contacten, geen trajecten). Webrnds' `clients/<slug>/klantreis-<id>/` = service-delivery trajecten (Codavo-shape klantreizen met 6 fasen). Geen data-overlap; geen migratie. |
| Q12.2 — Folder-embedding: mono-repo of aparte folders | **(c) Hybride via symlinks.** Webrnds-skeleton blijft canoniek in `/djinlabs_system_design/`. Djin blijft operationeel op zijn huidige locatie. Djin's `ICM/`, `agents/`, `agent/`, `src/`, `scripts/`, `.gg/`, `.agents/`, `.claude/`, `.scratch/`, plus canonieke files (`SESSION-BRIEF.md`, `package.json`, `tsconfig.json`, `slack-app-manifest.yaml`, `skills-lock.json`, `.gitignore`) worden gespiegeld vanuit `/djinlabs_system_design/djinlabs/tenants/djin/` via symlinks. Geen fysieke migratie, geen breaking change. |
| Q12.3 — Naming van Djin's zes mappen in umbrella-context | **(a) Ongewijzigd.** `Clients/`, `Sales/`, `Work/`, `Money/`, `Team/`, `Context/` blijven zoals ze zijn. Djin's runtime leest die paden letterlijk; hernoemen breekt de Bolt-app. Umbrella-context zit in de parent-folder. |
| Q12.4 — Hoe wordt Djin's `Context/context.md` umbrella-aware | **(a) Pointer-sectie toevoegen.** Append-only, geen refactor. Bestaande runtime-specifieke secties blijven canoniek; nieuwe sectie `# Umbrella-relaties` na `## Hoe Djin dit leest` beschrijft embedding + boundaries. `src/help.ts` parsed `## Slash-command routing` tot eerstvolgende `\n## ` header — toevoeging sluit de routing-sectie af zoals hij al was, geen breaking change. |

**Wat er nu op disk staat (2026-09-19):**

- `/djinlabs_system_design/djinlabs/tenants/djin/AGENTS.md` — tenant-view (61 regels).
- 15 symlinks vanuit `tenants/djin/` naar Djin's echte locatie.
- `/Users/gogetta/Documents/projects/slack/ICM/Context/context.md` — geappend met `## Umbrella-relaties` sectie.

**Boundary-discipline:**

- Djin schrijft niet buiten `~/Documents/projects/slack/` (enforce via `src/icm.ts` containment, onveranderd).
- Djin leest **wel** uit umbrella (`/djinlabs/`, `/webrnds/`, `/_shared/`) — read-only, geen write.
- Webrnds schrijft **niet** in Djin's folders.

### Ronde 13 — Djin self-locating + client-prefix stub

**Context:** Ronde 12 spiegelde Djin als tenant via 15 symlinks vanuit `/djinlabs_system_design/djinlabs/tenants/djin/`. Dat werkt voor lezen, maar Djin's runtime breekt zodra hij vanuit een andere cwd of via de symlink-pad gedraaid wordt: 6 plekken in Djin's kern gebruikten `process.cwd()` als project-root-anchor — niet robust tegen cwd-wijzigingen of symlink-resolutie. Ronde 13 maakt Djin **self-locating**: binary-anchor (zoals `src/agent/registry.ts` al deed) in plaats van cwd-anchor. Plus één stub `resolveClientPrefix()` als voorbereiding op de toekomstige front-end-adapter-beurt, zonder die abstractie vandaag te bouwen.

**User-call (samengevat):**

- (b)+stub-aanpak: canonieke discipline (registry.ts-patroon) volgen, geen folder-abstractie nu.
- **"Djin is vast, app wisselt"** — canoniek principe vastgelegd in `decisions.md`.

| Question | Answer |
|---|---|
| Q13.1 — Hoe wordt Djin cwd-onafhankelijk | **Self-locating via `getProjectRoot()`** (zoals `registry.ts` al deed), niet `process.cwd()`. Past bij U4 (top-file-only-routes — runtime is locatie-onafhankelijk). |
| Q13.2 — Bouwen we nu een front-end-adapter-abstractie | **Niet nu.** Adapter-beurt komt pas bij tweede front-end (webhook, e-mail, web UI). Stub `resolveClientPrefix()` in `config.ts` voorbereidt zonder abstractie te bouwen. Past bij Matt Pocock's "Config is death". |
| Q13.3 — Canoniek principe | **Djin is vast, app wisselt.** Slack-facing adapters zijn tijdelijk; Djin's kern is permanent. Vastgelegd zodat toekomstige rondes niet vergeten dat Slack uitwisselbaar moet zijn. |

**Wat er op disk staat (2026-09-19):**

- `src/agent/registry.ts` — `getProjectRoot()` als publieke export (binary-anchor) + `realpathSync(__dirname)` zodat umbrella-symlink-pad ook naar de echte `dist/` resolvet.
- `src/icm.ts` — `ICM_ROOT = resolve(getProjectRoot(), "ICM")` (was `process.cwd()`).
- `src/agent/dispatcher.ts` — `projectRoot?: string` + `effectiveRoot = projectRoot ?? getProjectRoot()` body-default.
- `src/agent/{sales,work,notes}-loop.ts` — 3x `resolve(getProjectRoot())` i.p.v. `resolve(process.cwd())`.
- **`smoke.ts` — 0 fix** (regressie-test; blijft `process.cwd()` tot een tweede front-end daar eisen stelt).
- `src/config.ts` — `resolveClientPrefix()` stub + `config.clientPrefix` property.
- `.env.example` — `# DJIN_CLIENT_PREFIX=webrnds-` documentatie-regel.

**Boundary-discipline (verandert niet):**

- Djin schrijft niet buiten `~/Documents/projects/slack/` (enforce via `src/icm.ts` containment).
- Symlinks in `/djinlabs_system_design/djinlabs/tenants/djin/` blijven puur lees-door-pointers; binary-anchor resolved nog steeds naar Djin's echte locatie, niet de symlink.

### Canonical Webrnds tree — geland op disk (skeleton-only)

De boom staat op disk sinds 2026-09-19. **27 bestanden, 839 regels, 0 lege containers.**

```
/djinlabs_system_design/                       ← mono-repo root
├── AGENTS.md                                  ← root-router (umbrella, met project-state + umbrella-sectie)
├── _shared/                                   ← canonieke bronnen
│   ├── AGENTS.md
│   ├── hard-rules.md                          ← pointer naar research/hard-rules-inventory.md
│   ├── naming-conventions.md
│   └── icm-canon.md
├── djinlabs/                                  ← onderneming #1: template-onderhoud
│   ├── AGENTS.md, start.md, state.md
│   ├── _internal/CONTEXT.md                   ← R&D + leer-artefacten + experimenten
│   └── skills/CONTEXT.md                      ← Djin-agents universeel (scaffold-only)
└── webrnds/                                   ← onderneming #2: klantreis-uitvoering
    ├── AGENTS.md, start.md, state.md
    ├── _rules.local.md                        ← incl. cap-regel (U9-call)
    ├── _internal/CONTEXT.md                   ← Webrnds-spec R&D + leer-artefacten (geen experimenten)
    ├── _archive/CONTEXT.md                    ← afgeronde klanten
    ├── _templates/                            ← klant-template, klantreis-template, fase-template
    ├── 01-research/CONTEXT.md t/m 06-na-livegang/CONTEXT.md   ← 6 numbered pipeline stages
    ├── skills/CONTEXT.md                      ← klant-spec wrapper-templates per fase
    └── clients/CONTEXT.md                     ← canonieke sub-shape per klant (uitleg; geen klanten nog)
```

Wat **niet** op disk staat maar wel in de boom thuishoort:
- Agent-scaffolds in `/djinlabs/skills/<naam>/SKILL.md` (lege folders nog niet aangemaakt; CONTEXT.md van `skills/` legt het formaat uit).
- Klant-spec wrappers in `/webrnds/skills/<fase>-wrapper/SKILL.md` (idem).
- Concrete klant-folders in `/webrnds/clients/<slug>/` (eerste klant komt via folder-shape-hook, niet handmatig).
- Bestaande agent-output (dossiers) — die worden per klant aangemaakt door de agent wanneer de eerste fase start.

## Open frontier — Ronde 14 onwards

The grilling pauses here. When it resumes, the frontier is:

1. **Q6.3 (close-out, awaiting confirmation)** — `research/hard-rules-inventory.md` has the candidated draft of 8 universal rules + per-instance contrast list. User needs to confirm / amend / replace.
2. **Q6.2 trigger X** — Welke omzet-/facturatie-grens triggert de overstap van (a) naar (b) of (c) voor DjinLabs-onderhoud? **Parked for the user.**
3. **Djin-self-locating** — ✅ **Answered + geland op disk** (Ronde 13). Binary-anchor via `getProjectRoot()`; 6 `process.cwd()`-callers omgezet; `resolveClientPrefix()` stub in `config.ts`.
4. **Merklaag** — Hoe presenteert DjinLabs zich naar buiten zonder KVK-inschrijving? **Parked for the user.** (Webrnds factureert, DjinLabs levert template; één klant ziet DjinLabs, de rest niet — of toch wel?)
5. **Prijspunten hybride model** — Welk deel van de Webrnds-omzet vloeit naar de DjinLabs R&D-pot, op welke noemer? **Parked for the user.**
6. **Front-end-adapter-abstractie** — 🅿️ **Parked.** Wacht op tweede front-end (webhook, e-mail, web UI). `resolveClientPrefix()` stub in `config.ts` voorbereidt zonder abstractie te bouwen.

## Done in earlier turns

- Codavo competitive research: `research/codavo-competitive-brief.md` (with provenance header).
- Hard-rules candidated draft: `research/hard-rules-inventory.md` (with verification trail footer).
- Grill-me skill installed from `mattpocock/skills` (project-local in `.agents/skills/`); `grilling` SKILL loaded into the conversation.
- Canonical Webrnds tree geland op disk (2026-09-19, skeleton-only): 27 bestanden, 839 regels.
- ICM-canon pointer in `/_shared/icm-canon.md`; user can refer to `community-workflow-kit/workflow-package-builder/references/icm-design-rules.md` voor de volledige bron.
- U9-call gevouwen: cap is een instance-rule in `/webrnds/_rules.local.md`.
- Matt Pocock custom skills research: `research/matt-pocock-custom-skills-proposal.md` (voorstel voor `webrnds-onboard`, `webrnds-r-and-d-prototype`, `webrnds-upkeep`).
- Djin embedding geland (2026-09-19): 15 symlinks + `tenants/djin/AGENTS.md` (61 regels) + Djin's `Context/context.md` umbrella-aware via append-only pointer-sectie.
- Djin self-locating fix geland (2026-09-19): `getProjectRoot()` in `registry.ts` (incl. `realpathSync`-safety voor umbrella-symlinks); 6 callers bijgewerkt (`icm.ts`, `dispatcher.ts`, 3 agent-loops); `resolveClientPrefix()` stub in `config.ts`; `.env.example` regel toegevoegd. Canoniek principe: **Djin is vast, app wisselt.**


## Process notes

- The grilling is led by the user's own answers; each round I propose options with a recommendation, the user picks.
- Original instruction was *"Schrijf nog niets uit — laat grill-me het werk doen."* `decisions.md` and the two research files exist to **land what was in flight** after a long host-gate stall, **not** to short-circuit the grilling.
