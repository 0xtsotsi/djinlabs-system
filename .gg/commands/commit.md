---
name: commit
description: Run checks, agent code review, commit with AI message, and push
---

1. Run quality checks:
   No lint/typecheck commands are configured for this project (no package.json,
   pyproject.toml, go.mod, or Cargo.toml at the repo root). Replace this block
   with the project's actual commands when a stack is added — e.g.
   `pnpm lint && pnpm typecheck`, `uv run ruff check . && uv run mypy .`,
   `go vet ./... && gofmt -l .`, or `cargo fmt --check && cargo clippy -- -D warnings`.
   Fix ALL errors before continuing. Use auto-fix commands where available.

2. Review changes: run `git status`, `git diff --staged`, and `git diff`.

3. Fast review gate: spawn ONE subagent with the full diff. Review ONLY the diff for real bugs, regressions, leftover debug code, and unintended changes. Score each issue 0-100 confidence (pre-existing issues and stylistic nitpicks = false positives, score low). Report ONLY issues with confidence >= 80, with file:line and a one-line fix. If none, reply "CLEAR". This is a last check, not a deep audit — be fast.

4. If CLEAR: proceed to step 5 and push WITHOUT asking. If issues >= 80 reported: STOP, show the issues, then ask via `ask_user` — one `choice` question (`id: "land"`, "Want me to fix this first, or commit and push anyway?") with: "Fix it first, then commit & push" (recommended, hint: keeps the branch green); "Commit & push anyway" (hint: issue stays open). The card is the ONLY ask. On fix-first: fix, re-run step 1, then continue (no re-review). Otherwise continue as-is. Only if `ask_user` is unavailable, ask the same two options in prose.

5. Stage relevant files with `git add` (specific files, not `-A`).

6. Generate a commit message: start with a verb (Add/Update/Fix/Remove/Refactor), specific and concise, one line preferred.

7. Commit AND push in one go — never pause for confirmation here:
   `git commit -m "your generated message"` then `git push`.
