# Session Brief — OathDriven + Djin + TypeSafe

> Purpose: pick up this conversation in any future session and continue without re-deriving anything below. Read this file first; everything else is referenced from here.

## TL;DR

OathDriven is the user's LLC and **the single folder** that holds everything they own. Djin (this Slack project, `Documents/projects/slack/`) is the Slack front-end for OathDriven — a Bolt app with Socket Mode that dispatches `/sales`, `/work`, `/clients`, `/notes`, `/skills`, `/money` to per-agent folders. TypeSafe AI has not been wired in yet. The next concrete step is adding TypeSafe to the **hooks layer** (not an agent) as the first integration point.

---

## 1. The user

- Runs a one-person company called **OathDriven** (their LLC).
- Started paying for Claude **97 days ago** (relative to the session date 2026-09-17).
- Operates as a holding: every brand and project lives **under** OathDriven so that nothing owned sits outside the owning entity.
- Has 2,205 folders, 9,916 files, 2.64M words of text, 56 start files, 170 state files, 81 skills (16 with self-check), 3 hooks, 16 hard rules, 12 written-down failures.
- Cadence: a Sunday audit grades the folder. Before that habit the system rotted in 2–3 weeks.

## 2. How OathDriven is organized

Two files in every folder tree:
- **start file** — what this tree is, where to go
- **state file** — where things stand today; the date inside the file is authoritative, not the file's mtime

Top-level only:
- **CLAUDE.md-equivalent map** — 199 lines, 48 routes, points to the one room that owns each task. Routes to the room, never loads the pile.

Folder names carry the order of the work: `research → offer → market → close → products → produce`.

The four layers that prevent rot:
1. **Map** — one start file per tree; top file only routes.
2. **State** — one state file per tree; newest date inside the file wins.
3. **Enforcement** — skills suggest, **hooks enforce**. Hooks read words before the AI does, check what was touched on exit, and refuse rule-breaking files before they land.
4. **Cadence** — Sunday audit grades the folder.

The 4 layers did not exist on **June 11**. All four were built afterwards.

## 3. What OathDriven produces (numbers as of session date)

- 13 live sites/apps, 58 video builds started, 30 rendered, 17 on YouTube channel.
- 55 Skool packages, 63 free downloads, 105 blog pages across both brands, 13 client folders.
- 10 sending addresses on their own domains.
- 9,676 emails sent total (~125/day, none sent by hand): 4,086 relationship emails since Jun 30, 4,399 broadcast emails since Aug 9, 1,191 kits/off-sends since Aug 18.
- YouTube: first video Jul 19, 66,822 views, 3,000 hours watched, 1,200+ subs.
- Email: 779 ever-subscribed, 46 opted out, 733 still on list.
- Skool: $99/mo, first payment Jul 27, 588 members, 335 signups in last 30 days, 100% retention, 82% engagement.

## 4. Carla anecdote (do not lose)

Carla saw one folder and a pile underneath. The user's frame: "she wasn't wrong, she just hasn't seen inside it yet." The single-folder choice is intentional — owning entity owns everything underneath.

## 5. Djin (this repo)

Slack app, Bolt + Socket Mode. Package name in `package.json`: `djin`.

**Manifest variants** (`slack-app-manifest*.yaml`):
- `slack-app-manifest.yaml` — full feature set (DMs, reactions, files, all slash commands).
- `slack-app-manifest.org.yaml` — org-deploy-ready subset, fewer commands (`/sales`, `/work`, `/help`, `/note`), org-admin approval required.
- `slack-app-manifest.free.yaml` — free-tier subset (no DMs/mpim, no reactions, no files); enough for the agent pilot.

**Slash commands (full manifest)**:
`/note`, `/task`, `/lookup`, `/standup`, `/summary`, `/skill-refine`, `/help`, `/sales`, `/work`, `/clients`, `/notes`, `/skills`, `/money`.

**Source layout** (`src/`):
`index.ts`, `config.ts`, `help.ts`, `icm.ts`, `lookup.ts`, `note.ts`, `skill-refine.ts`, `standup.ts`, `summary.ts`, `task.ts`, `transcribe.ts`, `smoke.ts`.

**Agents folders** (`agents/`): `sales/`, `work/`, `notes/`. Each is a per-context silo — the workspace-blueprint pattern applied to Slack agents.

**ICM** (`src/icm.ts` + `ICM/` folder) — the user's own state/context system. Treat it as the existing storage layer; do not replace it without explicit instruction.

## 6. How Djin maps to the workspace-blueprint template (Downloads/workspace-blueprint/)

The template (`Downloads/workspace-blueprint/`) is a teaching example for a 3-layer routing architecture (`CLAUDE.md` = map, `CONTEXT.md` = router, workspace `CONTEXT.md` = scope). OathDriven implements this pattern natively. Djin's per-agent folders are workspace silos. Djin's slash-command routing is the same pattern as the template's task-routing table.

Differences from the template:
- The template treats Slack as a **capability** (an MCP) inside a workspace; Djin **is** the workspace, with Slack as the front door.
- The template has no enforcement layer; OathDriven has hooks.
- The template has no cadence layer; OathDriven runs a Sunday audit.

The template is **not** what the user wants to adopt — Djin already is that template, in production, with three additional layers.

## 7. TypeSafe AI (from docs.typesafe.ai/concepts/use-case-map)

TypeSafe's flagship is **Jev**, a System One model. Three primitives:
- **Choice** — pick one option from a set; returns selected + per-option probability + confidence.
- **Score** — rate against ordered levels; returns score + per-level probability + confidence.
- **Noul** — yes/no probability.

Performance: ~150ms latency, ~100× cheaper than an LLM call, calibrated probabilities. Fits **inside** pipeline steps, not after.

The use-case map lists 17 industry categories (recruiting, lead gen, customer support, e-commerce, advertising, financial crime, etc.) and 10 task shapes (Classification, Detection, Scoring, Routing, Search, Retrieval, Ranking, Verification, ML Feature Extraction, Structured Data Extraction).

Five high-level patterns: AI Automation Software, Real-time applications, AI Map Reduce over Big Data, **Universal Verification**, **Harness Engineering**. The last two are the most relevant for OathDriven.

## 8. Why TypeSafe fits OathDriven

- 16 hard rules + 12 historical failures + a Sunday audit = ideal TypeSafe input. Rules become `Choice` options or `Noul` criteria; failures become negative examples in instructions.
- The **hooks layer** is the highest-leverage entry point: hooks already enforce rules, TypeSafe's `Noul` is a binary rule-check ("breekt dit regel X?"). One wire-up, low risk, immediate signal on whether TypeSafe fits before touching agents.
- `/money` (read-only, approval-flow for writes) is a natural fit for **Universal Verification** before each write.
- The Sunday audit can become a **composite score** over rules + failures + state — one call, ~€0.0001, weekly.
- Agent dispatch (e.g. `/sales`) can use **Intent routing**: `Choice` (pipeline stage), `Score` (ICP-fit), `Noul` (qualified?).

## 9. Open questions (asked, not yet answered)

In priority order:
1. **Which agent gets TypeSafe first** — sales, work, clients, notes, skills, money, or a new one like `/support`? (Sales is the strongest candidate.)
2. **Direct API or MCP wrapper** — TypeSafe has Python and JS SDKs. A wrapper MCP lets Bolt handlers call `jev.ask(...)` with the same logging/retry policy used for ICM today.
3. **Keep ICM as storage, send TypeSafe State as the *shape*** — least disruptive path; Djin itself changes little, only the decisions get smaller/cheaper/calibrated.

Added in this turn:
4. **Should the Sunday audit use a TypeSafe composite score** instead of (or alongside) its current grader?

## 10. Current recommendation

**Start with the hooks layer, not an agent.** Reasons:
- Hooks already enforce 16 hard rules.
- `Noul("breekt dit regel X?")` is the smallest possible TypeSafe wire-up.
- Lowest blast radius: no agent rewritten, no manifest change, no new dependency surface.
- Immediate signal on whether TypeSafe fits OathDriven's voice and latency budget.

Concretely: pick **one** existing hard rule, write one hook that calls TypeSafe Noul before the AI sees the input, keep the existing fallback path so the hook still works when TypeSafe is unreachable. Same shape as the user's current hooks — no new pattern to learn.

If hooks work, the next step is `/money` (Universal Verification on writes), then the Sunday audit (composite score), then `/sales` (Intent routing + ICP scoring).

## 11. Files referenced in this conversation

- `~/Downloads/workspace-blueprint/START-HERE.md` — template teaching doc.
- `~/Downloads/workspace-blueprint/CLAUDE.md` — template Layer 1 example.
- `~/Downloads/workspace-blueprint/CONTEXT.md` — template Layer 2 example.
- `~/Downloads/workspace-blueprint/_examples/02-skill-integration-patterns.md` — confirms Slack = MCP capability, not a silo.
- `~/Downloads/workspace-blueprint/community/CONTEXT.md` — confirms "community doesn't create from scratch; it repurposes" pattern.
- `~/Documents/projects/slack/package.json` — Djin project, name `djin`, Bolt 4.4 + tsx.
- `~/Documents/projects/slack/slack-app-manifest.yaml` — full feature set.
- `~/Documents/projects/slack/slack-app-manifest.org.yaml` — org-deploy variant.
- `~/Documents/projects/slack/slack-app-manifest.free.yaml` — free-tier variant.
- `~/Documents/projects/slack/src/icm.ts` + `~/Documents/projects/slack/ICM/` — current state layer.
- `~/Documents/projects/slack/agents/{sales,work,notes}/` — per-agent silos.
- `https://docs.typesafe.ai/concepts/use-case-map` — TypeSafe use-case reference.

## 12. What "the user wants to run their business on this" means in practice

Not "adopt the template." Djin already is the template, in production, with three extra layers (state, hooks, cadence). The intent is **adding TypeSafe as the thin decision layer underneath Djin**, starting with hooks. The metric of success is the same as the user's existing habits: fewer manual interventions, rules that hold on the days the AI forgets them, an audit that grades the folder without the user remembering to grade it.
