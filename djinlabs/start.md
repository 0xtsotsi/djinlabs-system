# /djinlabs/ — start

Wat DjinLabs is en waar het naartoe gaat.

> **Architectuur-lock (Ronde 19, 2026-09-28):** DjinLabs is runtime-vrij.
> Geen eigen server, queue, database of dashboard. Agent = folder.
> COS = folder-agent. Eve + Convex horen niet in DjinLabs. Zie
> `decisions.md` (commit c1ebd5b) + mono-repo `AGENTS.md` architecture-lock.

## Ronde 19 status (2026-10-10)

DjinLabs is sinds 28-sep-2026 architectuur-gelocked (commit `c1ebd5b`): runtime-vrij, agent = folder, COS = folder-agent. Lock-completering — WEB-16 audit-spoor row + 6-moties one-liner — staat in `djinlabs/state.md` (sectie *Audit-spoor-lock*). Founder-trekker: Darren via WhatsApp 24-sep 2026, bevestigd 28-sep 09:37; staging in `cos/research/2026-09-28-r19-staging-djinlabs-zonder-runtimes.md` (kanoniek-neutraal). Volgende checkpoint: Ronde 20 of T-04..T-11-resolutie.

## Purpose

DjinLabs is de **interne orchestration layer** voor het 1-folder-template + ICM + Jev decision layer + de universele hard-rules. Het is geen KVK-ingeschreven entiteit (zie `decisions.md` Ronde 3/Q3.1 verduidelijking) — het is een merklaag + een monorepo-workspace + een strategie.

Webrnds is instance #1 van dit template. De tweede instance wordt bewust gecreëerd door de founder, op eigen tempo (Ronde 4/Q4.1).

## Boundaries

- **In scope:** template-onderhoud, agent-scaffolds, R&D-pot-tracking, leer-artefacten, klant-overstijgende experimenten, hard-rules evolutie.
- **Out of scope:** klant-uitvoering (gaat naar `/webrnds/`), facturatie (gaat via Webrnds), externe marketing zonder Webrnds-verbinding.

## Done-definitie

DjinLabs is "af" als:
1. Het template stabiel is en door Webrnds + ≥1 tweede tenant gebruikt wordt zonder ad-hoc patches.
2. De 8 universele U-rules zijn bevestigd door de user.
3. De agent-scaffolds werken via inheritance (scaffold hier, wrapper in Webrnds).
