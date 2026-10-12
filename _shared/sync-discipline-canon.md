# sync-discipline-canon

> **Canoniek principe (Ronde 16):** Agent verantwoordelijk, sync bij elke Ronde,
> einddoel generator-only.

Drie orthogonale assen die samen de discipline vormen: wie synct, wanneer, en hoe
maken we drift structureel onmogelijk. Dit bestand legt het principe vast; de
implementatie (generator) is Ronde 17+.

## Vocabulary

### drift

Verschil tussen twee canonieke bronnen over dezelfde claim. Voorbeeld:
`docs/djinlabs-1-folder-fundamentelen-design.md` zegt "Ronde 1-11 locked" terwijl
`decisions.md` op Ronde 14 zit — drie Rondes achter. Of: `_shared/jev-policy-canon.md`
noemt runtime-state-spiegels zonder `_shared/state-formats-canon.md` te citeren.

_Avoid_: lag, out-of-date, inconsistency

### sync-discipline

Canonieke afspraak over wie een canonieke file bijwerkt, wanneer, en hoe drift
wordt voorkomen. Vraagt een canonieke bron (deze file) en een trigger (bij elke
Ronde, per definitie hieronder). De discipline zit in de agent-flow zelf, niet
in een externe tool of sync-script.

_Avoid_: sync-strategie, sync-discipline light, sync-policy

### lei

De leesbare vertaling van een canonieke bron. design-doc is de lei (zie
`docs/djinlabs-1-folder-fundamentelen-design.md` regel 3 — "grill-session is de
bron, design-doc is de lei"). Niet de bron — de vertaling. Een lei mag
achterlopen, maar de discipline zegt: niet meer dan één Ronde.

_Avoid_: documentatie, manual, handboek, naslagwerk

## De drie assen

Drie orthogonale vragen, drie locked antwoorden. Eén as veranderen zonder de
andere twee is canoniek werk — vereist een nieuwe Ronde.

### Wie synct? — Q1 = A

**De agent die een Ronde afsluit is verantwoordelijk voor sync.** Niet een apart
processtap of sync-script. Past bij de canonieke claim "Markdown = knowledge"
(`_shared/state-formats-canon.md`) — de discipline hoort in de agent-flow, niet
in een canonieke tool met eigen onderhoud.

Eén Ronde is alleen **done** als alle gerelateerde files gesynced zijn:

- `decisions.md` Ronde-N-sectie is toegevoegd of bijgewerkt.
- Frontier-items die in deze Ronde gesloten zijn, zijn in de frontier-lijst
  gemarkeerd als CLOSED.
- `docs/adr/<volgnummer>-<slug>.md` is geschreven als de beslissing een ADR verdient.
- `CONTEXT.md` glossary bevat nieuwe canonieke termen die in deze Ronde zijn
  geïntroduceerd.
- Alle `AGENTS.md`-routers die de gewijzigde canonieke bron noemen, zijn bijgewerkt.
- `docs/r<N>-f<#>-<slug>-design.md` (de lei) is gesynced met deze Ronde's locked
  decisions.

### Wanneer syncen? — Q2 = A

**Bij elke Ronde, automatisch.** Geen pre-commit-detectie zonder forcering,
geen wekelijkse audit. Past bij Q1=A: de discipline zit in de Ronde-flow zelf,
niet in een externe trigger.

Sync hoort bij de Ronde-flow, niet erna. Een Ronde waarvan de sync een
latere ronde moet doen, is een Ronde die drift zaait.

### Hoe maken we drift onmogelijk? — Q3 = C

**Generator-only.** Design-doc en AGENTS.md-routers worden volledig gegenereerd
uit canonieke bronnen. Geen hand-edits aan die files, alleen generator-output.

Maximaal canoniek: er is geen file meer om uit sync te raken. Als de generator
uit kan voeren, is er geen mens-edits meer waar drift optreedt.

**Implementatie is Ronde 17+ werk.** Dit canon legt het principe vast; de
feitelijke generator-code is nog niet geschreven. Tot die generator bestaat,
kan drift nog steeds optreden — alleen is de *canonieke eis* nu vastgelegd dat
er één moet komen. De tussentijdse discipline is: hand-edits zijn toegestaan
tot de generator er is, maar elke hand-edit moet in de Ronde-sectie van
`decisions.md` expliciet vermeld worden als "pre-generator hand-edit".

## Drift-detectie trigger

Bij elke Ronde moet de matrix canonieke-bron ↔ runtime-state-spiegels uit
`_shared/state-formats-canon.md` gecontroleerd worden op ontbrekende cellen.
Dit is geen enforcement — alleen een trigger die de agent dwingt om even te
kijken of er runtime-state is ontstaan zonder canonieke bron of omgekeerd.

Aanvullende drift-triggers voor sync-discipline zelf:

- **Voor elke nieuwe canonieke bron in `_shared/`**: alle vier `AGENTS.md`-routers
  moeten binnen dezelfde Ronde een cross-reference krijgen.
- **Voor elke gesloten frontier-item**: de frontier-lijst in `decisions.md`
  moet het item als CLOSED markeren, niet alleen de Ronde-sectie.
- **Voor elke nieuwe canonieke term**: `CONTEXT.md` glossary moet de term
  binnen dezelfde Ronde bevatten (Capability 9-nazending is alleen toegestaan
  als de agent Capability 9 niet tijdens het interview kon draaien — anders
  is het een drift-geval).

## Cross-references

1. **`_shared/state-formats-canon.md`** — bron van "Markdown = knowledge, JSON =
   state". Sync-discipline past binnen dat principe: de discipline is in de
   agent-flow (Markdown), niet in een sync-tool (zou runtime-state zijn).
2. **`_shared/jev-policy-canon.md`** — audit-spoor en shadow/active modes
   raken sync-discipline niet direct; wel relevant voor handovers die een
   sync-discipline-grens oversteken.
3. **`decisions.md` Frontier #9** — bron van deze canon (Ronde 16).
4. **`docs/djinlabs-1-folder-fundamentelen-design.md`** — de lei die door
   sync-discipline gesynced moet worden. Ronde 16 doet dat niet (Ronde 17+);
   het verschil is nu canoniek gemarkeerd.

## Bewijs-pad

- **Design-doc:** `docs/r16-f9-sync-discipline-design.md` (de bron van deze canon).
- **Plan:** `docs/r16-f9-sync-discipline-plan.md` (9 stappen, 18 plan-tasks).
- **Frontier-bron:** `decisions.md` Frontier #9 (Ronde 14+).
- **Glossary:** `CONTEXT.md` (canonieke vocabulary, drie nieuwe termen).
- **ADR:** `docs/adr/0002-sync-discipline.md` (Context, Decision, Consequences).
- **Visual:** `docs/r16-f9-sync-discipline-visual.html` (architecture-diagram,
  6 nodes, 9/9 archify artifact-checks groen).
- **Grill-session-state:** `~/.grill-with-ui/sessions/Users-gogetta-Documents-djinlabs_system_design/20260921-155505/state.json`
  met `agent.gate.decision = approved`, `finished` met design-doc + visual.
