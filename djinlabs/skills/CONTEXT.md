# /djinlabs/skills/ — Djin-agents universeel (scaffold-only)

Hier leven de **scaffolds** voor de Djin-agents die universeel zijn (dus niet klant-spec). Klant-spec wrappers leven in Webrnds (`/webrnds/clients/<slug>/_agents/`) en includen deze scaffolds via `AGENTS.md`-pointer.

## Universele Djin-agents (Ronde 9 + Ronde 10)

- `intake-qualifier/` — beoordeelt of een prospect een echte kandidaat is.
- `strategist/` — zet een "ja" om in scope + fasering + prijs-band.
- `retainer-coordinator/` — bewaakt uptime, change-requests, walkthroughs.
- `growth-spotter/` — detecteert SaaS-template-spawn-momenten en Groei Pro-uitbreidingen.

## SKILL.md-formaat (canoniek)

Elke agent-folder bevat één `SKILL.md` met:

```markdown
---
name: <agent-naam>
description: <één zin wat hij doet>
when_to_use: <trigger + context>
inputs: <wat hij verwacht te lezen>
outputs: <exact pad + format>
verbods: <wat hij niet mag>
example_output: <kort voorbeeld>
---

# <agent-naam>

<lange beschrijving van doel + werking>
```

## Inheritance (Ronde 10/Q10.1)

Klant-spec wrappers in Webrnds includeren deze scaffold via:

```markdown
---
includes: /djinlabs/skills/<naam>/SKILL.md
overrides:
  - <parameter>: <klant-spec waarde>
---
```

Zonder `overrides`-sectie gedraagt de wrapper zich identiek aan de scaffold.
