---
layout: page
title: Changelog
subtitle: What each released version of HostSwitcher gave you, newest first.
description: >-
  Every released version of HostSwitcher and what it changed for the person using it — from the
  first public build on 3 August 2026 onward.
permalink: /changelog/
---

Each entry says what a person gained, not what was refactored. Where a version gained nothing
visible, it says that too: a gap in a list of versions reads as a mistake.

## v0.6.0 — 9 August 2026
{: .release }

- **Every set is on screen at once.** The editor used to show the entries of the *selected* set
  only, so "which of my sets mentions this host" could be answered only by clicking through them
  and remembering. Now every set is a section of one list.
- **Deleting a set or an entry asks first.** There is no undo, so the question is what stands in
  for one.
- Windows can be photographed for design work, and the first pictures found seven layout faults
  in the rewritten editor, all of them fixed here.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.6.0)

## v0.5.1 — 9 August 2026
{: .release }

- **The command line stops alarming about a helper it cannot see clearly.** Reading the state of
  the privileged helper from a terminal reported a problem where there was none.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.5.1)

## v0.5.0 — 9 August 2026
{: .release }

- **The product updates itself.** It fetches the release, checks it, replaces itself and comes back
  at the new version — no browser, no download, no Gatekeeper refusal, no restart of the machine.
- **It can repair its own privileged helper.** A registration can survive the application being
  replaced while the service under it stops being launchable; the system goes on reporting it as
  enabled and nothing is applied. The product notices and offers to rebuild it. No password is
  asked for.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.5.0)

## v0.4.0 — 6 August 2026
{: .release }

- **You can choose the interface language.** English and Ukrainian, following the system unless you
  say otherwise — and the translation is now actually shown, which on a Ukrainian system it was
  not.
- **The command line installer takes a directory you name**, and says whether it can write there
  before it tries.
- **The settings page is two columns**, so it stops growing downwards with every feature.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.4.0)

## v0.3.1 — 6 August 2026
{: .release }

- Four defects found by a review of the whole codebase, two holes in the project's own gates, and
  eighteen cleanups. Nothing new to use; several things that were wrong are not any more.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.3.1)

## v0.3.0 — 6 August 2026
{: .release }

- **A script can switch an environment without a mouse.** `hostswitcher on Staging`, `status` in
  colour, an exit code for every outcome, and a launcher you can put on `PATH`. Reading needs no
  privileges; switching needs no password.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.3.0)

## v0.2.1 — 5 August 2026
{: .release }

- Nothing changed in the product. The package was rebuilt.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.2.1)

## v0.2.0 — 5 August 2026
{: .release }

- **The app says when a newer version has been published.** One request a day, carrying nothing
  about you or your sets, and a switch in the settings that stops it. It led to the release page;
  installing was still by hand until v0.5.0.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.2.0)

## v0.1.2 — 4 August 2026
{: .release }

- **The app has an icon**, drawn rather than stored and redrawn at each of the ten sizes macOS asks
  for. It matters most on the screen where the system asks whether to give the product root.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.1.2)

## v0.1.1 — 3 August 2026
{: .release }

- **The app finds its translations on machines other than the one that built it.** Before this it
  died on first launch with `could not load resource bundle` on any computer it was handed to.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.1.1)

## v0.1.0 — 3 August 2026
{: .release }

- The first public build: the managed block, the line grammar, atomic writes with backups, the
  privileged helper, the menu bar, the cache flush, sets, conflict detection and the editor window.
- **This package could be looked at but not used.** It was signed ad hoc, and the privileged helper
  refuses to register with a signature that carries no Team ID.

[Release notes and download](https://github.com/host-switcher/host-switcher/releases/tag/v0.1.0)
