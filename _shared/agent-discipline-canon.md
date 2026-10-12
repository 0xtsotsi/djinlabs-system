# Agent-discipline canon

Canonieke afspraken over hoe je met coding-agents werkt. Universeel, niet per-instance.

## Drie basisregels

1. **Splits samengestelde verzoeken eerst.** Wanneer een verzoek meer dan één zelfstandige opdracht bevat (typisch: samengesteld met "en"), splits hardop in sub-opdrachten en vraag welke subset uitgevoerd wordt. Niet aannemen dat alle sub-opdrachten samengaan — dat is een gemiste kans om te checken of ze botsen.

2. **Vraag bij UI-verzoeken op externe skills.** Wanneer een verzoek gaat over "de UI van X" en X is niet van jou, zijn er drie lezingen: visuele UI-elementen in X, documentatie van de UI-flow, of alleen de workflow zonder UI. Stel de drie opties voor; kies niet zelf.

3. **Documenteer flow-positie van elke bridge.** Wanneer iets toegevoegd wordt parallel aan iets dat al bestaat (zoals een bridge naast een andere bridge), maak eerst de flow-positie expliciet: pre, tijdens, of post? Vervangt het bestaande? Een tijdlijn voor je schrijft, voorkomt dat parallelle bridges zonder tijdsrelatie ontstaan.

## Wanneer niet van toepassing

- Eén-op-één verzoeken ("fix typo", "voeg sectie X toe aan file Y"). De drie regels zijn voor **samengestelde of ambigue** verzoeken.
- Canonieke schrijfacties in een Ronde waar de gebruiker al een sub-keuze heeft gemaakt (zie `decisions.md`).

## Onderhoud

Alleen wijzigen via `decisions.md` (zie `_shared/AGENTS.md` §Onderhoud).
