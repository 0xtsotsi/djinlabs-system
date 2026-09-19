# Naming conventions

Consistent over alle ondernemingen. Past bij U4 (top-file-only-routes) — naam-conventie laat een agent vinden zonder database.

## Klant-slugs

`lowercase-hyphenated-bedrijfsnaam`. Geen spaties, geen hoofdletters, geen underscores.

Voorbeelden (Webrnds): `youri-van-koppen-golf`, `golfly`, `opairly`.

Privacy: geen PII in de slug. Klantnaam mag, persoonsnamen niet (tenzij bedrijfsnaam).

## Klantreis-IDs

`<id>` is een stable identifier die de user kiest bij aanmaken. Formaat vrij (datum-prefix, volgnummer, of een mnemonische naam) — niet meer wijzigen na aanmaken, anders raken referenties in agents en dossiers zoek.

## Datestamps

- `YYYY-MM-DD` voor log-files (per-run artifacts, incident-logs).
- `YYYY-MM` voor monthly aggregates (Groei Pro-rapporten).
- Volgorde in folder-naam: datum-prefix wint (lexicografisch = chronologisch).

## Status in frontmatter

Elk per-run artifact (agent-output, deliverable, log-entry) heeft YAML-frontmatter met minimaal:

```yaml
---
review_status: pending | reviewed
created: YYYY-MM-DD
reviewer: <naam of agent-id>
reviewed: YYYY-MM-DD  # alleen indien reviewed
---
```

`pending` = artifact bestaat, wacht op user-go. `reviewed` = user heeft het artifact gevalideerd. De volgende fase leest alleen `reviewed` artifacts.

## Verboden patronen

- ❌ `Final`, `Final Final`, `FINAL_USE_THIS`, `Old`, `New`, `Untitled` → anti-pattern-detectie in Sunday-audit.
- ❌ `Misc`, `Stuff`, `Random`, `To Sort`, `Do Not Delete` → U1 zegt dat elke folder een job heeft; deze namen verbergen dat.
- ❌ spaties in file-namen → vervang door `-`.
- ❌ uppercase-acroniemen in folder-namen → vouw uit (`AGENTS.md` blijft, dat is canoniek; `RND` wordt `r-and-d`).
- ❌ nesting > 3 zonder `CONTEXT.md` op elk niveau.
