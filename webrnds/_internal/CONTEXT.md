# /webrnds/_internal/ — Webrnds-spec R&D + leer-artefacten

Factory-zijde van Webrnds. Hier wonen de dingen die Webrnds _heeft_ (kennis, patronen, leer-artefacten), niet de dingen die Webrnds _doet_ voor klanten — die zitten in `clients/`.

## Wat hier woont

- `r-and-d/` — engineer-uren voor Webrnds-projecten, infra-beslissingen, kosten-tracking. Pointer naar de R&D-pot die door Webrnds' facturatie wordt gevoed.
- `leer-artefacten/` — Sunday-audit-uitkomsten, retros, lessons-learned. Past bij U8 (failures-as-negative-examples).

## Wat hier NIET hoort (Ronde 8/Q8.3, keuze (b))

- ❌ Geen **experimenten** hier — die horen in `/djinlabs/_internal/experimenten/`. Reden: Webrnds is de uitvoerende onderneming; experimenten zijn template-werk en horen bij DjinLabs.
- ❌ Geen klant-data → `clients/`.
- ❌ Geen klant-PII (U3).

## Discipline

- Elke sub-folder krijgt zijn eigen `CONTEXT.md` voordat er inhoud in komt.
- Leer-artefacten dragen `artefact_id` in frontmatter (bv. `LA-2026-09-19-sunday-audit-1`).
- R&D-entries dragen `uren` + `doel` + `resultaat` in frontmatter.
