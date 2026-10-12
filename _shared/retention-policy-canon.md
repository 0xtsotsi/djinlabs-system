# Retention Policy — canon

> **Doel.** Abstracte definitie van de drie retention-classes en hun conflict-resolutie. Deze file is de **bron van waarheid** voor de hiërarchie; specifieke toepassingen (handovers, audit-output, archives) leven in hun eigen domein-file en cross-referencen hier.
>
> **Cross-reference.** `jev-policy-canon.md` past deze klassen toe op `/_shared/handovers/`.

## Vocabulary

| Class | Definitie (canoniek) |
|---|---|
| `fiscaal` | Wettelijk of contractueel verplichte bewaring. Geld-staat, factuur-data, BTW-aangiften, salaris-output. Termijn wordt door extern regime opgelegd, niet door deze canon. |
| `canoniek` | Bewaring van canon-beslissingen, agent-runs, capability-regime writes — alles wat nodig is om de werking van een instance of agent later te reconstrueren. Termijn = permanent in version-control. |
| `operationeel` | Kort-cyclische operaties: drafts, sessie-logs, scratch-state. Termijn = kort; opruiming is toegestaan zonder tussenkomst, mits dat in de file-life-cycle-policy van het domein staat. |

**Status van een file.** Elke file heeft precies één class. Geen file is klasse-loos. Een file zonder `retention`-veld in frontmatter is **canoniek onvolledig** — niet canoniek per definitie.

## Hiërarchie bij twijfel

Bij twijfel tussen twee classes wint `fiscaal` boven `canoniek` boven `operationeel` (van streng naar soepel).

**Toepassing.** Deze hiërarchie is **abstract** — ze geldt voor elk domein dat retention gebruikt. Concrete toepassingen worden per domein-can-file vastgelegd. De hiërarchie zelf verandert niet als een domein een nieuwe toepassing krijgt.

## Default-termijnen

Defaults zijn **parameters**, geen canonieke waarden. Een domein kan zijn eigen default kiezen, mits het binnen de hierarchie past. Twee denkrichtingen als referentie (niet canoniek):

| Class | Denkrichting default |
|---|---|
| `fiscaal` | 7 jaar |
| `canoniek` | permanent in git; runtime-buffered tot git-sync |
| `operationeel` | 30 dagen |

## Override-mechanisme

Een file kan de default overrulen via een **expliciet** frontmatter-veld `retention` met expliciete termijn. **Expliciet** betekent: een getal of een canonieke term (`permanent`, `until-promoted`, `git-history-only`), niet een vrije slagzin. Vrije tekst in `retention` is canoniek onvolledig.

## Wat NIET canon is in deze file

- Concrete termijnen per domein (implementatie-detail per file-life-cycle-policy).
- Opruim-mechanisme of cron-config (implementatie).
- Specifieke files die welke class krijgen (per-domein-cross-reference, niet hier).

## Cross-references

- `jev-policy-canon.md` — past deze klassen toe op `/_shared/handovers/` (eerste concrete toepassing).
- Domein-files die retention gebruiken — verwijzen naar deze file voor definitie, niet voor specifieke toepassing.