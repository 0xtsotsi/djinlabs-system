# Competitive Brief — codavo.nl

## Research provenance

| Field | Value |
|---|---|
| source_agent_id | `333fabd4` |
| task_name | `codavo.nl competitive research` |
| agent_name | `researcher` |
| provider / model | `minimax` / `MiniMax-M3` |
| collected_at | 2026-09-19 (Europe/Amsterdam) |
| collected_via | `wait_agent(agent_ids=["333fabd4"], condition="all")` (terminal, `collected: true`) |
| started_at | 2026-09-19T07:11:59Z |
| elapsed_ms | `688 693` (~11m 29s) |
| turn_count | `8` |
| tool_use_count | `51` |
| output_tokens | `6 533` |
| child_session_path | `~/.gg/subagent-sessions/.../2026-09-19T07-11-59-936Z_d0cbe35e.jsonl` |
| persistence | This file is a hand-written durable mirror of the agent's tool output. The agent session is the canonical source; if you need to re-verify any claim, re-spawn `researcher` with the same task or re-derive from the cited URLs. |
| confidence | High for entity/pricing/tech-stack facts (verified across `/privacy`, `/terms`, `/blog/tech-stack`, view-source, EN mirror). Medium for the "weaknesses" framing — these are positioning inferences, not factual claims about Codavo. |

> Purpose: positioning substrate for Webrnds vs Codavo. Not the Webrnds spec — only what Codavo is and where the wedge is.

## TL;DR

Codavo is a **one-person freelance engineering studio** in Rotterdam (trading name "Codavo", legal entity "S. Ligtvoet Eenmanszaak", KVK **42017531**, BTW **NL005438642B47**, registered 19-03-2026 per companyinfo.nl / SBI 62100 — ontwerpen van computerprogrammas) run by **Sjoerd Ligtvoet**, ex-Senior Integration Engineer at Eneco (7 years, API/Kafka). He sells **bespoke Nuxt+Supabase+Cloudflare websites, webapps and integrations** to Dutch MKB, plus a recurring **SEO/AI-visibility retainer ("Groei Pro")**. Real customers include Youri van Koppen Golf, Golfly (€99/m SaaS), Opairly (€10/m SaaS), The Skin Club, Van Maaren (in dev). His own productisation clause: client gets a discounted build, Codavo keeps platform IP, they go on to sell it as a SaaS (Golfly, Opairly).

## Target customer

Dutch **MKB and growing companies** — explicit verticals named on-site: technische organisaties, installatiebedrijven, logistieke dienstverleners, productiebedrijven, SaaS-teams, klinieken (see `website-laten-maken-rotterdam`, `software-voor-installatiebedrijven`). Specifically the **entrepreneur who has outgrown WordPress/Wix but doesn't need an agency**. Buyer signal: budget ≥ €2.5k, prefers "direct with the engineer."

## Offer + pricing (visible, excl. 21% BTW)

| Tier | Price | Notes |
|---|---|---|
| Website | from **€2,500** one-time | hosting from €0/m |
| Automation & Integrations | from **€2,000** | complete workflow €5,000 |
| Custom Software / Platform | from **€5,000** | complete platform €10,000+ |
| MVP | from **€5,000** + €0–20/m hosting | |
| Hourly change work | **€125/h** per 15 min | |
| Onderhoud subscription | **€175/m** | |
| Groei subscription | **€400/m** | |
| **Groei Pro subscription** | **from €1,500/m** | SEO + AI-visibility work executed, not advised |
| AI-scan one-off | **€950** | |

Side-products: **Golfly €99/m**, **Opairly €10/m** — Codavo retains platform IP, client got a build discount (`portfolio/golfly`).

## Tech stack (with evidence)

- **Nuxt 3 / Vue 3 + TypeScript + Tailwind** — view-source shows `<style id="nuxt-ui-colors">` (Nuxt UI), `/_nuxt/entry.TnRgNtoh.css` paths, and a `Nuxt Studio / Nuxt Content` claim for editorial sites.
- **Supabase** (Postgres, Auth, RLS, Storage) — confirmed across `blog/tech-stack`, `portfolio/opairly`, `portfolio/youri-van-koppen`.
- **Cloudflare** hosting + CDN — confirmed via privacy page verwerkers table and Cloudflare-edge URLs.
- **Mollie / Stripe** (iDEAL-led), **Anthropic Claude** for the AI project advisor (`privacy` page), **ElevenLabs** for voice, **Resend** for email, **Plausible Analytics**.
- **Subdomain `app.codavo.nl`** = the Klantportaal Codavo runs on its own product (point-and-click feedback, walkthroughs, uptime, invoices, Groei Pro dashboard).
- `robots.txt`: `@nuxtjs/sitemap v8.3.0`, `ai-train=no`, `ai-train=n` headers.

## Positioning language (Codavo's own words, quoted)

- *"Software that takes recurring work off your hands"* (`/en` H1)
- *"You work directly with me. No layers in between."*
- *"AI-accelerated building: live in weeks, without agency overhead."*
- *"No templates, no standard solutions — but software that does exactly what your business needs"* (`/en/about`)
- *"No account managers, no juniors who 'pick it up'"* (LinkedIn-style snippet on homepage)
- *"Eerlijke belofte: gegarandeerde vermeldingen in AI-antwoorden bestaan niet"* (`ai-zichtbaarheid`)
- Anti-WordPress, anti-Wix, anti-agency — three separate comparison pages (`/vergelijk/templates`, `/vergelijk/agencies`, `/vergelijk`).

## Strengths

1. **Real shipped work**, not stock photos — five public cases with live URLs, including two SaaS spin-offs.
2. **End-to-end service** under one roof: marketing site → intake → payments → portal → dashboards → SEO/AI retainer.
3. **Self-hosted client portal** (`app.codavo.nl`) is dogfooded — every customer gets point-and-click change requests, walkthroughs, uptime, monthly report.
4. **Honest economics** — publicly admits AI-visibility can't be guaranteed; transparent tiered pricing.
5. **"Productisering" clause** is distinctive: client gets a discounted build, Codavo keeps platform IP, they go on to sell it as a SaaS (Golfly, Opairly).

## Weaknesses / blind spots Webrnds can exploit

1. **Single-tenant by definition** — bus factor of 1, no team page, no agency bench. Liability capped at **€10,000 per event** (`terms §14.2`).
2. **No decision/ICM layer under the UI.** Every page sells "scopes + screens + integrations." Nothing about Codavo's stack treats business rules, schemas, or workflows as a first-class, reusable, versioned artifact. A 1-folder company system with a TypeSafe/Jev decision layer sits *under* the presentation, not alongside it.
3. **Service-page templates are near-identical** — same 3-card "what you get", same 18-logo integration grid, same 4-step process on every one of `website-laten-maken-rotterdam`, `dashboard-laten-bouwen`, `klantportaal-laten-bouwen`, `software-voor-installatiebedrijven`, `ai-integraties`, etc. It reads as a personal-brand site, not a platform with compounding assets.
4. **Tooling is the same Nuxt+Supabase+Cloudflare default** the indie-dev market is saturated with. His own admission: *"Dezelfde stack werkt voor alles"* — there is no opinion about *why this shape of architecture* beyond "AI makes me fast."
5. **"You own the code" is partly caveated** (`terms §12.3`) — generic components, frameworks, libraries stay his. Real portability of a Codavo project to another engineer is unproven.
6. **Recurring revenue is services, not product.** Groei Pro is executed SEO work, not software. Golfly/Opairly are side bets, not the core offer.
7. **Pricing is project-shaped, not company-shaped** — every engagement starts with a 30-min call + a quote; nothing "self-serve", no starter template that compounds into a system.
8. **Zero third-party reputation surface** — no Trustpilot, no Clutch, no LinkedIn company page surfaced in search; only one public Google review (Youri's). On-site testimonials are portfolio-flavoured.
9. **Installatiebedrijven / logistiek are generic verticals** — anyone can write that page. The cases that are *specific* (au pair, golf, kliniek) are one-offs, not a domain Codavo owns.
10. **Hours-billed maintenance (€125/h per quarter)** is legacy-agency thinking — incompatible with a "system that compounds" pitch.

## Wedge for Webrnds

Codavo sells **scopes + screens + integrations on a freelance engineer's calendar**. Webrnds can position around three concrete differentials that are *evidence-backed by Codavo's own materials*:

- **System under the UI, not alongside it.** Codavo has no typed decision layer; Webrnds does (ICM folder system + TypeSafe/Jev).
- **Compounding assets, not project files.** Codavo's service pages are 10× near-identical templates; Webrnds' monorepo with workspaces means each new customer makes the next customer cheaper to serve.
- **Bus factor > 1 by structure.** Codavo's liability cap of €10K/event and Terms §7.3 30-day stillstand clause are explicit tells; Webrnds' monorepo + workspace structure + DjinLabs template means continuity survives the founding engineer's availability.

## Sources

- `https://codavo.nl/` (home, NL)
- `https://codavo.nl/en` (home, EN — pricing tiers)
- `https://codavo.nl/about`, `https://codavo.nl/en/about`
- `https://codavo.nl/websites`, `https://codavo.nl/platforms`, `https://codavo.nl/mvp-laten-maken`
- `https://codavo.nl/website-laten-maken-rotterdam`, `https://codavo.nl/webapplicaties-rotterdam`, `https://codavo.nl/webapplicaties`
- `https://codavo.nl/dashboard-laten-bouwen`, `https://codavo.nl/klantportaal-laten-bouwen`, `https://codavo.nl/workflow-automatisering`
- `https://codavo.nl/website-met-api-koppeling`, `https://codavo.nl/ai-integraties`, `https://codavo.nl/ai-zichtbaarheid`
- `https://codavo.nl/software-voor-installatiebedrijven`, `https://codavo.nl/website-onderhoud`
- `https://codavo.nl/portfolio`, `…/youri-van-koppen`, `…/golfly`, `…/opairly`, `…/the-skin-club`, `…/van-maaren`
- `https://codavo.nl/blog`, `…/tech-stack`, `…/opairly-case-study`, `…/saas-mvp-bouwen`, `…/twee-producten-een-niche`
- `https://codavo.nl/vergelijk`, `…/templates`, `…/agencies`
- `https://codavo.nl/faq`, `https://codavo.nl/contact`, `https://codavo.nl/tools/website-kosten-calculator`
- `https://codavo.nl/privacy`, `https://codavo.nl/terms` (entity name, KVK, BTW, liability cap)
- `https://codavo.nl/robots.txt`, `https://codavo.nl/__sitemap__/nl-NL.xml`, `https://app.codavo.nl/groei-pro`
- `https://companyinfo.nl/organisatieprofiel/ontwerpen-van-computerprogrammas/codavo-rotterdam-42017531-000065210115` (SBI62100 / ontwerpen van computerprogrammas, registered 19-03-2026)
