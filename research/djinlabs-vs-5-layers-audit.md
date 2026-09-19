# DjinLabs vs de 5-lagen harness — audit

**Maker:** GG Coder (audit), op verzoek van founder
**Datum:** 2026-09-19
**Trigger:** research/simon-hoiberg-ai-system-7-figure.md ("The AI System Behind My 7-Figure Business", 20:01, 24 aug 2026)
**Doel:** map DjinLabs' canon op Simon's 5 lagen; markeer waar we staan en waar de gaten zitten.

---

## TL;DR

| Laag | Dekking | Eindoordeel |
|---|---|---|
| 1. Eval Classifiers | ~83% (5/6) | Sterk, één gat: slop-gate ontbreekt |
| 2. Schema Contracts | ~50% (1.5/3) | Fail-CLOSED ja; algemene handoff-schema's niet canoniek |
| 3. Purpose-Built Tools | **100% (5/5)** | Sterkste laag |
| 4. Deterministic Workflows | ~50% (2/4) | Verdict-routing ja; algemene state-machine voor workflows niet canoniek |
| 5. Failure Replay | **~10% (0.5/4)** | Grootste gat — geen failure-library, geen replay-procedure |

**Patroon**: lagen 1-3 zijn structureel goed uitgewerkt voor de **Jev-wire-up** (Q13-Q17). Lagen 4-5 zijn geïmplementeerd voor **Money-verdict-routing**, maar ontbreken als canoniek patroon voor de bredere agent-fleet. Geen toeval: de grilling heeft zich tot Ronde 8 op Jev-wire-up geconcentreerd, niet op algemene agent-workflows (Ronde 9+).

---

## Laag 1 — Eval Classifiers

**Bron-video (01:57-05:43):** Splits werk en beoordeling in separate jobs. Twee soorten: deterministisch (regex/blacklist) of judgment (andere AI, strakke system prompt, smal verdict). Voorbeeld: per YouTube-script-hoofdstuk 3 onafhankelijke checks (slop gate / voice check / job check).

| Element | DjinLabs | Bron |
|---|---|---|
| Split werk + beoordeling | **Ja.** Q16-C: deterministische grader primary, Jev `Score` is R&D-spoor | Q16 thread + design-doc §"Audit-grader" |
| Deterministische evals (regex/blacklist) | **Ja.** U1-U8 zijn deterministisch verifieerbaar | Q1 |
| Judgment-evals (smal verdict + reden + bewijs) | **Ja.** Q14-A writeWrapper → Jev `Choice` smal verdict | Q14 |
| Meerdere onafhankelijke checks per artifact | **Ja.** U2/U3/U7/U8 + hot-path vs cold-path | Q1 + design-doc |
| **Slop gate** (AI-clichés: em-dashes, "not X but Y", mic-drop, buzzwords) | **Nee.** | (geen) |

**Eindoordeel:** 5/6. Slop-gate is een waardevolle toevoeging voor skills-hosting (Q19+) — niet voor canon.

---

## Laag 2 — Schema Contracts

**Bron-video (06:47-09:10):** JSON-schema per agent-handoff. `required` alleen is niet genoeg — formaat, niet-leeg, minima. Software weigert handoff als het niet klopt.

| Element | DjinLabs | Bron |
|---|---|---|
| Verplichte velden per agent-handoff | **Gedeeltelijk.** Jev `Choice` heeft smal verdict-contract (drie waarden, retry_policy shape). Algemene agent-handoff-schema's (support → tech) niet expliciet. | Q17 shape |
| `required` + formaat + minima (niet alleen aanwezigheid) | **Gedeeltelijk.** Q15-B `startsWith` op path = formaat-check, niet velden-set. | Q15 |
| Software weigert handoff | **Ja — fail-CLOSED.** Q13-A `/money` Universal Verification; alleen APPROVE rolt door. | Q13 |

**Eindoordeel:** 1/3 expliciet, 1/3 gedeeltelijk, 1/3 ja. Voor **Money-writes** sterk; voor **algemene agent-handoffs** niet canoniek.

---

## Laag 3 — Purpose-Built Tools

**Bron-video (10:03-12:21):** Principle of least privilege. Keycard per ruimte; software handelt permissies/validatie/formatting; model ziet alleen benoemde actie.

| Element | DjinLabs | Bron |
|---|---|---|
| Least privilege — keycard voor één ruimte | **Ja.** Q11-B MCP-wrapper: één policy voor alle callers. | Q11 |
| Geen algemene DB + "alleen indien nodig"-hoop | **Ja.** Q10-B hooks-laag als eerste Jev-wire-up, niet Jev direct. | Q10 |
| Software handelt permissies/validatie/formatting | **Ja.** Q14-A writeWrapper + Q8 Sunday-audit. | Q14 + Q8 |
| Sommige deuren vereisen approval | **Ja.** Q17-D: REJECT wacht op approval, HOLD pingt founder. | Q17 |
| Capability "simply not available" | **Ja.** Q15-B: `_internal/` hard-excluded; kan niet via Jev. | Q15 |

**Eindoordeel:** 5/5. DjinLabs' sterkste laag.

---

## Laag 4 — Deterministic Workflows

**Bron-video (14:05-16:15):** Model krijgt vrijheid binnen een state; transities tussen states worden door software afgedwongen. Piloten-analogie.

| Element | DjinLabs | Bron |
|---|---|---|
| Vrijheid binnen state | **Ja.** Q16-C: deterministische grader primary, Jev vrij binnen write-pass. | Q16 |
| Software dwingt volgorde af (transition rules) | **Gedeeltelijk — via hooks.** U2 = alles via hooks, maar geen canonieke **state-machine voor workflow-stappen** (Reproduction → Regression → Implementation → Review zoals Simon). | Q1 + U2 |
| Per state: outputs + checks + gates | **Gedeeltelijk.** Q17-D per verdict: outputs + routing. Verdict-state, niet workflow-state. | Q17 |
| Menselijke approval gate | **Ja.** Q17-D. | Q17 |

**Eindoordeel:** 1/4 expliciet state-machine, 2/4 gedeeltelijk, 1/4 ja. Voor Jev-wire-up sterk; voor algemene agent-workflows (support-bug, klant-onboard, sponsor-qualification) ontbreekt canonieke state-machine.

---

## Laag 5 — Failure Replay

**Bron-video (17:26-19:01):** Sla gemankeerde output op als case (taak + foute output + bron + reden). Bij eval-update of model-switch: oude cases opnieuw draaien vóór live. Eigen failure library > publieke benchmarks.

| Element | DjinLabs | Bron |
|---|---|---|
| Elke gemankeerde output wordt opgeslagen | **Gedeeltelijk.** Audit-trail per write (regel 168 design-doc) + REJECT-holdings (regel 211). Logging, geen failure-library. | design-doc |
| Bij eval-update: oude cases opnieuw | **Nee.** | (geen) |
| Bij model-switch: oude cases als gate | **Nee.** | (geen) |
| Taak + foute output + bron + reden | **Gedeeltelijk.** Q17-shape slaat rationale op; bron-context niet systematisch. | Q17 |

**Eindoordeel:** 0/4 expliciet. Grootste gat.

---

## Concrete kandidaat-topics voor Ronde 10+

Drie gaten die tijdens deze audit zijn geïdentificeerd. Geen locks; alleen registratie dat ze bestaan.

1. **Failure-replay-mechanisme** (laag 5) — failure-library + replay-procedure als canonieke laag, niet alleen logging. Past in Ronde 10 of 11 (skills-hosting of Money-discipline); niet in Ronde 9 (agent-mapping), want replay is een **toepassing** van agenten, geen topologie.

2. **Slop-gate in skills-hosting** (laag 1) — deterministische check op AI-clichés (em-dashes, "not X but Y", mic-drop, AI-buzzwords) als **per-skill eval-classifier**, niet als hard-rule. Wordt relevant zodra skills-hosting (Q19+) wordt uitgewerkt en tweede instance (Q4.1) content genereert.

3. **Canonieke state-machine voor agent-workflows** (laag 4) — transitie-regel-patroon zoals Simon's bug-fix-flow (S1 Reproduction → S2 Regression → S3 Implementation → S4 Review), generiek genoeg voor Jev-routing, support-flow en content-flow. Past in Ronde 10 of 11.

---

## Bron

- research/simon-hoiberg-ai-system-7-figure.md — volledige samenvatting van de video, met tijdstempels en slide-references.
- state.json (grill-session 20260919-133302) — Q1, Q10, Q11, Q13-Q17 locks.
- docs/djinlabs-1-folder-fundamentelen-design.md — canon-vertaling, audit-trail-verwijzingen.
- decisions.md — historische context van Ronde 1-8.

---

## Hoe een agent dit kan gebruiken

**Bij audit-vraag:** "Voldoet DjinLabs aan de 5-lagen harness?" → dit document is het antwoord.

**Bij Ronde 10+:** drie kandidaat-topics (failure-replay, slop-gate, workflow-state-machine) zijn **op de lijst**, hoeven niet ad-hoc bedacht.

**Bij model-wissel:** failure-library ontbreekt nog. Noteer voor wanneer die er is.
