# AGENTS.md

Brief routing for coding agents (Codex, Cursor, Copilot, Claude Code, and others).

## Stack

No `package.json`, `pyproject.toml`, `go.mod`, or `Cargo.toml` is committed.
This project is treated as a **static site** (markdown-only) until a manifest
is added. There are no build, test, or lint commands today.

When a stack is added, document the commands below and update
`.github/workflows/ci.yml` so CI matches.

## Build / test / lint

_Not yet defined._ When added, list the exact commands here.

## CI

CI lives in `.github/workflows/ci.yml` and runs on every push and pull request
to the default branch. **Keep it green.** If CI fails, fix the underlying
issue, do not bypass it.

## Hard rules

- **Never commit with `--no-verify`.** Fix the hook, don't bypass it.
- **Do not force-push to the default branch.** The ruleset enforces
  non-fast-forward.
- Do not add dependency manifests (package.json / pyproject.toml / go.mod /
  Cargo.toml) without updating CI in the same change.

## Architecture lock (Ronde 19, actief sinds 2026-09-28)

DjinLabs hanteert vanaf Ronde 19 een **runtime-vrije architectuur**:

- **Geen runtimes in DjinLabs** — geen eigen server, queue, database,
  dashboard of service. Vercel Eve, Adam/Convex, DjinLabs HQ zijn
  expliciet uit. Uitvoerend werk leeft in Webrnds of extern.
- **Agent = folder** — een agent is een map met platte bestanden
  (`AGENT.md`, `skills/`, `memory/`). Walk-test: verse AI + max 2 reads.
- **COS = folder-agent** — autoriteit = folder-auteur + Jev als gate.
  Geen COS-eigen runtime. Canon: `_shared/cos-architecture-canon.md`.
- **Eve + Convex** = optioneel client-setup-patroon (Webrnds), niet
  DjinLabs-canon. Zie moties in `decisions.md` (Ronde 19, commit c1ebd5b).

## Routing

| Task | Where | Read |
|---|---|---|
| Runtime-truth + één-scherm | `/Context/` | `context.md` (mono-repo) + `map.md` |
| DjinLabs template work | `/djinlabs/` | `AGENTS.md` + `start.md` + `state.md` |
| Webrnds klantreis | `/webrnds/` | `AGENTS.md` + `README.md` + `Context/context.md` + `start.md` + `state.md` |
| Canonieke bronnen (hard-rules, ICM, COS, Jev, sync) | `/_shared/` | the file itself |
| Beslissingen-log (Ronde 1 t/m 19) | `/decisions.md` | — |
| Onderzoek + audits | `/research/` | — |
| Audit-spoor (Ronde 15+ run-artifacts) | `/audit-spoor/` | — |
| COS-frontier (tickets T-01..T-11) | `/djinlabs/_internal/experimenten/cos/` | `CONTEXT.md` + `wayfinder-map.md` |

For deeper agent-behavior rules (ICM-discipline, run artifacts, umbrella
structure), see the sub-routers in `/djinlabs/AGENTS.md` and `/webrnds/AGENTS.md`.