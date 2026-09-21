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

## Routing

| Task | Where | Read |
|---|---|---|
| DjinLabs template work | `/djinlabs/` | `AGENTS.md` + `start.md` + `state.md` |
| Webrnds klantreis | `/webrnds/` | `AGENTS.md` + `start.md` + `state.md` |
| Canonieke bronnen (hard-rules, ICM) | `/_shared/` | the file itself |
| Beslissingen-log | `/decisions.md` | — |
| Onderzoek + audits | `/research/` | — |

For deeper agent-behavior rules (ICM-discipline, run artifacts, umbrella
structure), see the sub-routers in `/djinlabs/AGENTS.md` and `/webrnds/AGENTS.md`.