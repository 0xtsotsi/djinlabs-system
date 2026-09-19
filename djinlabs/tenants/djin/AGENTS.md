# /djinlabs/tenants/djin/ — Djin als DjinLabs-tenant

Djin is de **eerste operationele tenant** van DjinLabs. Fysiek leeft Djin op `/Users/gogetta/Documents/projects/slack/` (single-tenant OathDriven-tool, Bolt-app met Socket Mode). Voor de umbrella-view is Djin hier gespiegeld via symlinks.

**Wat hier symlinks zijn** (vanuit `tenants/djin/`):

| Symlink | Wijst naar | Doel |
|---|---|---|
| `ICM/` | `/Users/gogetta/Documents/projects/slack/ICM/` | Djin's zes domein-mappen (`Clients/`, `Sales/`, `Work/`, `Money/`, `Team/`, `Context/`) |
| `agents/` | `/Users/gogetta/Documents/projects/slack/agents/` | Djin's 3 live agents (`sales/`, `work/`, `notes/`) + 3 scaffold agents |
| `agent/` | `/Users/gogetta/Documents/projects/slack/agent/` | Lagere-case `agent/` (legacy folder, niet te verwarren met `agents/`) |
| `src/` | `/Users/gogetta/Documents/projects/slack/src/` | Bolt-handlers, agent-loops, dispatcher, ICM-API |
| `scripts/` | `/Users/gogetta/Documents/projects/slack/scripts/` | `setup-icm.ts` |
| `.gg/` | `/Users/gogetta/Documents/projects/slack/.gg/` | Djin's flow-engine, plans, commands, skills |
| `.agents/` | `/Users/gogetta/Documents/projects/slack/.agents/` | Matt Pocock skills lokaal (mirror van `skills-lock.json`) |
| `.claude/` | `/Users/gogetta/Documents/projects/slack/.claude/` | Claude-code lokale config (Djin-spec) |
| `.scratch/` | `/Users/gogetta/Documents/projects/slack/.scratch/` | Lokale scratch (Djin-spec runtime) |
| `SESSION-BRIEF.md`, `package.json`, `tsconfig.json`, `slack-app-manifest.yaml`, `skills-lock.json`, `.gitignore` | Djin-root canonieke files | Identificatie + capabilities |

**Wat NIET hier gespiegeld is** (omdat lokaal/geheim):

- ❌ `.env`, `.env.example` — secrets, blijven bij Djin
- ❌ `node_modules/` — installatie-cache
- ❌ `dist/` — build-output
- ❌ `package-lock.json` — lock-state, lokaal
- ❌ `.git/` — git-state, lokaal
- ❌ `.DS_Store`, `naamloze map` — OS-artefacten

## Wat NIET in deze tenant zit

- Djin-agents universeel (`intake-qualifier`, `strategist`, `retainer-coordinator`, `growth-spotter`) → leven in `/djinlabs/skills/` zodra ze geschreven zijn. Djin's 3 live agents zijn **Djin-implementaties**, niet universeel.
- Webrnds-klantdata → `/webrnds/clients/`. Twee aparte namespaces (Q12.1a).
- Hard-rules, naming-conventions, ICM-canon → `/_shared/`.

## Routing voor Djin-werk

| Task | Go to | Read |
|---|---|---|
| Begrijp Djin's huidige runtime-state | `ICM/Context/context.md` | (geappend met `# Umbrella-relaties`) |
| Voer Djin's `/sales`, `/work`, `/notes`, `/clients`, `/skills`, `/money` uit | `src/index.ts` + `src/agent/` | Bolt-handlers |
| Verbeter een skill | `.gg/skills/<naam>/SKILL.md` of `Work/skill-proposals/<skill>.md` | proposal-template |
| Bekijk business flow | `.gg/flows/<naam>.json` + `.html` | flow-diagram |
| Begrijp de umbrella-context | `/djinlabs/AGENTS.md` + `/djinlabs/_internal/` | umbrella-start |

## Boundaries (uit Djin's `Context/context.md`)

Onveranderd — Djin blijft OathDriven-only single-tenant:

- Slack-posten in `#bot-log`/`#meetings`/intern `#team` → auto.
- Slack-posten in klant-kanalen/klant-DM's/`#sales` → draft (approval needed).
- Mail versturen, geld uitgeven → eigenaar only.
- Bestand schrijven buiten `~/Documents/projects/slack/` → geweigerd door `src/icm.ts` containment.

**Umbrella-boundary (Ronde 13 beslist):** lezen van umbrella-data (`/djinlabs/`, `/webrnds/`, `/_shared/`) mag **vrij, read-only** — geen write. Write-verbod buiten `~/Documents/projects/slack/` blijft enforced via `src/icm.ts` containment.

## ICM-discipline

Djin hanteert zijn eigen ICM-discipline (zes domein-mappen + agents). DjinLabs-umbrella-discipline (`CONTEXT.md` per kamer, status-frontmatter op per-run artifacts, factory/product-split) is **canoniek voor nieuwe tenants**, niet afgedwongen op Djin. Djin volgt zijn eigen canonieke patronen zoals vastgelegd in zijn `agents/_schema.md` en `ICM/README.md`.

**ICM-convergentie (Ronde 13 beslist):** Djin's ICM-discipline convergeren we **minimaal** met umbrella-discipline — Djin is een operationele tool met bewezen werking; umbrella-discipline past zich aan Djin aan waar Djin al goed werkt.
