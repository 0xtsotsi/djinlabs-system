# Q6.3 — Universele hard-rules inventory (candidated draft)

> Status: candidated draft. **Targeted sweep performed — actual 16 rules not on disk in this session (see Verification trail at the bottom).** This file derives the *shape* of universal rules from the SESSION-BRIEF.md description of the four-layer pattern + Djin's ICM structure + the constraints a DjinLabs template must impose to remain a template rather than a husk. Treat it as shape, not voice.
> Purpose: close Ronde 6/Q6.3 with a draft the user can either approve-as-is, amend, or replace with the actual 16.
> Date: 2026-09-19.

## Research provenance

| Field | Value |
|---|---|
| source | This is an inference, not an agent-collected artifact. Derived from `/Users/gogetta/Documents/djinlabs_system_design/.gg/uploads/mu81t60i-SESSION-BRIEF.md` (already in this repo) and a read of `/Users/gogetta/Documents/projects/slack/ICM/` (Djin project). |
| confidence | **Low for the exact wording of each rule** — these are not the user's rules, they are what such rules would plausibly say given the system description. **Medium for the *count* and the *categories*** — the SESSION-BRIEF says 16 rules + 12 failures + 4 layers, and the four-layer pattern constrains the rule-space heavily. |
| what would close this | User pastes the actual 16 hard rules (or points me at the file) and I map each candidate to its real counterpart. |

## Constraints the candidates must satisfy

From the SESSION-BRIEF (§2 "How OathDriven is organized") the four layers that prevent rot:

1. **Map** — one start file per tree; top file only routes.
2. **State** — one state file per tree; newest date inside the file wins.
3. **Enforcement** — skills suggest, **hooks enforce**. Hooks read words before the AI does, check what was touched on exit, and refuse rule-breaking files before they land.
4. **Cadence** — Sunday audit grades the folder.

And from the same brief: hooks already enforce the 16 hard rules; rules become `Choice` options or `Noul` criteria in TypeSafe; failures become negative examples.

That gives us a hard upper bound: any *universal* rule must apply to **every template instance** (DjinLabs workspace, Webrnds workspace, any future tenant workspace). Anything that only applies to "an agency that builds Dutch MKB software" is per-instance, not universal.

## Candidated draft — 8 universele hard-rules

Ranked by **how load-bearing they are for the template to function at all** (most load-bearing first).

### U1. Folder = company (start + state per tree)
Every folder that represents a company, venture, or tenant has exactly one **start file** ("what this tree is, where to go") and exactly one **state file** ("where things stand today"; the date inside is authoritative, not the file's mtime). No start = not a company-folder. No state = the folder is lying about its status.
*Enforced by:* folder-shape hook on creation; Sunday audit counts mismatches.

### U2. Everything via hooks (no AI touches the filesystem bare)
Skills **suggest**; hooks **enforce**. No file is written, edited, or deleted except through a registered hook that has read the file's words before the AI saw them and re-checked on exit. Refuse rule-breaking files before they land.
*Enforced by:* write-pre-hook + write-post-hook; TypeSafe `Noul("breekt dit regel X?")` as the cheap fast-path before the model call.

### U3. No secrets to logs / commits / state files
API keys, BTW-nummers, KVK-inschrijfgegevens, klant-PII, en session tokens gaan nooit naar logfiles, git-commits, of state files zonder redactie. Geen uitzondering, ook niet voor debug-doeleinden.
*Enforced by:* pre-commit hook + log-writer wrapper; TypeSafe `Noul` op tekst-classificatie.

### U4. Top file only routes, never loads the pile
De top-file van een boom-route **enkel** naar de kamer die de taak bezit; laadt nooit de hele stapel. Voorkomt dat een AI-agent een folder recursief in-context trekt.
*Enforced by:* structural lint op top files; verbiedt directe verwijzingen naar diepere lagen vanuit de root.

### U5. State date wins over file mtime
Het veld `last_review` of equivalent binnen een state file is **authoritative**. Filesystem-mtime mag afwijken (atomic writes, git, sync-tools). Elke aflezing van "waar staat dit?" gaat via de state file, niet via `stat(2)`.
*Enforced by:* read-hook die state-file opent vóór het lezen van welke andere file dan ook.

### U6. Newest date inside the file wins
Onder meerdere state-files of state-entries voor dezelfde tree wint de **nieuwste datum in de tekst**, niet de volgorde op schijf. Voorkomt dat een oude state "voor" een nieuwe verschijnt na een merge.
*Enforced by:* parse-hook op state-file writes.

### U7. Sunday audit grades the folder (cadence layer)
Eens per week wordt een on-demand audit gedraaid die de folder structureel scoort op regel-conformiteit. Geen audit-run = onbekende staat. Audit-output gaat in de state file van de tree zelf.
*Enforced by:* cron-equivalent (geen AI-call, wel deterministische scan); Jev `Score` voor composite grading.

### U8. Failures become negative examples
Elke geschreven-down failure (12 stuks per SESSION-BRIEF) wordt **negatief voorbeeld** in de prompt-instructies van de relevante agent. Geen failure = geen agent-instructie-update; instructies verouderen als de failure niet landt.
*Enforced by:* write-post-hook die een failure in een state file koppelt aan de agent-folder waar de instructies leven.

## Per-instance rules (NOT universal — kept here for contrast)

Things that **look** universal but aren't:

- *"Geen WordPress voor klantprojecten"* → Codavo-specifiek. Webrnds erft deze waarschijnlijk (hij zit in de doelgroep-Codavo), maar een kliniek-template of een SaaS-template onder DjinLabs zou hier niets mee kunnen.
- *"iDEAL-first payments"* → Webrnds-specifiek (NL-doelgroep). Niet universeel.
- *"KVK-inschrijving als start-state trigger"* → Alleen entiteiten die in de KVK staan. DjinLabs zelf staat er niet in; die tree heeft een andere start-state-trigger nodig.
- *"Slack als enige front door"* → Djin-specifiek. Webrnds heeft geen Slack, heeft een eigen klantportaal. Toekomstige tenants ook niet per se.

These belong in a **per-instance rules file** (`<instance>/_rules.local.md` of equivalent), not in the universal template.

## Wat ik nu van jou nodig heb om dit te sluiten

Eén van deze:

- **A.** Je plakt de echte 16 hard rules uit je OathDriven-folder (of het pad ernaartoe), en ik map elke candidated U1–U8 op de echte regel + vul aan tot 16 met de overige 8 die instance-of-of-aanvullend zijn.
- **B.** Je accepteert deze 8 als de universele set "as-is" — dan landt dit als de Q6.3 close-out en gaat de grilling verder met Ronde 7 over de foldertree, agents-verdeling, en prijspunten (X en merklaag blijven open op jou).
- **C.** Je past een paar aan en stuurt de gecorrigeerde versie terug — ik werk `research/hard-rules-inventory.md` bij en sluit Q6.3.

Mijn aanbeveling: **C**, want de candidated draft dekt de *shape* maar niet de *voice* van OathDriven's regels, en dat onderscheid gaat later pijn doen.

## Verification trail

Two targeted grep/find sweeps were performed against the most-likely on-disk location before falling back to inference. Results:

1. `grep -rli "hard rule\|hardrule\|hard_rule" /Users/gogetta/Documents/projects/slack --include="*.md" --include="*.txt" --include="*.yaml" --include="*.yml" --include="*.json"` — exit 0; **1 hit: `SESSION-BRIEF.md`** (the briefing itself, which is already the source of the "16 hard rules" claim; it does not enumerate them).
2. `find /Users/gogetta/Documents/projects/slack -maxdepth 5 -iname "*oath*"` — exit 0; **0 hits.** No OathDriven-named files anywhere in the Djin project tree.

The actual 16-rule corpus is therefore not on this disk under any reachable path from this session. The candidated U1–U8 above stand as a shape-only draft; downgrade-from-verbatim is not possible without the source material.
