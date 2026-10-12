---
type: competitive-brief
subject: Codavo (codavo.nl)
relationship: directe concurrent van Webrnds
reference_client: Gevel Helden — eerste Webrnds-klant, in ~/Documents/projects/gevelhelden/
framing: Codavo wordt op eigen merken vergeleken. Gevel Helden is "extra context" om te tonen wat de Webrnds-template vandaag oplevert — NIET het onderwerp van de vergelijking.
date: 2026-10-10
status: eerste invulronde (secties 1-9 gevuld, open punten in §10)
researcher: COS
last_updated_by: COS, 2026-10-10 (na framing-correctie Commander)
---

# Codavo — concurrentie-brief

> **Commander's originele framing** (uit eerdere versie van deze file, verbatim bewaard):
> *"Codavo is een directe NL concurrent van Webrnds (eerste klant = Gevel Helden)."*
> *"Codavo levert: 1) complete bedrijfssites met motion-rich elementen, 2) doorlopende SEO + SEA + content, 3) leadgeneratie via formulieren + chat."*
> *"Webrnds levert: ... [TBD]"*

---

## 1. Wie is Codavo?

**Codavo B.V.** — KvK 90229808, gevestigd Jan Ligthartstraat 3, 3083 AM Rotterdam. Eerste blogpost op de site dateert van vóór 14 februari 2023.

**Type bedrijf**: full-service **web/online-marketing bureau**. Geen gevel-werk bedrijf — Codavo's site presenteert zich als agency die websites + doorlopende online marketing levert aan MKB. (De gevel-werk-tekst die op de homepage verschijnt is een showcase-klant, niet Codavo's eigen dienst.)

**Hoofdpropositie**:
- "Webdesign dat werkt voor jouw bedrijf"
- "Websites die klanten opleveren" — focus op meetbaar resultaat, niet op esthetiek

**Doelgroep**: MKB in regio Rotterdam/Zuid-Holland, maar ook landelijk. Showcase-branches op de homepage: hotel, schoonmaak, loodgieter, schilder, **gevelrenovatie** (showcase-klant), en andere.

**Stack** (afgeleid uit robots.txt + paginabezoek):
- **WordPress CMS** — `/wp-json/` en `/wp-admin/` disallowed in robots.txt (klassiek WP-signaal)
- Yotpo voor review-verzameling
- Trustoo integratie (reviews-scherm op homepage toont Trustoo-reviews)
- Hosting: WP-typical (geen custom headers ontdekt)

**Online presence**:
- Blog actief sinds feb 2023, posts in mei 2023, april 2023, feb 2023 — **frequentie laag (~3 posts/jaar of minder)**, niet wekelijks bijgehouden
- Trustoo reviews: **4.9/5, "42 reviews"** geciteerd (niet live geverifieerd)
- Vacatures-pagina aanwezig — groei-end of filling-moeite? Niet duidelijk zonder vacature-content
- Sitemap.xml **LEEG** (0 URLs in `<urlset>`) — ongebruikelijk voor een WP-site met content; mogelijk security-plugin blokkeert, of jonge site, of SEO-plugin uit

## 2. Wat bieden zij?

**Hoofdcategorieën** (uit homepage-nav + sectie "Onze Diensten"):
1. **Webdesign** — complete bedrijfssites (basisaanbod)
2. **SEO** — doorlopende zoekmachine-optimalisatie
3. **SEA** — betaalde advertenties (Google Ads)
4. **Content** — blogs, teksten, foto/video
5. **Leadgeneratie** — formulieren + chat-integratie
6. **Diensten op maat** — alle branches

**Pricing-model** (van homepage + /diensten):
- **3 pakketten**: Starter, Business, Premium (features verschillen per pakket, exacte prijzen op /tarieven — **niet opgehaald in deze ronde**)
- Eenmalig tarief voor site-bouw
- Doorlopende contracten voor SEO/SEA/content (typisch NL bureau-model)

**Proces** ("Onze Werkwijze", 5 stappen):
1. Kennismaking (intake + doelen)
2. Strategie & Wireframing (sitemap + structuur)
3. Design (visueel ontwerp)
4. Ontwikkeling (bouw)
5. Lancering & Nazorg (live + onderhoud)

**Branches** (sectoren die Codavo expliciet bedient): hotel, schoonmaak, loodgieter, schilder, **gevelrenovatie (showcase)**, en "alle branches op maat".

## 3. Hoe presenteren zij zich?

**Positionering**:
- "Webdesign dat werkt voor jouw bedrijf" — resultaatgericht
- "Geen mooie praatjes, maar websites die klanten opleveren" — anti-esthetisch agency-speak
- "Geen verkooppraat" + "transparant" + "persoonlijk" — return-to-craft narrative
- "Klein team = persoonlijke aandacht" — boutique-positionering

**Visuele stijl** (uit web_fetch — text-only):
- Klassiek agency-template: hero → diensten-grid → werkwijze → tarieven → branches → reviews → blog → CTA
- Veel sectieblokken, klassiek scroll-pattern
- Conversie-elementen: telefoonnummer prominent, "Offerte aanvragen" knop herhaald, Trustoo-reviews als bewijs

**Copy-toon**: direct, MKB-vriendelijk, resultaat- en prijs-bewust. Geen jargon. Geen "digital transformation" praat. Anti-Esthetisch self-positioning.

**Trust-elementen**:
- 4.9/5 Trustoo reviews
- "50+ bedrijven" claim
- Testimonials van bestaande klanten (incl. namen + regio)
- Branchevermeld "gevelrenovatie" prominent op homepage (showcase-klant)

## 4. Onze equivalent (Gevel Helden) — wat hebben we?

Gevel Helden is Webrnds' eerste klant, een gevel-werk bedrijf in Zuid-Holland (Rotterdam-Den Haag). De repo (`~/Documents/projects/gevelhelden/`) is het bewijs van wat de Webrnds-template vandaag oplevert. **Niet het onderwerp van de vergelijking met Codavo**, maar wel het zichtbare bewijs van Webrnds' capability.

**Tech-stack** (uit de repo):
- **Static HTML** op root-niveau (geen CMS, geen framework)
- 9 hoofdpagina's + 5 diensten-subpagina's = 14 unieke HTML-bestanden
- Vite + React + TS subproject (`web/`) bouwt de **coss** JS-bundle
- `wire.mjs` (custom Node script) injecteert coss in elke HTML, vervangt `<header class="nav">` en formulieren door mount-divs
- `serve.mjs` — 75 regels Node static server op 127.0.0.1:8765, geen deps
- `skills-lock.json` — pinned coss skill, versie 1, hash vastgelegd
- `relume-prompt.md` — 14-page AI-sitemap-prompt, compacte vorm (~4400 chars)
- `plan.json` — 7-slide carousel-plan voor social ads

**Inhoud & merk**:
- Volledige 5-discipline gevel-werk site (renovatie, metselwerk, voegwerk, betonreparatie, reiniging) — matcht Codavo's showcase-gevel-werk niche
- Brand: Gevel Helden (yellow #f7bd03, brown #845c02, type: Big Shoulders / Archivo / Martian Mono)
- Regio: Zuid-Holland, focus Rotterdam-Den Haag
- Telefoon: 06-21180071
- SEO-titel: "Gevelhelden — Sterk in gevel | Gevelwerk Zuid-Holland"

**Motion-elementen** (onderscheidend):
- `.carousel/` — actief motion-design project (7-13 okt, 7.7KB STYLES.html, venv-symlink naar /tmp/carousel-proefrit/.venv)
- `ad-social-v1/` — 14 snapshots, 3 renders voor social ads
- coss-bundle wired door wire.mjs in elke HTML-page

**Template-discipline** (uit de Webrnds venture repo):
- **6-fasen pipeline**: 01-research, 02-offer, 03-market, 04-close, 05-produce, 06-na-livegang
- Per-klant: `clients/<slug>/start.md`, `state.md`, `_rules.local.md`, `_agents/`, `klantreis-<id>/`
- `_rules.local.md` + `_templates/` — instance-cap autoriteit
- `.gg/` — GG workflow intern (commands, plans, skills, screenshots, uploads, agents)

**Kort-door-de-bocht Webrnds-shape**:
- Static + JS-bundle (lijnrecht tegenover Codavo's WordPress)
- AI-sitemap via Relume-prompt (geen menselijke wireframe-sessie zoals Codavo's stap 2)
- Motion/carousel ingebakken in de template
- 1-folder template (clients/<slug>/...) — intern proces-discipline wat Codavo niet laat zien

## 5. Wat missen wij? (gap analysis)

Gap ten opzichte van Codavo's publieke propositie:

| Onderwerp | Codavo | Webrnds | Status |
|---|---|---|---|
| Pricing tiers | 3 pakketten publiek | Geen publiek pricing | **GAP** — geen transparantie |
| Werkwijze | 5 stappen publiek | 6-fasen pipeline intern | **GAP** — intern proces is niet marketing |
| Blog | 3+ jaar actief, ~3 posts/jaar | /blog.html bestaat in Gevel Helden, **onduidelijk of gevuld** | **GAP** — content-cadans |
| Reviews | Trustoo 4.9/5, 42 reviews | Geen review-platform zichtbaar | **GAP** — sociaal bewijs |
| Doorlopende diensten | SEO + SEA + content contracten | Alleen site-bouw zichtbaar | **GAP** — geen retention-aanbod |
| Multi-sector | "Elke branche" claim, 6+ showcases | Showcase = gevel-werk (1) | **POSITIONERINGSKEUZE** — focus of breedte? |
| Tech-transparantie | WordPress (impliciet via robots.txt) | Static + Vite + coss | **EDGE** — lichter, sneller, AI-vriendelijker |
| Motion/AI-sitemap | Niet zichtbaar | Relume-prompt + coss-bundle + carousel | **EDGE** — onderscheidend |

**Gap-samenvatting**: Webrnds is **technisch en motion-wise verder** dan Codavo, maar mist de **marketing-/verkoop-laag** die Codavo wel heeft: transparante pricing, publiek werkwijze-verhaal, blog-cadans, review-platform, retention-aanbod.

## 6. Concurrentie-analyse

**Codavo's sterktes** (die Webrnds niet 1-op-1 kan kopiëren):
- 3+ jaar blog-SEO en review-platform-investering (compound effect, niet in 1 sprint in te halen)
- "Volwassen bureau"-uitstraling (Trustoo, vacatures, vaste proces-stappen) — vertrouwen-wekkend bij MKB
- Multi-sector portfolio — kunnen lead-magnet zijn voor niches waar Webrnds nog niet is
- Retention-contracten (SEO/SEA) — voorspelbare MRR na oplevering

**Codavo's zwaktes** (die Webrnds kan uitbuiten):
- **WordPress = zwaar**, traag, lastig te onderhouden, custom-template-fragiel
- **Geen motion-first** aanpak — content is statisch met scroll-effecten
- **Geen AI-sitemap** — handmatige wireframing in stap 2
- **Geen portfolio van eigen "we build motion-sites"** — claim is generiek
- Lege sitemap.xml — mogelijk SEO-zwakte (security-plugin of jonge site)

**Webrnds' sterktes** (onderscheidend voor pitch):
- **Motion-first**: carousel + coss-bundle is een echte portfolio-piece, niet "we kunnen ook animations"
- **AI-sitemap**: Relume-prompt = 14 pagina's in seconden i.p.v. menselijke wireframe-sessie
- **Static + JS-bundle**: lichter dan WordPress, sneller laad, makkelijker te hosten (geen DB, geen plugin-onderhoud)
- **1-folder template**: schaalbaar naar meerdere klanten zonder "iedere klant = 6 weken werk"-vertraging
- **GG workflow** (`.gg/`): interne samenwerking tooling die geen WordPress-implementatie nodig heeft

**Webrnds' zwaktes** (tegen Codavo gepitcht):
- Geen pricing = geen self-service lead-qualificatie (alles via intake)
- Geen review-platform = geen sociaal bewijs bij eerste indruk
- Geen blog = geen SEO-leadflow
- Geen doorlopende diensten = geen MRR na oplevering (alleen eenmalig project)
- Single-sector (gevel-werk) = smaller addressable market in jaar 1

## 7. Implicaties voor de Webrnds template

**1. Publieke "wat doen we"-laag** toevoegen aan de Webrnds-template:
- `/_public/proces.md` of equivalent — 5-stap werkwijze in MKB-vriendelijke taal (naast de interne 6-fasen pipeline)
- `/_public/tarieven.md` — 3 pakketten, of "op maat na intake" + telefoonnummer
- `/_public/reviews.md` of Trustoo-equivalent integratie
- Per klant een `/blog/index.html` discipline (of een Gevel-Helden-equivalent /blog.html dat ook echt gevuld wordt)

**2. "Motion-first" als publieke propositie**:
- Showcase-stuk: coss-bundle in actie + carousel-engine apart op portfolio-pagina
- Pitch-zin: *"Wij bouwen motion-rijke sites met een AI-sitemap. Niet 6 weken wireframen — 14 pagina's in een middag."*

**3. Retention-aanbod** (gap 4):
- Na oplevering: maandelijks onderhoud + content-update + SEO-lite
- Pitch: *"Site live is geen eindpunt, dat is het begin"*

**4. Review-platform kiezen** (gap 3):
- Trustoo (NL MKB), Klantenvertellen, of GitHub-style testimonials-pagina
- Per klant: 1 review-pagina met embedded reviews + 5-sterren CTA

**5. Gevel Helden als showcase-klant**:
- De repo IS al het bewijs. Wat ontbreekt: een **publieke case-study-pagina** met screenshots + motion-demo + outcome-cijfers
- Idee: `webrnds/_public/cases/gevelhelden.md` (of in Notion als projecthub-uitbreiding)

**6. AI-sitemap als signature-feature**:
- Relume-prompt mag prominenter. Niet "we gebruiken Relume" — wel: *"14 pagina's in seconden. Jij reviewt. Wij bouwen."*

**7. Stack-keuze expliciet maken in pitch**:
- "Geen WordPress, geen plugins die kapot gaan bij elke update"
- "Static + JS-bundle = page-speed 95+, geen database, geen security-patches"

## 8. Aanbevelingen

### Korte termijn (1-2 weken, parallel aan W-01 validatie)

1. **Publieke tarief-pagina** op de Webrnds-template (3 pakketten of "na intake"). Forceert Webrnds om eigen pricing-theorie te expliciteren — anders kan het niet tegen Codavo's transparantie op.
2. **Showcase-casus Gevel Helden** schrijven: 1 pagina met (a) start-punt, (b) wat we leveren, (c) wat het opleverde, (d) motion-demo. Dit is Webrnds' eerste portfolio-stuk en moet vóór de tweede klant af zijn.
3. **Webrnds' eigen site** (in de djinlabs mono-repo of als `webrnds-website`): 5-stap werkwijze + 3 pakketten + 1 showcase (Gevel Helden) + blog-placeholder. Zelfde template-discipline als klanten.

### Middellange termijn (1-3 maanden)

4. **Blog-discipline** starten op Gevel Helden: 1-2 posts/maand over gevel-werk (kennisbank — niet agency-praat). Eerste 6 posts in pipeline.
5. **Retention-aanbod** ontwerpen: SEO-lite + content-update + hosting + monitoring. Pitch-pagina + pricing.
6. **Review-platform kiezen en integreren** — Trustoo is meest logisch voor NL MKB.

### Lange termijn (3+ maanden)

7. **Multi-sector uitbreiding** overwegen — alleen als de template bewezen schaalbaar is. Eerste target niches: naast gevel-werk: schilder, loodgieter, schoonmaak (zelfde MKB-patroon, dezelfde B2B-zoekintentie).
8. **GG workflow als publiek verkoopargument** — toon hoe interne discipline de klant-snelheid verhoogt (kostenplaatje, doorlooptijd-cijfers).

### Anti-aanbevelingen (niet doen)

- ❌ Probeer niet Codavo's hele agency-model te kopiëren (SEO/SEA/content/chat). Dat is een andere bedrijfscategorie — Webrnds wordt dan een nummer-2-Codavo.
- ❌ WordPress adopteren "omdat de klant dat wil" — ondermijnt het motion-first en AI-sitemap verhaal, en laat de tech-edge verdwijnen.
- ❌ Blog forceren zonder dat er iemand eigenaar is van het schrijven — lege blogs zijn erger dan geen blog.
- ❌ Multi-sector proberen voordat de template bewezen is in 1 sector — schaal werkt pas als de discipline staat.

## 9. Bronnen

### Codavo (live site, 2026-10-10 opgehaald)

- `https://codavo.nl/` — homepage (volledig gelezen, alle secties)
- `https://codavo.nl/diensten/` — diensten-pagina (volledig gelezen)
- `https://codavo.nl/sitemap.xml` — leeg (0 URLs in `<urlset>` — ongebruikelijk voor WP)
- `https://codavo.nl/robots.txt` — bevestigt WordPress-stack (`Disallow: /wp-json/`, `Disallow: /wp-admin/`)
- **Niet opgehaald in deze ronde**: /tarieven, /over-ons, /contact, /reviews, /blog/[posts], /vacatures, /seo, /sea, /webdesign, /werkwijze

### Webrnds showcase (Gevel Helden, "extra context")

- `~/Documents/projects/gevelhelden/` — Gevel Helden repo (static site + motion-engine + carousel-project + ad-carousel)
  - `wire.mjs` — coss-bundle injection script
  - `serve.mjs` — 75-regel static server op 127.0.0.1:8765
  - `skills-lock.json` — pinned coss v1
  - `relume-prompt.md` — 14-page AI sitemap
  - `plan.json` — 7-slide carousel-plan
  - 9 root-HTML + 5 diensten-sub = 14 unieke pagina's
- Brand: yellow #f7bd03, brown #845c02, type Big Shoulders/Archivo/Martian Mono
- Regio: Zuid-Holland (Rotterdam-Den Haag), tel 06-21180071

### Webrnds venture (pipeline + template)

- `/Users/gogetta/Documents/djinlabs_system_design/webrnds/` — Webrnds venture repo
  - 6-fasen klantreis-pipeline: 01-research, 02-offer, 03-market, 04-close, 05-produce, 06-na-livegang
  - `AGENTS.md` — venture-wide instructies
  - `_templates/`, `_rules.local.md` — instance-cap autoriteit
  - `.gg/` — GG workflow intern
  - `clients/`, `skills/`

### Notion

- "Gevel Helden - projecthub" (3ea4c5f9-f8e5-81e3-b60e-f87b489922d0) — projecthub, audit/plan/tickets nog leeg

### Commander's eigen framing (uit eerdere versie van deze file, verbatim)

- "Codavo is een directe NL concurrent van Webrnds (eerste klant = Gevel Helden)."
- "Codavo levert: 1) complete bedrijfssites met motion-rich elementen, 2) doorlopende SEO + SEA + content, 3) leadgeneratie via formulieren + chat."
- "Webrnds levert: ... [TBD]" — nu ingevuld in §4 hierboven

---

## 10. Open punten (niet in deze ronde opgelost)

- [ ] `/tarieven` exacte prijzen (3 pakketten, niet opgehaald)
- [ ] `/over-ons` + `/reviews` — missen voor complete team-pitch
- [ ] Trustoo-reviews live verifiëren (4.9/5, 42 reviews claim)
- [ ] Gevel Helden publieke case-study (ontbreekt — korte termijn aanbeveling #2)
- [ ] Webrnds eigen site (wel/niet bestaand?) — korte termijn aanbeveling #3
- [ ] Gevel Helden `/blog.html` of `/blog` — gevuld of leeg? (gap-analyse §5)
- [ ] Concurrenten-mapping naast Codavo: Trustoo zelf, Klantenvertellen, andere NL agencies in dezelfde niche
- [ ] Brand-vergelijking (Codavo huisstijl vs. Gevel Helden huisstijl — alleen kleur/type, niet pixels)
- [ ] Tarief-onderzoek: wat is marktconform voor static+Vite motion-site met AI-sitemap in NL MKB-markt?

---

## Status (alle 9 secties + bronnen + open punten)

- [x] 1. Wie is Codavo?
- [x] 2. Wat bieden zij?
- [x] 3. Hoe presenteren zij zich?
- [x] 4. Onze equivalent (Gevel Helden) — wat hebben we?
- [x] 5. Wat missen wij? (gap analysis)
- [x] 6. Concurrentie-analyse
- [x] 7. Implicaties voor de Webrnds template
- [x] 8. Aanbevelingen
- [x] 9. Bronnen
- [x] 10. Open punten (toegevoegd — was niet in Commander's originele TOC)
