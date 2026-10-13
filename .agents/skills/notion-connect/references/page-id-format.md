# Notion page-id format — referentie voor notion-connect

## Form

Een Notion page-id is een **32-hex-char UUID** met **4 dashes**, in de vorm `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`. Voorbeelden:

- `3e44c5f9-f8e5-81d0-ad77-db30272dc92c` (sync-pagina)
- `3f84c5f9-f8e5-81c0-a516-d35621d83c51` (COS status sub-page)
- `3f84c5f9-f8e5-8194-962e-c35c70eb5676` (GG Coder status sub-page)

## Prefix-relatie

**Prefixen zeggen niets.** Verschillende pagina's kunnen dezelfde eerste 8 hex-chars delen (Notion's UUID-generatie gebruikt geen gegarandeerde namespace-prefix). De sync-pagina-prefix `3e44c5f9` is **anders** dan de sub-page-prefix `3f84c5f9`, maar dat is toeval — niet een regel.

## Page-ids in deze codebase (vastgelegd 2026-10-13)

| Page | Id | Eigenaar | Read-scope? | Write-scope? |
|---|---|---|---|---|
| Sync-pagina "Instinct sync — Hermes - Instinct" (parent: Webrnds) | `3e44c5f9-f8e5-81d0-ad77-db30272dc92c` | Instinct (primaire schrijver) | ✅ auto | ❌ niet voor GG Coder |
| COS status sub-page | `3f84c5f9-f8e5-81c0-a516-d35621d83c51` | COS | ✅ auto | ❌ niet voor GG Coder |
| GG Coder status sub-page | `3f84c5f9-f8e5-8194-962e-c35c70eb5676` | GG Coder | ✅ auto | ✅ GG Coder (enige write-scope) |

## Hoe herken je of een page-id in scope is

Bij elke page-id die in een vraag of opdracht voorkomt:

1. **Staat de id in de tabel hierboven?** Zo ja, lees-scope is `auto`, write-scope volgt uit de eigenaar-kolom.
2. **Staat de id niet in de tabel?** Beschouw 'm als **out-of-scope** voor GG Coder. Lezen is toegestaan mits het past in de bredere read-scope van de skill (zie SKILL.md §Read-scope); schrijven vereist Instinct-go.
3. **Twijfel?** Post een INTENT in de lokale mirror en wacht op Instinct-bevestiging voordat je 'm hard-code in scripts of verdere commando's.

## Veelgemaakte fouten

- ❌ "Het begint met dezelfde prefix dus het is dezelfde namespace." → Onjuist. Zie §Prefix-relatie.
- ❌ "Een sub-page van de sync-pagina erft de sync-pagina-discipline." → Onjuist. Elke sub-page heeft eigen eigenaar en write-discipline.
- ❌ "Page-id zonder dashes is hetzelfde." → Onjuist. Notion API verwacht dashed format.

## Bron

Page-ids hierboven zijn bevestigd door Instinct op 2026-10-13 (briefing DEEL 1) en geverifieerd in de lokale mirror `djinlabs/_internal/experimenten/cos/_internal/staging/instinct-sync-mirror.md` regel 36 (sync-pagina). De sub-page-ids zijn niet in deze repo op disk terug te vinden — ze zijn geverifieerd via de Notion API door Instinct op 2026-10-13.

Bij twijfel: niet gokken, niet "lijkt op"-redeneringen, maar een verse `mcp__notion__notion-fetch` op de page-id en de letterlijke response-titel/-ouder vergelijken met de tabel.
