# Changelog

All notable changes to Universal Hub will live here. Newest first.

## 2026-04-20 — Redesign + dynamic manifest

### Added
- Full site redesign with six sections (Home, Lite, Showcase, Supported Games, Legacy, Support) plus a live Changelog page.
- `manifest.json` on the `main` branch — single source of truth for the Home and Lite loadstrings, versions, and updated dates.
- Dynamic fetch on the site: loadstring URL, version number, and last-updated date are all read from `manifest.json` at runtime. No site edits needed per script update.
- Live status dots in the nav — pings the `main` and `lite` branches and lights green when a Lua payload is present.
- Showcase video embedded from YouTube (`PYe13INIE2Q`).
- Roblox game thumbnails pulled live from the public thumbnail API (roproxy mirror) for the Supported Games list.

### Changed
- Deployed site on the `web` branch replaced: old Vite bundle swapped out for the new prototype.
- Typography: Instrument Serif for display, Plus Jakarta Sans for body, Geist Mono for code.
- Accent palette moved from saturated violet to a warm amber/red-orange gradient; cream-on-dark solid pills.

### Removed
- Old `web`-branch files (`index.html`, `Logo.png`, `Logo2.png`, `assets/`).
- Obsolete `version.lua` string parser on the site (superseded by `manifest.json`).
