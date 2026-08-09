# host-switcher.github.io

The website for [HostSwitcher](https://github.com/host-switcher/host-switcher), a native
`/etc/hosts` manager for macOS. It is served at <https://host-switcher.github.io/>.

## What is here

| Path | What it is |
|---|---|
| `index.html` | the landing page — a layout rather than prose, so it is written as HTML |
| `changelog.md` | one entry per released version, written by hand |
| `_layouts/` | one layout for the site, one for prose pages |
| `assets/css/style.css` | the whole of the styling: no framework, no web font, no JavaScript |
| `assets/img/` | screenshots produced by `make preview` in the product's repository |
| `tools/make-og.swift` | draws the 1200×630 card a shared link unfurls into |
| `the specifications/` | the specification this site was built from, and the decisions behind it |

## Building it

Nothing to build. GitHub Pages runs Jekyll over this repository as it stands; there is no theme and
no plugin. To look at it locally, `jekyll serve` if you have it — but every page here is plain
enough that opening the built output is rarely necessary.

## Changing it

- **The screenshots come from the product**, not from here: `make preview` in the code repository
  writes them, and they are copied across. Do not retouch them — a picture that disagrees with the
  product is worse than no picture.
- **The version number is deliberately absent** from the download button. The link points at
  `releases/latest`, which GitHub resolves, so nothing can go stale. The number lives in the
  changelog, which is written per release anyway.
- **After adding a page**, add a line to `sitemap.xml`.
- The card drawn by `tools/make-og.swift` is regenerated with
  `swift tools/make-og.swift assets/img/icon.png assets/img/og.png`.
