# AGENTS.md

Guidance for coding agents working in this repository (Codex, Cursor, Copilot, and others).

## Project state

This is a `djinlabs_system_design` repository. No stack manifests have been
committed yet (no `package.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`),
so the project is treated as a static site until one is added.

## Build / test / lint

There are no build, test, or lint commands defined yet.

When a stack is added, document the commands here and update
`.github/workflows/ci.yml` so CI matches. For example:

- Node (pnpm): `pnpm install --frozen-lockfile`, `pnpm run build`, `pnpm test`
- Node (npm): `npm ci`, `npm run build`, `npm test`
- Python (uv): `uv sync`, `uv run pytest`
- Go: `go build ./...`, `go test ./...`
- Rust: `cargo build --locked`, `cargo test --locked`

## CI

CI lives in `.github/workflows/ci.yml` and runs on every push and pull
request to the default branch. Keep it green.

## Hard rules

- Never commit with `--no-verify`. If a hook fails, fix the underlying
  issue rather than bypassing it.
- Do not force-push to the default branch; the ruleset enforces
  non-fast-forward.

## Umbrella router

This repository is structured as an **umbrella workspace** with two ondernemingen (per the DjinLabs × Webrnds template; see `decisions.md` for the cumulative grill-me log). The umbrella router below complements — does not replace — the project-state guidance above.

- `/djinlabs/` — onderneming #1: template-onderhoud. Sub-router: `/djinlabs/AGENTS.md`.
- `/webrnds/` — onderneming #2: klantreis-uitvoering. Sub-router: `/webrnds/AGENTS.md`.
- `/_shared/` — canonieke bronnen gedeeld door beide ondernemingen (hard-rules, naming-conventions, icm-canon).

**ICM-discipline (verplicht):**
- Elke werk-folder (workspace, klantreis, klant, fase) heeft precies één `CONTEXT.md` als contract: inputs/process/outputs/human check.
- Per-run artifacts dragen `review_status: pending|reviewed` in YAML-frontmatter.
- Stable rules in `/_shared/` of `/<instance>/_internal/`; per-run artifacts in de product-folders.
- Root-routers (dit bestand + de twee sub-routers) blijven onder ~60 regels. Diepere inhoud hoort in `CONTEXT.md`-bestanden.

**Routing:**

| Task | Go to | Read |
|------|-------|------|
| Onderhoud aan het DjinLabs-template | `/djinlabs/` | `AGENTS.md` |
| Werk voor een Webrnds-klant | `/webrnds/clients/<slug>/` | `start.md` + de juiste `klantreis-<id>/<fase>/CONTEXT.md` |
| Canonieke bronnen (hard-rules, naming, ICM-canon) | `/_shared/` | de file zelf |
| Vraag over beslissingen-log | `/decisions.md` | — |
