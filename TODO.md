# frontmatter.sile Development Roadmap

## Done ✅

- YAML frontmatter extraction, metadata storage and retrieval
- SILE package integration — `\frontmatter-markdown` and `\meta` commands
- `packages/frontmatter-resilient` adapter: maps `\meta:title → \chapter{}` for resilient.book
- Default no-op `\meta:*` handlers so the package works without an adapter loaded
- Working end-to-end PDF generation from a Docusaurus project
- Docker image (`frontmatter-sile`) with markdown.sile, resilient.sile and tinyyaml pre-installed
- LuaRocks rockspec, example files, README, CONTRIBUTING, MIT licence

## Up Next 🔄

- [ ] Add `\tableofcontents` to the example and test it with resilient.book
- [ ] Investigate rewriting internal Docusaurus links as PDF cross-references
- [ ] Add error handling for malformed YAML frontmatter
- [ ] Document `\frontmatter-markdown` and `\meta` command options in README
- [ ] Create a GitHub remote and publish
- [ ] Publish package to LuaRocks
- [ ] Set up CI (GitHub Actions — run tests on push)
- [ ] Engage with markdown.sile maintainer (Omikhleia) — discuss upstream potential

## Adapter Packages 🔌

Additional adapters alongside `frontmatter-resilient` for other SILE document classes:

- [ ] `frontmatter-plain` — maps `\meta:title` to a styled title block for plain/book class

## docusaurus.sile — End Goal 🎯

The long-term vision is a companion package `docusaurus.sile` that makes PDF
generation a one-command drop-in for any Docusaurus project:

- [ ] Publish a Docker image to Docker Hub (e.g. `frontmattersile/docusaurus-sile`)
  pre-bundled with SILE, markdown.sile, resilient.sile, frontmatter.sile and
  frontmatter-resilient
- [ ] Provide a self-contained `build-pdf.sh` script that any Docusaurus project
  can copy in — it pulls the Docker image and outputs a PDF with no local SILE
  install required
- [ ] Provide a GitHub Actions workflow file for the same, so CI can produce a
  PDF artefact automatically on every push
- [ ] `docusaurus.sile` package: reads a Docusaurus `docusaurus.config.js` (or a
  lightweight JSON/YAML equivalent) to discover the sidebar order, site title and
  author, then assembles the full SILE document automatically
- [ ] Optional per-project customisation: if a `sile/` directory exists at the
  project root, files inside it are layered on top of the defaults:
  - `sile/styles.yml` — resilient.sile style overrides
  - `sile/preamble.sil` — arbitrary SILE commands run before content
    (e.g. cover page, dedication, custom fonts)
  - `sile/postamble.sil` — run after content (e.g. colophon, index)
  - `sile/config.yml` — papersize, document class options, TOC depth, etc.
- [ ] TOC, page headers/footers, and chapter numbering driven automatically by
  the sidebar structure
- [ ] Internal Docusaurus links rewritten to PDF cross-references where possible

---

**Last Updated**: 2026-05-02  
**Current Phase**: MVP complete — resilient.sile adapter working  
**Status**: PDF generation working end-to-end; docusaurus.sile integration is the long-term goal
