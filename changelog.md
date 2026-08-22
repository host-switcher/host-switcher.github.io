---
layout: page
title: Changelog
subtitle: What each released version of HostSwitcher gave you, newest first.
description: >-
  Every released version of the second-generation HostSwitcher and what it changed for the person
  using it, from the first tagged build on 21 August 2026 onward.
permalink: /changelog/
---

Each entry says what a person gained, not what was refactored. Where a version gained nothing
visible, it says that too: a gap in a list of versions reads as a mistake.

The product's repository is private for now, so a release has no public notes page to link to. The
**Download** button at the top of the site always fetches the newest build.

## v0.2.2 — 22 August 2026
{: .release }

- Nothing changed in the product. The package was rebuilt so that installed copies could fetch the
  update.

## v0.2.1 — 22 August 2026
{: .release }

- **It updates itself.** Once a day the app checks whether a newer version exists and can install it
  from the settings — fetched from this site, because the repository is private and its releases
  cannot be reached anonymously. The check carries nothing about you or your sets, and a switch stops
  the app going out on its own.

## v0.2.0 — 21 August 2026
{: .release }

- **The first build of the second generation.** A native manager of `/etc/hosts`, rewritten in Rust
  — the menu bar panel, named sets in a file of your own, the editor, atomic writes with backups and
  an untouchable snapshot, and the privileged helper. Made by pushing a tag, which builds, signs and
  packages it.
