# DjinLabs 1-folder fundamentelen — design

> **Source of truth.** Dit document is de leesbare vertaling van `~/.grill-with-ui/sessions/Users-gogetta-Documents-djinlabs_system_design/20260919-133302/state.json`. State wordt geschreven door de agent; dit document wordt gegenereerd en gemerged via één sync-stap (Q12). De grill-session is de bron, dit is de lei.
>
> **Status.** Ronde 1-7 locked. Ronde 8 open.
>
> **Sync-stijl.** A1 (register-achtig, `decisions.md`-toon, ~150 regels, cross-refs naar `research/`). Vastgelegd in `state.json::style.chosen`.
>
> **Audience.** Founder + toekomstige agent die het systeem voor het eerst ziet.

## TL;DR

Eén folder per venture (het "1-folder systeem"). Iedere folder heeft `start.md` + `state.md`. Daarboven liggen 8 universele hard-rules, gehandhaafd door hot-path hooks (≤100ms, rot-rules) en een Sunday-audit (cold-path, quality-rules). Instances erven de canon via symlinks; nieuwe instances worden gecreëerd door `scripts/new-instance.sh`. Jev (TypeSafe `Noul`/`Choice`/`Score`) wordt stapsgewijs ingebracht, eerste wire-up in de hooks-laag op U3, achter een MCP-wrapper zodat callers één policy delen.

De tweede instance die DjinLabs "echt" tot template maakt — niet tot holding-greep — **wordt bewust gecreëerd door de founder, op eigen tempo** (Q4.1, `decisions.md` §"Ronde 4 — who is the second instance"). Niet afhankelijk van Webrnds-klantenbestand.

Dit is de **canon**. Anti-pattern: zie `decisions.md` §"Anti-pattern reference" (Ronde 7 item 3).

## Canon in context — wat Ronde 1-7 hebben vastgelegd

| Ronde | Onderwerp | Wat deze doc eruit haalt |
|---|---|---|
| 1 | Wat Webrnds is + 1-folder canon | "Webrnds = instance #1" — symlink-erfenis, geen holding |
| 2 | Folder-shape + rollen | AGENTS.md / start.md / state.md patroon, agent-mapping |
| 3 | Cost-centre + ICM/Jev + 8 universals | Prijsmodel, Jev-laag, de 8 hard-rules hieronder |
| 4 | Wie is de tweede instance | Founder beslist, eigen tempo, niet klant-getrokken |
| 5 | Welke agent + welke architectuur voor tweede Jev-wire-up | `/money` (Q13-A) via `writeWrapper` (Q14-A); fail-CLOSED in tegenstelling tot Q10/U3 |
| 6 | Money-subdirectories: wél vs niet afgeleid | Drie derivates (`Bank`, `Factuur`, `Belasting`); `Offerte` pass-through; `_internal/` hard-excluded; namen in NL |
| 7 | Audit-grader: Jev `Score` ja/nee | Nee voor eerste wire-up — deterministisch blijft primary; Score pas als checks > 5 of diverge optreedt |

Meer ronde-detail in `decisions.md` §"Decision log". Ronde 8+ (post-HOLD, Ronde 14+ uit `decisions.md`, Money-meta) staat onderin deze doc bij "Open frontier — Ronde 8+".

## Termen

De canon gebruikt deze termen. Andere woorden voor hetzelfde idee zijn bewust vermeden — zie `avoid`-lijst per term.

| Term | Definitie | Vermijd |
|---|---|---|
| **canon** | De vastgelegde set universele hard-rules + canonieke folder-shape waar alle instances aan voldoen. | template, skeleton, blueprint |
| **1-folder systeem** | DjinLabs-template + ICM/Jev + 8 hard-rules als één ondeelbaar geheel: instances erven de canon, niet losse folders. | folder-template, folderstructuur |
| **oordeelkundig** | Met kennis van zaken doordacht handelend op grond van een gescheiden beoordeling van lagen. In DjinLabs: de menselijke stap die uitmaakt welk pad wordt gekozen — niet het systeem, niet de AI. | wijs, verstandig, slim, optimaal |

## De 4 lagen rot-prevention

```
    ┌──── CANON (deze doc) ─────┐
    │  8 universele hard-rules  │
    │  folder-shape             │
    │  state-formaat            │
    └───────────────────────────┘
              ▲       ▲
              │       │
    ┌──── ENFORCEMENT ──┐  ┌──── CADENCE ─────┐
    │ hot-path hooks    │  │ Sunday-audit      │
    │ (≤100ms, rot)     │  │ (cold-path, qual) │
    └───────────────────┘  └───────────────────┘
              ▲       ▲             ▲
              │       │             │
              └───────┴─────────────┘
                       ▲
                       │
              ┌──── STATE ────┐
              │  start.md     │
              │  state.md     │
              │  in elke folder│
              └───────────────┘
```

Vier lagen vangen elk een ander rot-mechanisme:

| Laag | Wat 't voorkomt | State-vraag |
|---|---|---|
| Map | Verdwazing ("Stuff", "Misc", FINAL_USE_THIS) | Q1, Q2 |
| State | "Wat was dit?" en "wat is de status?" | Q5 |
| Enforcement | Stille drift van canon — niemand checkt | Q3, Q4, Q6, Q7, Q10, Q11 |
| Cadence | Vergeten — rot ontstaat in de gaten-niet | Q8 |

## Canon — 8 universele hard-rules (U1–U8)

Bron: `research/hard-rules-inventory.md`. Per-instance rules zijn expliciet U9 — separate laag.

| ID | Regel | Hot-path? | Block of warn? |
|---|---|---|---|
| U1 | Elke folder heeft start + state. | ✓ | **block** |
| U2 | Alles gaat via hooks — geen directe file-write vanuit agents. | — | warn (audit) |
| U3 | Geen secrets in logs of state.md. | ✓ (eerste Noul-pick) | **block** (na Q10 wire-up) |
| U4 | Routes en files leven alleen top-level — geen diepe imports. | — | warn (audit) |
| U5 | `state.md` YAML-`date` wint over filesystem-`mtime`. | ✓ | **block** |
| U6 | Bij meerdere `state.md` in één folder wint newest-date. | ✓ | **block** |
| U7 | Sunday-audit is verplicht. | — | warn (rapport) |
| U8 | Vorige-week-failures leven in negative-examples-set. | — | warn (audit) |

**Twee regimes** (Q6): rot-rules (U1, U5, U6) worden hard-geblockt; quality-rules (U2, U3, U7, U8) worden gewaarschuwd in de audit. Eén hook-engine, twee registers — niet twee hooks.

Zie `_shared/icm-canon.md` voor hoe dit past op het ICM-vijf-lagen-context-model.

## Mechanismen — hoe de lagen samenwerken

### Hook-engine (Q4)
Node-native `scripts/hooks/watch.mjs` met `fs.watch` op de instance-root. Geen `inotifywait`/`fswatch` wrapper, geen Husky/lint-staged.

### State-formaat (Q5)
`state.md` per folder, YAML-frontmatter (`status`, `updated_at`, `owner`, `icm_layer`, `agent`) + vrije markdown. Geen naast-elkaar `state.yaml` — mens en machine lezen dezelfde file.

### Hot-path / audit-path split (Q7)
**Hot-path** (≤100ms): alleen rot-events vuren hier.
- `rename` folder zonder `state.md` → U1 block
- `change` `state.md` met mtime > frontmatter `date` → U5 block
- `rename` `state.md` → U6 block

**Audit-path** (Sunday-weekly): alle quality-rules + drift-detect.
- U2: alles-via-hooks verification (structural)
- U3: regex secrets-scan op `src/` + `scripts/` (content; regex zit niet in hot-path want te duur)
- U7: folder=state-ness + mtime-drift per instance
- U8: vorige-week-failures in negative-examples-set

### Sunday-audit-output (Q8)
Markdown-rapport in `djinlabs/_internal/audits/<YYYY-MM-DD>.md`. Sections: summary, hot-path findings, cold-path findings, drift. Geen CI-blokkade — mens beslist over quality-regime. Past bij `_internal`-conventie: R&D + leer-artefacten, geen enforcement. Rot-rule violations worden door de hot-path gevangen; de audit is complementair, niet primair.

### TypeSafe / Jev wire-up (Q10, Q11)
- **Eerste wire-up** (Q10-B): U3 in `scripts/hooks/watch.mjs`. Call-shape: `Noul("breekt dit {filename}-{eventtype} de regel U3?") → boolean + 1 regel uitleg`. Fail-open als TypeSafe unreachable.
- **MCP-wrapper** (Q11-B): `scripts/_internal/typesafe-mcp/` met één tool `typesafe.jev.ask(prompt, mode, timeout_ms)`. Hot-path budget ≤50ms overhead; als niet haalbaar, hot-path-caller alsnog direct SDK-call en rest via MCP (mixed toegestaan).
- **Shapes-registry** (dag-1, Q11-mitigatie): `djinlabs/_internal/typesafe-mcp/shapes.ts` zodat alle `Noul`/`Choice`/`Score`-prompts op één plek leven, los van transport-laag. Anders wordt "prompt herformuleren" later een refactor.

### Instance-bootstrap (Q9)
`scripts/new-instance.sh`. Stappen:
1. `mkdir` instance + symlink-dir.
2. Symlinks alleen voor canon-files (`AGENTS.md`, `icm-canon.md`, `skills-lock.json`). Geen onderhoudsscripts.
3. `state.md` met `status: pending`.
4. Lege `ICM/`-folder (vullen via normale ICM-flow — bootstrap levert geen inhoud).
5. Pointer in `djinlabs/_internal/instances/<slug>.md`.
6. `git init` + commit + push.
7. Print follow-up: `djin audit --instance <slug>`.

**Jev/TypeSafe explicitly out of bootstrap**: geen credentials, geen actieve Noul-calls, geen automatic Sunday-audit-grade. Wire-up is een mens-beslissing per instance. Bootstrap declareert de marker-files; vullen is een oordeelkundige stap.

## Voorbeeld-instance

Webrnds (zie `decisions.md` §"Canonical Webrnds tree") is instance #1 van deze canon. Djin-tenant (in `tenants/djin/`) is instance #0 — een overlay bovenop het slack-project (`~/Documents/projects/slack/`) via de symlink-laag die daar in `AGENTS.md` staat. Beide instances delen dezelfde canon, dezelfde hooks, dezelfde Sunday-audit.

## Wat NIET canon is

- **Scaffold-script** (`new-instance.sh`) in een programmeertaal anders dan bash — dunner is beter; ~30 regels.
- **State in JSON** (`state.json`) — dat is een grill-sessie-state, niet folder-state. Folder-state = `state.md`.
- **Custom hooks per instance** zonder canon-mapping — als de hook niet aan U1–U8 hangt, hoort 'ie niet in `scripts/hooks/`.
- **CI-blokkade van quality-rules** — expliciet niet canon (Q6, Q8). Mens-discipline, niet CI-discipline.
- **Jev/TypeSafe in bootstrap** — expliciet niet canon (Q9).

## Cross-references

- Canon-bron: `decisions.md` (Ronde 1-13 cumulatief log).
- Hard-rules-inventarisatie: `research/hard-rules-inventory.md`.
- Concurrentie-context: `research/codavo-competitive-brief.md`.
- ICM-discipline: `_shared/icm-canon.md`.
- Webrnds als instance: `decisions.md` §"Canonical Webrnds tree — geland op disk".
- Sessie-state: `~/.grill-with-ui/sessions/Users-gogetta-Documents-djinlabs_system_design/20260919-133302/state.json`.

## Sync-ritueel (Q12)

1. Agent leest `state.json` en ziet `agent.handled` oplopen of een `updated: true` op een vraag.
2. Agent genereert een diff-suggestie voor deze doc in een aparte PR/patch.
3. Founder reviewt en commit — de doc is oordeelkundig gemerged, niet auto-overschreven.

### Jev-wire-up in agents (Q13, Q14)
- **Tweede wire-up** (Q13-A) zit in `/money` als Universal Verification op writes. Call-shape: `Choice("is deze write toegestaan onder {soort-write}?") → {verdict, rationale}` met drie uitkomsten: `APPROVE` / `REJECT` / `HOLD`. **fail-CLOSED** bij unreachable (in tegenstelling tot Q10/U3 fail-OPEN).
- **Plaats** (Q14-A): decoratieve `writeWrapper` in `scripts/hooks/write-wrapper.mjs`. Eén intercept-punt voor alle agents; triggert via `target-path ∈ Money/*` of derivates (registry-bestand, niet hard-coded).
- **Audit-trail**: `djinlabs/_internal/audits/writes/<YYYY-MM-DD>.ndjson` — real-time, apart van de Sunday-audit-cadans.

**Belangrijk regime-onderscheid** (samenvatting van U1–U8 + Q10 + Q13):

| Regel | Pad | Faal-default | Regime |
|---|---|---|---|
| U1, U5, U6 (rot-rules) | hot-path hooks | hard-block, faalt-dicht | rot, capability |
| U3 (quality) | audit-path | warn, faalt-open (audit-pad vangt) | quality |
| /money writes (capability) | writeWrapper | HOLD, faalt-dicht | rot, capability |

### Instance-bootstrap (Q9) — cross-reference
Zie §"Instance-bootstrap (Q9)" eerder in deze doc voor de volledige stappen. Cross-reference hier; niet duplikken om de A1-stijl te bewaren.

### Money-subcats (Q15)
writeWrapper-vangst (Q14-A) toegepast op `Money/`-paden. Drie **wrapped** derivates, één **pass-through**, één **hard-excluded**:

| Pad | Regime | Reden |
|---|---|---|
| `Money/Bank/` | wrap | transacties 5-20/dag, audit-waardig |
| `Money/Factuur/` | wrap, strak | uitgaand + inkomend, BTW-relevant |
| `Money/Belasting/` | wrap, strak | BTW/IB/VPB-aangiften, hoge impact per write |
| `Money/Offerte/` | pass-through | pre-factuur, geen geldstroom, geen BTW-post |
| `Money/_internal/` | hard-excluded | recursie-blokkade (audit-output kan zichzelf niet vangen) |

**Naam-conventie** (locked Q15): Money-subcats in het **Nederlands** (`Bank`/`Factuur`/`Belasting`/`Offerte`); `_internal/` blijft **Engels** vanwege Ronde 8/Q8.3 canon in `decisions.md`. Path-syntax: `target.startsWith('Money/${wrapped[i]}/')`, string-match, geen regex/glob.

**Geen registry-bestand voorlopig** — pas zinvol bij > 5 derivates; nu hard-coded, vier paden totaal.

### Audit-grader (Q16)
**Primary grader: deterministisch** (Q8). Jev `Score` is **niet** actief in de eerste wire-up. Score is een R&D-spoor — activering pas bij een van:

- actieve audit-checks > 5 (nu 4: U2, U3, U7, U8);
- echte diverge in een audit-run die deterministisch niet vangt;
- Jev-kalibratie vanuit parallelle runs (kan buiten canon).

**Rollback-pad**: mocht deterministisch te smal blijken, volgende stap is **parallel** (Score naast, niet in plaats van) — nooit vervanger. Score-onder-de-deterministische-grader verliest mens-traceerbaarheid van de canon.

## Open frontier — Ronde 8+

Kandidaten die voortbouwen op Ronde 7:

- **Post-HOLD-werkverdeling** — als Q14 writeWrapper universiek wordt, hoe gedragen we ons bij mislukte `Choice` na HOLD? Auto-retry? Mens-ping? Scheduled re-review?
- **Ronde 14+ uit `decisions.md`** — agent-mapping, skills-hosting, Money-discipline (het bredere werk, niet enkel de Jev-wire-up).
- **Money-meta naast _internal/** — bv. `Money/meta/`, `Money/kasboek/`. Pas registeren zodra ze bestaan.
- **Calibratie-pad voor Score** — zodra Q16-triggers actief worden, hoe meten we of Score 'klaar' is voor productie? R&D-trail apart van canon.
