# /webrnds/skills/ — klant-spec wrapper-templates

Hier leven de **klant-spec wrappers** voor de Djin-agents universeel. Een wrapper is een dunne laag die de scaffold uit `/djinlabs/skills/<naam>/SKILL.md` includeert en klant-spec parameters of uitzonderingen toevoegt (Ronde 10/Q10.1 inheritance).

## Wrappers per fase

- `intake-wrapper/` — includeert `/djinlabs/skills/intake-qualifier/`, voegt klant-spec ICP-fit-criteria toe.
- `strategie-wrapper/` — includeert `/djinlabs/skills/strategist/`, voegt klant-spec scope-sjablonen toe.
- `ontwerp-wrapper/` — pure Webrnds-spec (klant-spec per definitie; geen Djin-scaffold nodig).
- `bouw-wrapper/` — pure Webrnds-spec (template-keuze uit `05-produce/`).
- `support-wrapper/` — includeert `/djinlabs/skills/retainer-coordinator/`, voegt klant-spec SLA toe.
- `growth-wrapper/` — includeert `/djinlabs/skills/growth-spotter/`, voegt klant-spec Groei Pro-criteria toe.

## SKILL.md-formaat voor wrappers

```markdown
---
name: <wrapper-naam>
description: <één zin wat hij doet>
includes: /djinlabs/skills/<scaffold>/SKILL.md
overrides:
  <parameter>: <klant-spec waarde>
when_to_use: <trigger + context>
---

# <wrapper-naam>

Eerste regel: "Inherit from `<includes>`." Dan de overrides uitwerken.
```

## Wat hier NIET zit

- De scaffolds zelf → `/djinlabs/skills/`.
- Klant-spec instanties → `clients/<slug>/_agents/` (kopie van de wrapper met klant-spec invulling).
- Per-run artifacts → in de relevante fase-folder.
