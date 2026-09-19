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
