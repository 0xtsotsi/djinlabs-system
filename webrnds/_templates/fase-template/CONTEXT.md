# <fase-naam> — <één-zinnig-job>

All paths below are relative to the klantreis root. Resolve `<reis-id>` using the convention in the klant's `start.md` before reading or writing.

## Inputs

- Working, this instance: `<exact path>` — <wat het bevat; producer of owner>.
- Reference, reused: `<exact path>` — <rule of format this step follows>.
- Entry condition: <what prior review must be recorded before starting>.
- Missing input behavior: <stop, ask, or record NOT FOUND; explain which>.

## Process

1. <Concrete action on the named input>.
2. <Transformation within this folder's single job>.
3. <Save the output with source references and pending review status>.

## Outputs

- `<exact output path>` — <format and required fields>.

## Human check

<Reviewer> compares <specific result> against <source>. Pass means <observable criterion>. On failure, <correction and rerun behavior>. On pass, record <status field/marker, reviewer and date at an exact path>. The next step reads the corrected output only after that marker exists.

## ICM-discipline

- Per-run artifacts dragen `review_status: pending|reviewed` in YAML-frontmatter.
- Intermediates zijn leesbare, editbare files (geen opaque blobs).
- Intermediate output pas doorgeven aan volgende fase na `review_status: reviewed`.
- Geen cross-klant-context lekken.
