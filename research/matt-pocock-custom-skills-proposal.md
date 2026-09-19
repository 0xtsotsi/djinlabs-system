# Matt Pocock Custom Skills — voorstel voor Webrnds

> **Research + audit, geen implementatie.** Op verzoek van de founder.
> Datum: 2026-09-19.
> Bronnen: `mattpocock/skills` (36 skills lokaal geïnstalleerd in `.agents/skills/`), `aihero.dev/skills` overzichtspagina + 3 detail-pagina's, `workflow-audit.md` SKILL (user upload, MIT, Van Clief & McDermott 2026).

## 1. Wat Matt Pocock's skill-systeem eigenlijk is

`mattpocock/skills` is geen "templates-set". Het is een **opinionated engineering flow** met één duidelijke ruggegraat en een paar standalones eromheen.

### De main flow (idea → ship, in volgorde)

```
grill-me / grill-with-docs  →  to-spec  →  to-tickets  →  implement  →  code-review
  (interview)                  (spec)     (decompositie)  (bouw)        (review)
```

Plus de **run-once setup** die vóór alles komt:

```
setup-matt-pocock-skills  →  configureert één repo: issue tracker, triage labels, domain docs
                              schrijft docs/agents/{issue-tracker,domain,triage-labels}.md
```

En **drie typen standalones** die je op elk moment kunt bereiken:

- **Verkennen van opties zonder commit**: `wayfinder` (grote effort als map van decisions), `prototype` (één design-vraag, throwaway code), `research` (cited answer uit primary sources).
- **Codebase onderhoud**: `improve-codebase-architecture`, `diagnosing-bugs`, `resolving-merge-conflicts`, `triage`, `wizard`.
- **Menselijke workflows**: `grill-me`, `handoff`.

### Drie canonieke mechanismen die het systeem dragen

**1. Per-repo configuratie in markdown, niet in globals.** `setup-matt-pocock-skills` schrijft `docs/agents/issue-tracker.md`, `docs/agents/domain.md`, en (optioneel) `docs/agents/triage-labels.md`. Die files zijn de enige bron van waarheid voor "waar issues leven", "welke labels bestaan er", "waar staat `CONTEXT.md`". Skills zijn identiek tussen repos; alleen de docs variëren.

**2. Stateless vs. stateful grilling.** `grill-me` schrijft niets en laat niets achter — het enige wat het produceert is een scherper idee in je hoofd. `grill-with-docs` is dezelfde interview-flow maar leest je codebase en legt `CONTEXT.md` + ADRs aan. **Dezelfde flow, twee modi.**

**3. Folder-discipline = primary source.** Een prototype wordt NIET verwijderd maar gecommit op een `prototype/<naam>`-branch, met een context-pointer in de implementatie-issue. Een ADR wordt aangemaakt *lui* (alleen als een term of beslissing echt gevallen is), niet preventief. Een wizard-script wordt gegenereerd, niet door een model gerund.

### Wat NIET in het systeem zit (en dat is een keuze)

- Geen per-user config in `~/.claude`. Elke repo draagt zijn eigen `docs/agents/`.
- Geen global preferences in `setup-matt-pocock-skills`. *"Config is death."* Voorkeuren horen in `CLAUDE.md` als plain instructions.
- Geen user-invoked skill wordt model-invoked gemaakt `disable-model-invocation: true` zit op `grill-me` en `setup` zelf. Andere skills (`wizard`, `prototype`) zijn model-invocation-added; je kunt ze nog steeds zelf triggeren.

## 2. Wat we al hebben — de Webrnds-skeleton vs. Matt Pocock's pattern

De skeletons die ik gisteren op disk zette (`djinlabs_system_design/{_shared,djinlabs,webrnds}/`) overlappen op drie punten met `mattpocock/skills`:

| Wat we hebben | Matt Pocock equivalent | Kloof |
|---|---|---|
| `AGENTS.md` als root-router + 2 sub-routers | `setup-matt-pocock-skills` schrijft `## Agent skills`-blok in `AGENTS.md` / `CLAUDE.md` | Geen kloof; al canoniek |
| `_shared/icm-canon.md` als pointer | `docs/agents/domain.md` als pointer met self-discovery | **Kloof**: domain.md zegt *"don't flag their absence; don't suggest creating them upfront"*. Onze `_shared/icm-canon.md` zegt hetzelfde maar is Webrnds-specifiek. Geen canoniek conflict, wel twee canonieke pointers met dezelfde functie. |
| `_templates/klantreis-template/` als skeleton | Geen equivalent — Matt Pocock's skills zijn prompt-driven, niet folder-shaped | **Kloof**: wij hebben een fysieke boom waar de folder de agent-architectuur is; Matt Pocock's systeem niet. Dit is een fundamenteel andere abstractie. |
| 6 numbered pipeline stages per klantreis | Workflow-audit verdict → AUTOMATE/HYBRID/MANUAL structuren | **Sterke overlap**: workflow-audit's HYBRID-pattern (research → draft → review_gate → execute) is canoniek voor onze Webrnds-fasen `kennismaking → strategie → ontwerp → lancering → na-livegang → groei`. Niet 1-op-1 (Codavo's 6 fasen vs. workflow-audit's 4 fasen), maar de **discipline** is dezelfde. |
| Cap van 3 actieve reizen per klant in `_rules.local.md` | Geen equivalent | **Eigen vinding**: capacity-rule, niet capability-rule. Past niet in Matt Pocock's pattern — die heeft geen tenant-caps. |
| `_dossier/` als hidden output-folder + `review_status` frontmatter | `gate.md` + `approved.md` in workflow-audit HYBRID | **Sterke overlap**: workflow-audit's gate-discipline is precies wat onze `_dossier/` zou moeten doen. Verschil: workflow-audit heeft dedicated `_review_gate/` folders; wij gebruiken het frontmatter-veld in plaats daarvan. |

**Belangrijkste verschil**: Matt Pocock's systeem is **opinionated over per-repo config**, niet over per-tenant of per-business-unit config. Onze Umbrella-vorm (DjinLabs + Webrnds + toekomstige tenants) heeft een extra abstractielaag die Matt Pocock's `setup`-skill niet dekt.

## 3. Drie custom skills voor Webrnds — voorstel

Hieronder drie custom-SKILLs die voortbouwen op Matt Pocock's pattern + onze skeleton + de `workflow-audit` SKILL die de user al uploadde. Per skill: doel, trigger, contract, hoe het leeft in de skeleton, en wat het NIET doet.

---

### 3.1 `webrnds-onboard` — onboarding-flow voor een nieuwe klant

**Doel.** Een verse prospect wordt in 1 sessie omgezet tot een werkende `clients/<slug>/klantreis-<id>/01-kennismaking/` met start.md, state.md, _rules.local.md, _agents/ skeleton, en een pending intake-dossier. Geen ad-hoc folder-creatie achteraf.

**Trigger.** User typt `/onboard` met een prospect-slug of intake-data, of agent bereikt dit zelf wanneer `04-close/CONTEXT.md`'s pipeline-trigger afgaat.

**Contract (Layer 3 reference, leeft in `_shared/skills/webrnds-onboard/SKILL.md`).**

- **Inputs**: (a) prospect-slug + intake-data (transcript, mail, formulier), (b) `_shared/hard-rules.md` voor canon, (c) `/djinlabs/skills/intake-qualifier/SKILL.md` voor ICP-fit.
- **Process**:
  1. Run `intake-qualifier` Djin-agents universeel → krijg ICP-fit (ja/nee/grijs).
  2. Bij ja/grijs: run `strategist` Djin-agents → krijg scope.md + risks.md.
  3. Run `webrnds/_templates/klant-template/CONTEXT.md`-achtige scaffold via folder-shape-hook.
  4. Run `_templates/klantreis-template/CONTEXT.md`-achtige scaffold voor de eerste reis.
  5. Initialiseer `_agents/` vanuit `webrnds/skills/<fase>-wrapper/SKILL.md` per fase.
  6. Check cap (max 3 actieve reizen per klant, `_rules.local.md`).
  7. Schrijf `start.md` + `state.md` + `klantreis-<id>/start.md` + `klantreis-<id>/state.md`.
- **Outputs**:
  - `clients/<slug>/_dossier/intake-fit.md` (review_status: pending)
  - `clients/<slug>/_dossier/scope.md` (review_status: pending)
  - `clients/<slug>/klantreis-<id>/01-kennismaking/_inbox/<intake-files>` (review_status: pending)
- **Human check** (per workflow-audit HYBRID pattern): user reviewt intake-fit en scope; past frontmatter aan naar `reviewed`. Agent haalt niet naar volgende fase zonder `reviewed`.

**Discipline.** `disable-model-invocation: true` (zoals Matt Pocock's `grill-me`). Alleen user triggert dit; agent kan niet "uit zichzelf" een klant aanmaken. Dat past bij U4 (top-file-only-routes — user houdt de regie).

**Waarom dit Matt Pocock's pattern volgt.** Zelfde shape als `setup-matt-pocock-skills` (run-once setup voor één entiteit, schrijft markdown-bestanden als source of truth), maar dan voor klanten in plaats van voor de repo. Verschil: deze skill wordt per klant aangeroepen, niet per repo.

**Wat het NIET doet.** Vult geen klant-spec data in (dat doet de agent na onboarding). Doet geen facturatie. Promoot geen prospect automatisch tot klant — user-go nodig.

---

### 3.2 `prototype` voor R&D — `webrnds-r-and-d-prototype`

**Doel.** Webrnds-specifieke versie van Matt Pocock's `/prototype`, maar dan voor **business-vragen** (dienst-paletaanpassing, prijsstrategie, niche-evaluatie) i.p.v. UI/logica. Throwaway: prototype landt op een branch, niet in main. Past bij Q8.3 (experimenten horen in `/djinlabs/_internal/experimenten/`, niet in Webrnds).

**Trigger.** User typt `/prototype <vraag>` of agent bereikt dit zelf wanneer `01-research/CONTEXT.md` of `02-offer/CONTEXT.md` een onbeantwoorde design-vraag detecteert die niet door praten opgelost kan worden (Matt Pocock's "ungrillable" definitie).

**Contract.**

- **Inputs**: (a) de onbeantwoorde vraag in eigen woorden, (b) relevante context uit `01-research/` of `02-offer/`, (c) `_shared/hard-rules.md` voor canon, (d) eventuele eerdere prototypes via context-pointer.
- **Process**:
  1. Schrijf de vraag letterlijk bovenaan het prototype (zoals Matt Pocock's `prototype/SKILL.md` regel 1: *"if you can't say what question it answers in one sentence, stop"*).
  2. Kies branch: business-logica (HTML-paneel met scenarios) óf strategie-poster (varianten van pitch/deck/prijs naast elkaar).
  3. Throwaway-discipline: no tests, no error handling beyond what makes it run, no abstractions. Single shareable HTML als business-logica, anders single deck/slide.
  4. Schrijf het antwoord (verdict + question it settled) in `01-research/<experiment_id>.md` of `02-offer/<experiment_id>.md` met frontmatter `verdict: settled` + datum.
  5. Commit prototype naar `/djinlabs/_internal/experimenten/<experiment_id>/` (NIET in Webrnds — experimenten horen bij DjinLabs per Ronde 8/Q8.3).
  6. Context-pointer van het experiment_resultaat in Webrnds' `01-research/` of `02-offer/`.
- **Outputs**:
  - `/djinlabs/_internal/experimenten/<experiment_id>/prototype.html` (single shareable)
  - `/djinlabs/_internal/experimenten/<experiment_id>/VERDICT.md` met de vraag + het antwoord
  - Pointer in Webrnds: `01-research/<experiment_id>-pointer.md` met `source: /djinlabs/_internal/experimenten/<experiment_id>/`
- **Human check**: founder tekent het VERDICT; pas frontmatter aan naar `reviewed`.

**Discipline.** Model-invocation-enabled (zoals Matt Pocock's `wizard`). Agent kan dit zelf bereiken wanneer een onbeantwoorde vraag in de research-flow opduikt.

**Waarom dit Matt Pocock's pattern volgt.** Zelfde "throwaway + primary source"-discipline. Zelfde "vraag beslist de shape"-principe. Verschil: vraag is business-strategisch, niet UI/logica. En het prototype leeft in DjinLabs (template-onderhoud), niet in Webrnds.

**Wat het NIET doet.** Prototype bouwen voor klant-werk (dat is `klantreis-<id>/03-ontwerp/` met template-keuze uit `05-produce/`). Prototype bouwen voor Webrnds-spec interne tools (dat is engineering, niet R&D).

---

### 3.3 `webrnds-upkeep` — compliance / Sunday-audit

**Doel.** Periodieke scan van de Webrnds-skeleton op rot: ontbrekende start/state, "Final"-achtige folder-namen, cap-overschrijdingen, lege containers, skeleton-drift. Past bij U7 (sunday-audit) uit onze hard-rules candidated draft.

**Trigger.** User typt `/upkeep` of agent bereikt dit zelf wanneer een cron-achtige trigger afgaat (bv. wekelijks op zondag, zoals OathDriven's cadence).

**Contract.**

- **Inputs**: (a) de hele Webrnds-tree, (b) `_shared/hard-rules.md`, (c) `webrnds/_rules.local.md`, (d) `decisions.md` voor canonieke beslissingen die je niet mag overtreden.
- **Process**:
  1. Scan `clients/` op:
     - klant-folders zonder `start.md` of `state.md` → flag
     - actieve reizen zonder `01-kennismaking/CONTEXT.md` → flag
     - cap-overschrijding (> 3 actieve reizen) → flag + suggesteer verhuizing naar `_archive/`
     - reizen in `06-groei/` die > 90 dagen geen `state.md`-update hebben → flag alsnog-afronden
  2. Scan top-level Webrnds op:
     - nieuwe top-level folders die niet in `decisions.md` als canoniek staan → flag (suggestie: of in `decisions.md` opnemen als canoniek, of verhuizen)
     - bestanden met namen als `Final`, `Old`, `Misc`, `Stuff` → flag (U7 anti-pattern-detectie)
     - nesting > 3 zonder `CONTEXT.md` op elk niveau → flag
  3. Scan `skills/` en `_templates/` op:
     - wrapper-files zonder `SKILL.md` (lege folders die geen scaffold hebben) → flag
     - templates die > 30 dagen niet zijn bijgewerkt en wel zijn gebruikt → flag voor review
  4. Schrijf `_internal/leer-artefacten/upkeep-YYYY-MM-DD.md` met:
     - samenvatting (aantal flags per categorie)
     - per-flag: locatie + voorgestelde actie + severity (critical/warning/info)
     - owner (founder)
- **Outputs**:
  - `_internal/leer-artefacten/upkeep-<datum>.md` (review_status: pending)
  - Optioneel: lijst van TODO's in `clients/<slug>/<fase>/_requests/` als er acties uit voortkomen die user moet doen
- **Human check**: founder reviewt; past frontmatter aan naar `reviewed`; de TODO's worden door andere agents of user opgepakt.

**Discipline.** Model-invocation-enabled. Past bij OathDriven-cadence.

**Waarom dit Matt Pocock's pattern volgt.** Geen direct equivalent. Wel verwant aan `improve-codebase-architecture` (visual report van refactor-kandidaten) en `triage` (sorteren van issues in work someone can pick up). Verschil: `webrnds-upkeep` is **infrastructure-discipline**, niet feature-werk. Het produceert geen refactor; het produceert rot-detectie + leer-artefacten.

**Wat het NIET doet.** Het repareert niet zelf (alleen user kan dat). Het wijzigt geen skeletons. Het verwijdert geen folders. Het escaleert naar R&D-prototype alleen als er een canonieke design-vraag uit voortkomt.

---

## 4. De meta-vraag — hoe landen we dit zonder canonieke conflicten

Twee problemen die eerst opgelost moeten worden voordat een van deze skills kan landen:

### 4.1 Conflict-vraag: `setup-matt-pocock-skills` vs. onze Webrnds-skeleton

`setup-matt-pocock-skills` schrijft per-repo config naar `docs/agents/{issue-tracker,domain,triage-labels}.md`. Wij hebben al `_shared/{AGENTS,hard-rules,naming-conventions,icm-canon}.md` + `djinlabs/AGENTS.md` + `webrnds/AGENTS.md`. Die **overlappen functioneel** maar **niet in pad of naam**.

Drie opties:

- **(a) Adopteren Matt Pocock's `docs/agents/`-conventie 1-op-1.** Onze `_shared/` wordt `docs/agents/`. Voordeel: skills lezen wat ze verwachten. Nadeel: we verliezen Webrnds-eigen naamgeving (Q11.1: vrij op naam).
- **(b) Beide naast elkaar.** `docs/agents/` blijft leeg of bevat een pointer naar `_shared/`. Skills lezen hun eigen files; wij lezen de onze. Voordeel: geen canoniek conflict. Nadeel: twee canonieke pointers.
- **(c) Hybride — `docs/agents/` voor de engineering-flow-bestanden (issue-tracker, triage-labels), `_shared/` voor de template-flow-bestanden (icm-canon, hard-rules, naming).** Functie-scheiding. Voordeel: elk subsysteem heeft zijn eigen canonieke plek. Nadeag: user moet twee files onthouden.

Mijn aanbeveling: **(c)**. Want het scheidt "engineerskills-config" (Matt Pocock's domein) van "template-werk" (ons domein). Geen canoniek conflict, geen 1-op-1 overname.

### 4.2 Conflict-vraag: drie nieuwe skills vs. agent-sprawl

We hebben nu 36 Matt Pocock skills lokaal + 4 Djin-agents universeel scaffolds in de skeleton (Ronde 10) + 3 custom skills die hier voorgesteld worden = potentieel 43 skills in het menu van de agent. Dat is een discoverability-probleem.

Drie opties:

- **(a) Niets doen, laat de agent zelf uitvogelen welke skill bij welke vraag hoort.** Risico: agent kiest verkeerde skill (Matt Pocock's "naming problem" — `prototype` klinkt als obvious next-step).
- **(b) Bundelen via een `ask-matt`-equivalent** dat de vraag classificeert en naar de juiste skill routeert. Matt Pocock heeft dit al: `ask-matt`. Onze tegenhanger zou `ask-djin` of `ask-webrnds` zijn.
- **(c) Beperken tot een canonieke set** en de rest "geavanceerd" noemen.

Mijn aanbeveling: **(b) — implementeer een `ask-webrnds`-skill** die de vraag classificeert en routeert. Custom skills (3 hierboven) + 4 Djin-agents universeel + de meest gebruikte Matt Pocock skills (grill-me, to-spec, prototype, wizard, upkeep). De rest blijft beschikbaar maar wordt niet routable.

## 5. Implementatie-volgorde — aanbevolen

Niet alle drie tegelijk. Volgorde op basis van "welke ontgrendelt de andere":

1. **Eerst `webrnds-upkeep`** (3.3). Past bij U7, levert leer-artefacten, kan direct op de huidige skeleton draaien. Bewijst dat de skeleton tegen rot bestand is voordat we klanten gaan onboarden.
2. **Dan `webrnds-onboard`** (3.1). Heeft `webrnds-upkeep` nodig om te weten dat de skeleton schoon is voordat we er klanten in hangen. Plus: dit is de eerste echte validatie van de hele klantreis-flow.
3. **Dan `webrnds-r-and-d-prototype`** (3.2). Past bij Q8.3 (experimenten in DjinLabs). Komt pas zinvol als er een tweede tenant-overstijgende vraag opduikt die niet door praten op te lossen is. Niet urgent.

En de meta-beslissing (4.1 + 4.2) lossen we op vóór we beginnen met de eerste skill, anders bouwen we op drijfzand.

## 6. Open vragen die user moet beantwoorden voordat dit voorstel implementeerbaar is

1. **Q-C1 — Welke conflict-resolutie voor `docs/agents/` vs `_shared/`?** (a) overnemen, (b) naast elkaar, (c) hybride functie-splitsing.
2. **Q-C2 — Welke agent-routing-strategie?** (a) niets, (b) `ask-webrnds`-skill, (c) beperken tot canonieke set.
3. **Q-C3 — Upkeep-cadence.** Wekelijks (OathDriven-pattern), maandelijks, of user-triggered only?
4. **Q-C4 — Onboarding-trigger.** Alleen user-invoked, of ook model-invocation-enabled wanneer een pipeline-trigger afgaat in `04-close/`?
5. **Q-C5 — R&D-prototype output-formaat.** Single HTML (zoals Matt Pocock) óf een hybride met strategy-deck? Of allebei, met branch-keuze zoals Matt Pocock's prototype?

Als user deze vijf beantwoordt, kan dit voorstel worden omgezet in drie `SKILL.md`-bestanden + één `ask-webrnds/SKILL.md` + eventueel `docs/agents/`-restructurering. Tot die tijd is dit een research-rapport, geen implementatie.
