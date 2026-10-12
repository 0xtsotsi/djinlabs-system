# Jev Policy — canon

> **Doel.** Vastleggen hoe beslissings-gates (Jev-policy of equivalent) hun werk doen binnen DjinLabs × Webrnds × Djin × blobbies, orthogonal aan agent-, skill-, en instance-lagen.
>
> **Bron van waarheid.** Deze file is canon. Cross-references: `icm-canon.md`, `naming-conventions.md`, `state-formats-canon.md` (Ronde 15 — welke file-soort in welke rol), `sync-discipline-canon.md` (Ronde 16 — wie/wanneer/hoe van sync; deze file volgt die discipline), `decisions.md` (Ronde 14+ voor de blobbies-verbinding).
>
> **Status.** V1.5 — Ronde 17 sync. Toegevoegd: §"Confidence bands" + §"Action-type `classify_jev`" + §"Vraag-formulering discipline". Out of scope voor v1: kill switch per provider, concrete LocalProvider/RemoteProvider interfaces, concrete wire-up implementatie.

---

## Vocabulary mapping

Een mapping tussen canon-termen en blobbies-runtime-termen. Niet om te hernoemen, maar om de grens tussen canon en runtime expliciet te maken.

| Canon-term | blobbies-runtime-term | Locatie / notitie |
|---|---|---|
| agent | **Blob** | Eén Blob = één agent-instance met eigen UUID |
| skill (Ronde 11) | skill | Zelfde term, zelfde `SKILL.md`-formaat, orthogonal aan agents |
| routines | routines | Uitvoer-cadans, JSON `routines.json` per Blob |
| home folder | `~/.blobbies/blobs/<uuid>/` | Per-Blob containment. Canon-side: `<instance>/` |

**Orthogonal-claim.** Skills zijn orthogonal aan agents (Ronde 11). Deze orthogonal-claim is **ook van toepassing op de Blob-laag**: één skill kan meerdere Blobs bedienen, één Blob kan meerdere skills gebruiken. De `~/.blobbies/skills/connected-apps/SKILL.md` heeft geen Blob-id in de metadata — dat is de implementatie van dit principe.

---

## Action-types — Jev-actions als canoniek vocabulary

Acht action-types vormen de canonieke vocabulary voor matrix-acties. **Niet** verplicht: een integratie implementeert een subset. Action-namen worden niet ad-hoc bedacht per integratie. Als een nieuwe action nodig is, hoort die eerst in deze tabel of als canonieke uitbreiding te worden voorgesteld.

| Action | Semantiek (canoniek) | Regime | Typische toepassing |
|---|---|---|---|
| `reuse_cache` | Hergebruik een bestaand artifact uit eerdere run binnen dezelfde context. | rot | Research-output, browser-screenshots, transcript-derivaten |
| `stop_retry` | Stop met hertrial; het antwoord is definitief zoals het er nu is. | rot | Na vastgelopen retry-loop, NaN-antwoord, vastlopen in dezelfde fout |
| `run_deterministic` | Voer een deterministisch pad uit zonder model-call. | capability | Uitgebreide regex-checks, gestructureerde transforms, validatie |
| `chat_only` | Geen tool-acties; alleen antwoord in chat-formaat. | rot | Bij twijfel over context, bij gebruiksvragen zonder externe werking |
| `ask_human` | Onderbreek voor expliciete menselijke goedkeuring. | capability | Geld-staat, account-acties, irreversible operaties |
| `allow_subagent` | Sta het starten van een sub-agent toe. | capability | Bij gedelegeerd werk dat boundary respecteert |
| `research_capped` | Onderzoek met expliciete cap (aantal, tokens, tijd). | rot | Web-research met `max_browser_sources`, dossier-zoekacties |
| `proceed_full` | Ga door zoals gepland, geen gate. | capability (default) | Happy-path zonder twijfel |
| `classify_jev` | Roep een typesafe decision model (Jev of equivalent) aan met state + vragen; gebruik confidence-band om vervolg-actie te kiezen. | capability | Ronde-prep, agent-routing, boundary-check, quality-control — niet hot-path (latency 900-1300ms) |

**Toevoegen van nieuwe actions.** Nieuwe actions komen in deze tabel via een canonieke ronde in `decisions.md`. Een integratie die een action introduceert zonder canon-uitbreiding is implementatie, geen canon — en wordt terugverwezen naar deze tabel.

---

## Fail-mode matrix

Fail-mode is **per-action, niet per-component**. Eén component kan meerdere actions hosten met verschillende fail-modes.

| Action-site | Fail-mode bij unreachable | Fail-mode bij twijfelachtig resultaat | Reden |
|---|---|---|---|
| `secret_set` | fail-OPEN | fail-CLOSED | Gebruiker moet key kunnen opslaan zonder internet (vliegveld-scenario); maar een value zonder credential-vorm is geen key |
| geld-staat write (alle actions die geld raken) | fail-CLOSED | fail-CLOSED | False-positive hold is irritant; false-negative approve is catastrofaal |
| tray-quit effect | fail-OPEN met snapshot+restore | warn | Lopende routines moeten veilig kunnen pauzeren; OS process-tree beschermt al |
| tray-open / tray-check-updates | (geen gate) | (geen gate) | Geen Noul-kandidaat — agnostisch van context, OS-handled |
| `ask_human` voor account-acties | fail-OPEN met ping | ping | Geen provider-trust-vraag (egress al gegeven); gebruiker-go is de gate |
| `ask_human` voor onbekende actie | fail-CLOSED | fail-CLOSED | Bij twijfel niet doen; gebruiker-vraag is de gate |
| `research_capped` met provider-trust-vraag | fail-CLOSED bij Tinfoil | warn bij Ollama | Lokale loopback = geen egress-trust-vraag; cloud = wel |

**Standaard-keuze.** Waar de matrix geen entry heeft, default = **fail-CLOSED**. Een gate die geen matrix-entry heeft, is niet canoniek.

**Mode-aanduiding.** Elke wire-up declareert welke fail-mode hij gebruikt voor welke action-site. Geen impliciete defaults in code — een agent die "de Jev-policy" gebruikt zonder fail-mode-aanduiding is een canoniek gat.

## Confidence bands — drie-banden-patroon (Ronde 17)

Confidence-bands zijn **canoniek als patroon**, niet als waarden. Een integratie kan eigen waarden kiezen; het patroon (drie banden + threshold-tabel) is canon.

| Band | Range | Action | Regime |
|---|---|---|---|
| High | `> upper-threshold` | Auto-act | rot |
| Mid | `lower-threshold..upper` | Ask human / fallback | capability |
| Low | `< lower-threshold` | Safe default | rot |

**Threshold-waarden zijn runtime-tuning per integratie.** Onder- en bovengrens worden per wire-up vastgesteld (zie matrix-entry in Fail-mode table).

**Default-default.** Bij ontbreken van een matrix-entry: `lower = 0.35`, `upper = 0.7`. Deze waarden zijn **canoniek-default** voor nieuwe integraties zonder eigen threshold. Bron: live-test in `research/jev-live-test-rapport.md` Case 3 (Tinfoil-CSP trade-off) gaf confidence 0.66 — correct opgevangen door mid-band → `ask_human`.

**Geen waarde-fanatisme.** Confidence is geen accuracy-percentage. Bron: TypeSafe guidance. Confidence zegt alleen hoe zeker het model is, niet hoe vaak 't gelijk heeft.

## Action-type `classify_jev` — runtime-tool, orthogonal aan agents (Ronde 17)

`classify_jev` is de canonieke erkenning dat agents een typesafe decision model (Jev of equivalent) kunnen aanroepen. De action-naam zelf is canon; de **implementatie** (welke SDK, welke endpoint, welke credentials) is runtime.

**Eigenschappen:**

| Aspect | Waarde |
|---|---|
| Latency | 900-1300ms per call (TypeSafe direct API, NL → cloud) |
| Cost | $0.042/M input tokens, output free (TypeSafe pricing) |
| Question-types | choice, score, noul — parallel in één call |
| Output | typed answer + confidence per vraag |
| Failure-mode | fail-CLOSED bij unreachable (network timeout, 5xx); kanoniek-patroon |

**Boundary-discipline.** Jev heeft geen eigen boundary. De aanroepende agent bepaalt of de Jev-state binnen tenant blijft. Past bij orthogonal-claim (regel 22).

**Niet voor hot-path.** Bij latency ≥900ms is `classify_jev` ongeschikt voor real-time UI-acties zoals cua-driver-clicks. Voor real-time acties blijft de directe som/keuze vanuit de agent zelf.

**Shadow/active voor Jev-call.** Volgt dezelfde discipline als andere gates (Shadow/active sectie hieronder): default shadow, founder-commit voor active.

## Vraag-formulering discipline — Jev classificeert op vraag-vorm (Ronde 17)

Jev classificeert op de **vorm** van de vraag, niet op de **inhoud**. Bij twijfel tussen canon-en-implementation-classificatie: **formuleer de vraag expliciet als canon-classificatie**.

**Canonieke les uit live-test:** Case 3 (Tinfoil-CSP trade-off) was canon-niveau maar geformuleerd als runtime-trade-off. Jev classificeerde `implementation` met confidence 0.66. Bij herformulering met expliciete verwijzing naar umbrella-scope had Jev `canon` geclassificeerd.

**Richtlijnen voor vraag-formulering:**

| Doel | Formulering-tip |
|---|---|
| Canon-classificatie | Verwijs naar umbrella-scope, multi-tenant-impact, sync-discipline-implicatie |
| Implementation-classificatie | Verwijs naar single-tenant, runtime-setup, specifieke tool-integratie |
| Boundary-check | Vraag "Blijft deze actie binnen [tenant]?" — niet "Is dit veilig?" |
| Founder-commit | Vraag "Vereist dit expliciete commit-call?" — niet "Is dit belangrijk?" |

**Niet canon: specifieke formulering.** Dit zijn richtlijnen, geen verplichte templates. Runtime-implementaties mogen eigen formuleringen kiezen zolang ze niet in strijd zijn met deze richtlijnen.

**Confidence-band vangt slechte formulering op.** Een verkeerd-geformuleerde vraag levert meestal een mid-band confidence (0.35-0.7), wat correct doorvloeit naar `ask_human` review. Live-test Case 3 bevestigt dit.

---

## Shadow / active modes

| Mode | Semantiek | Wanneer |
|---|---|---|
| `shadow` | Gates loggen hun voorgestelde action maar voeren 'm niet uit. | Eerste weken na een nieuwe gate-wire-up; voordat `ask_human` afgedwongen wordt op account-acties |
| `active` | Gates loggen én voeren hun action uit. | Na voldoende shadow-periode met founder-review |

**Shadow → active overgang.** Vereist expliciete commit-call van founder. Geen auto-promotie. Default shadow-periode is een parameter in de implementatie, niet canoniek.

**Audit-spoor.** Elke gate-write (shadow of active) komt in een append-only log. Voor blobbies: `~/.blobbies/blobs/<uuid>/runs.json`. Voor umbrella-handovers: `/_shared/handovers/handover-YYYYMMDD-HHMM-<slug>.md`.

---

## Retention classes

Drie retention classes voor handover- en gate-state-files. **Defaults zijn parameters** — canoniek is de class-naam en het onderscheid, niet de specifieke termijn.

| Class | Wanneer | Default-termijn (parameter, niet canoniek) |
|---|---|---|
| `fiscaal` | Geld-staat, factuur-data, BTW-aangiften | 7 jaar (denkrichting) |
| `canoniek` | Canon-beslissingen, agent-runs, capability-regime writes | permanent in git; runtime-buffered tot git-sync |
| `operationeel` | Kort-cyclische operaties, drafts, sessie-logs | 30 dagen (denkrichting) |

**Default-overriding binnen handovers.** Een handover-file kan de default overrulen via frontmatter-veld `retention` met expliciete termijn. Bij twijfel tussen twee classes wint `fiscaal` boven `canoniek` boven `operationeel` (van streng naar soepel). De abstracte bron van deze hiërarchie is `/_shared/retention-policy-canon.md`; de handovers-toepassing is hier.

**Audit-spoor.** Files met `retention: fiscaal` worden NIET automatisch verwijderd, ook niet na hun termijn — ze wachten op expliciete menselijke commit-call. Files met `retention: operationeel` kunnen door cron-achtige opruim-acties worden verwijderd zonder tussenkomst, mits dat in de file-life-cycle-policy staat.

---

## Handovers

Cross-reference: zie `/_shared/handovers/` (afzonderlijke canon-folder). Vocabulary voor handovers:

| Veld | Verplicht | Type | Notitie |
|---|---|---|---|
| `from` | ja | slug | Bron-identifier (canonieke naming-conventions) |
| `to` | ja | slug | Doel-identifier; **runtime-mapping naar tool**, niet canoniek |
| `actor` | ja | slug of `founder` | Wie voert de handover uit |
| `reason` | ja | vrije tekst | Korte rechtvaardiging |
| `retention` | ja | fiscaal / canoniek / operationeel | Zie Retention classes |
| `crosses_boundary` | ja | boolean | Of de handover een boundary oversteekt |

**Naam-template.** `handover-YYYYMMDD-HHMM-<slug>.md` — audit-spoor zit in deze files, geen externe logger.

---

## Provider-as — overzicht (geen implementatie)

| Aspect | LocalProvider (Ollama e.a.) | RemoteProvider (Tinfoil e.a.) |
|---|---|---|
| Egress-trust | Geen externe call; loopback | Cloud-call onder provider-CSP |
| Latency | Laag (geen netwerk) | Medium (provider-RTT) |
| Cost | Effectively zero | Per-token of per-call |
| `ask_human` voor account-acties | Provider-trust al gegeven; vraag is gebruikers-intent | Provider-trust al gegeven via CSP; vraag is gebruikers-intent |
| `research_capped` cap | Per-Blob tuning, geen canon-default | Per-Blob tuning, geen canon-default |
| Fail-mode bij unreachable | fail-OPEN (lokaal) | fail-CLOSED (geen provider = geen actie) |

**Beslissings-laag orthogonal aan provider.** Een gate die werkt op een LocalProvider kan in principe dezelfde matrix-entry gebruiken als een gate op een RemoteProvider. Per-Blob tuning kan afwijken (zie tabel in deze file), maar de **action-namen en de matrix-action-types veranderen niet**.

**Provider-specifieke tuning is runtime, niet canon.** De matrix-entry bepaalt de fail-mode; cap-waarden, latency-drempels en cost-budgets worden per Blob en per provider vastgesteld in de implementatie.

---

## Wat NIET in scope is voor v1

- **Kill switch per provider.** Per-provider enable/disable — kan in latere versie.
- **Concrete LocalProvider / RemoteProvider interfaces.** Code-level abstractie, hoort in een implementatie-spec, niet in canon.
- **Concrete wire-up code.** Een `jev-policy.json`-config of een `jev_ask(prompt, mode, timeout_ms)`-tool-spec — implementatie-detail.

---

## Cross-references

- `/_shared/icm-canon.md` — context-methodologie (vormen, walk-test, factory/product-split). Geen claim over "vijf-lagen-model"; deze file voegt een infra-lokale laag toe orthogonal aan agent/skill/instance.
- `/_shared/naming-conventions.md` — slug-format voor `from`, `to`, `actor` velden.
- `/_shared/handovers/` — folder voor audit-spoor van cross-boundary handovers.
- `decisions.md` — Ronde 14+ voor de blobbies-verbinding, in volgorde van canon-uitbreiding.
- `research/djinlabs-blobbies-fit-research.md` — bron-research voor deze canon-file (gerenamed in Ronde 18).
- `/_shared/retention-policy-canon.md` — abstracte bron van de retention-hiërarchie die deze file op handovers toepast.