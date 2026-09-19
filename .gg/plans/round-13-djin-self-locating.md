# Ronde 13 — Djin self-locating (cwd-fix + client-prefix stub)

> Plan gemaakt in plan mode (read-only research). Wordt uitgevoerd na user-go via `exit_plan`.

## Context

Djin is in Ronde 12 als eerste operationele tenant van DjinLabs-Webrnds-Umbrella gespiegeld via symlinks vanuit `/djinlabs_system_design/djinlabs/tenants/djin/`. Dat werkt voor **lezen**, maar Djin's runtime breekt zodra hij vanuit een **andere cwd** of via de **symlink-pad** wordt gedraaid: 6 plekken in Djin's kern gebruiken `process.cwd()` als project-root-anchor, wat niet robust is tegen cwd-wijzigingen of symlink-resolutie.

**Doel:** Djin wordt **self-locating** — binary-anchor (zoals `src/agent/registry.ts` al doet) in plaats van cwd-anchor. Tests blijven werken via `setIcmRoot`. Plus één stub `resolveClientPrefix()` als voorbereiding op de toekomstige front-end-adapter-beurt, zonder die abstractie vandaag te bouwen.

**User-call (samengevat):**
- Optie (b)+stub-aanpak: kanonieke discipline (registry.ts-patroon) volgen, géén folder-abstractie nu.
- "Djin is vast, app wisselt" — canoniek principe in `decisions.md`.
- Adapter-abstractie komt pas bij tweede front-end (webhook, e-mail, web UI), niet eerder.

## Wat al is gedaan in deze beurt (vóór plan mode)

Twee `edit`-calls zijn al gelukt en staan op disk:

1. **`src/agent/registry.ts`** — module-level `getProjectRoot()` geëxporteerd, met JSDoc-commentaar dat uitlegt waarom binary-anchor en niet cwd-anchor.
2. **`src/icm.ts`** — `let ICM_ROOT = resolve(getProjectRoot(), "ICM")` in plaats van `process.cwd()`. Bevestigd door success-melding; niet onafhankelijk geherechecked in plan mode (read-only).

## Wat nog moet gebeuren

### Stap 1 — `src/agent/dispatcher.ts` (1 regel)

**Locatie:** regel 32.

**Huidige code:**
```typescript
projectRoot: string = process.cwd(),
```

**Nieuwe code:**
```typescript
projectRoot?: string,
```

**Plus body-fix** op regel 33 (default toepassen):
```typescript
const effectiveRoot = projectRoot ?? getProjectRoot();
```

Plus import toevoegen boven aan het bestand (naast de bestaande `import type { RegisteredAgent }`):
```typescript
import { getProjectRoot } from "./registry.js";
```

**Waarom optioneel?** De bestaande signature `projectRoot: string = process.cwd()` heeft een default-arg. Default-args verschijnen niet in de smoke-test (regel 545 geeft `projectRoot` expliciet door). We willen in productie `getProjectRoot()` als default. Default-args in TypeScript kunnen alleen statische literals of noemen naar andere params — geen functie-aanroep. Vandaar: optioneel maken, in de body resolven.

### Stap 2 — `src/agent/{sales,work,notes}-loop.ts` (3 regels + 3 imports)

**Identieke fix in drie bestanden.** Regelnummers (van eerdere reads, kunnen ±2 afwijken):

- `src/agent/sales-loop.ts:264`: `const projectRoot = resolve(process.cwd());` → `const projectRoot = resolve(getProjectRoot());`
- `src/agent/work-loop.ts:343`: identiek.
- `src/agent/notes-loop.ts:406`: identiek.

**Imports toevoegen** aan elk bestand, naast de bestaande `import { fileURLToPath } from "node:url"` (regel 21 in elk):

```typescript
import { getProjectRoot } from "./registry.js";
```

### Stap 3 — `src/config.ts` (1 nieuwe functie + 1 nieuwe property)

**Doel:** stub voor `resolveClientPrefix()` die later de channel-resolver voedt. Wordt **niet** aangeroepen door Djin's runtime in deze beurt — staat klaar voor de adapter-beurt.

**Toevoegen vóór `export const config = {`** (rond regel 12):

```typescript
/**
 * Stub voor toekomstige client-facing-adapter (Slack, webhook, e-mail, web UI).
 * Leest `DJIN_CLIENT_PREFIX` env; default `""`. Wanneer een tweede front-end
 * komt, vervangt deze functie de hard-coded Slack-conventie zonder code-wijziging
 * in Djin's kern.
 */
export const resolveClientPrefix = (): string =>
  process.env.DJIN_CLIENT_PREFIX ?? "";
```

**Plus toevoegen aan `config`-object** (rond regel 50-61, bij `transcription`):

```typescript
clientPrefix: resolveClientPrefix(),
```

**Plus `.env.example` bijwerken** (rond regel 13-15, na `DJIN_LLM_PROVIDER`-sectie of onderaan):

```
# Per-klant Slack-channel-prefix voor Webrnds-facing routing.
# Wordt gebruikt door de toekomstige front-end-adapter.
# DJIN_CLIENT_PREFIX=webrnds-
```

### Stap 4 — `decisions.md` (Ronde 13 entry + frontier-update)

**Wat toevoegen** (na Ronde 12, vóór `## Canonical Webrnds tree`):

Nieuwe `### Ronde 13` sectie met:

- **Context-paragraaf**: waarom we dit doen (Ronde 12 liet zien dat Djin via symlinks gespiegeld wordt; umrella-cwd moet werken).
- **Twee user-calls**: (b) optie + adapter-later, en "Djin is vast, app wisselt".
- **Drie beslissingen**:
  - Q13.1 — cwd-anchor: self-locating via `getProjectRoot()` (zoals `registry.ts` al deed), niet `process.cwd()`. Past bij U4 (top-file-only-routes — runtime is locatie-onafhankelijk).
  - Q13.2 — abstractie: **niet nu**. Adapter-beurt komt pas bij tweede front-end. Stub `resolveClientPrefix()` in `config.ts` voorbereidt zonder abstractie te bouwen. Past bij Matt Pocock's "Config is death".
  - Q13.3 — canoniek principe: **Djin is vast, app wisselt**. Slack-facing adapters zijn tijdelijk; Djin's kern is permanent. Vastgelegd in `decisions.md` zodat toekomstige rondes niet vergeten dat Slack uitwisselbaar moet zijn.
- **Wat er op disk staat**: 6 `process.cwd()`-fixes (1 in `icm.ts`, 1 in `dispatcher.ts`, 3 in agent-loops, 0 in smoke.ts want die test regressie), 1 `getProjectRoot()` export in `registry.ts`, 1 `resolveClientPrefix()` stub in `config.ts`, 1 `.env.example`-regel.

**Frontier-update:**

- Drop "Djin-tenant-embedding" ✅ — vervangen door "Djin-self-locating" ✅.
- Voeg "Front-end-adapter-abstractie" als **geparkt** item toe voor wanneer een tweede front-end komt.

**Done-sectie uitbreiden:**

- "Djin self-locating fix geland (2026-09-19): `getProjectRoot()` in `registry.ts`; 6 callers bijgewerkt; `resolveClientPrefix()` stub in `config.ts`."

### Stap 5 — Verificatie: `npm run smoke`

**Draaien in `/Users/gogetta/Documents/projects/slack/`.**

Verwacht resultaat: alle smoke-tests groen, inclusief regel 511-552 (`resolveSpawnConfig` regressie-test) en regel 35 (sales-loop `detectIntent` via direct import).

**Bij falen:** failure inspecteren, fix aanpassen, opnieuw draaien. Drie-keer-dan-stop-regel van het system prompt geldt — als de derde poging faalt, stop en rapporteer aan user met exacte failure-output.

**Bij groen:** als extra sanity-check `npm run build` draaien om TypeScript-strict te valideren (registry.ts' nieuwe export wordt door andere modules gebruikt — moet strict typen).

## Wat NIET in deze beurt zit (wachten op volgende ronde)

1. **Front-end-adapter-abstractie** (`frontends/slack/` of `adapters/slack-bolt/`) — wacht op tweede front-end.
2. **Channel-resolver** (Slack channel-prefix → klant-slug) — wacht op adapter-beurt.
3. **Multi-tenant Webrnds → Slack routing** — wacht op channel-resolver.
4. **Djin-agents universeel** (`/djinlabs/skills/`) — Ronde 9+10 spec'd maar nog niet geschreven; Djin's eigen agents blijven Djin-spec.

## Risico's en observaties

- **Risico 1 — symlink-resolutie bij smoke-tests.** `getProjectRoot()` resolved via `import.meta.url`. Als smoke.ts vanuit de umbrella via symlink draait, kan `__filename` het symlink-pad geven. `resolve()` normaliseert dat niet automatisch. Mitigatie: `realpath()` toevoegen als safety. Laat ik zien in implementatie of dit issue triggert tijdens smoke.

- **Risico 2 — `setIcmRoot()` vs `getProjectRoot()` race.** Geen — `setIcmRoot` muteert een module-level `let` in `icm.ts`; `getProjectRoot` is een pure functie in `registry.ts`. Geen interactie.

- **Risico 3 — smoke-regel-518 blijft `process.cwd()`.** Die is een **regression-test** voor `resolveSpawnConfig` die juist `process.cwd()` test. Aanraken = test slopen. Niet aanraken.

- **Observatie — anchor is canoniek voor alle toekomstige front-ends.** Of Djin straks via Slack, webhook, of eigen web UI praat, hij blijft `getProjectRoot()` als binary-anchor gebruiken. Adapter-beurt kan die anchor overnemen zonder extra werk.

## Steps

1. Pas `src/agent/dispatcher.ts` aan: optionele `projectRoot` + body-default + import `getProjectRoot`.
2. Pas `src/agent/sales-loop.ts` aan: regel 264 + import.
3. Pas `src/agent/work-loop.ts` aan: regel 343 + import.
4. Pas `src/agent/notes-loop.ts` aan: regel 406 + import.
5. Voeg `resolveClientPrefix()` stub toe in `src/config.ts` + property in `config`-object + regel in `.env.example`.
6. Vouw `decisions.md`: Ronde 13 entry + frontier-update + Done-uitbreiding.
7. Draai `cd /Users/gogetta/Documents/projects/slack && npm run smoke`. Bij groen: ook `npm run build` als TypeScript-strict-check. Bij rood: fix, retry, max 3 pogingen.
8. Rapporteer outcome aan user: groen/rood, wat er op disk staat, wat de volgende beurt kan zijn.
