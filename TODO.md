# frontmatter.sile Development Roadmap

## Phase 1: MVP (Current) ✅

**Goal**: Basic single-file frontmatter parsing and metadata extraction

### Completed
- [x] YAML frontmatter extraction (`yaml-parser.lua`)
- [x] Metadata storage and retrieval (`metadata.lua`)
- [x] SILE package integration (`init.lua`)
- [x] Commands: `\frontmatter-markdown` and `\meta`
- [x] LuaRocks package specification
- [x] Basic example files
- [x] Standalone test suite
- [x] MIT License
- [x] README with usage docs
- [x] Contributing guidelines

### Next Steps for Phase 1
- [ ] Test with actual YAML library installed (`lyaml` or `tinyyaml`)
- [ ] Test with SILE rendering (create PDF from example)
- [ ] Add error handling for malformed YAML
- [ ] Document command options and parameters
- [ ] Add more example files

## Phase 2: Enhanced Metadata 🔄

**Goal**: Support all common frontmatter fields with validation

### TODO
- [ ] Support additional common fields:
  - [ ] `subtitle`
  - [ ] `keywords` (array)
  - [ ] `abstract`
  - [ ] `lang` (language code)
  - [ ] `documentclass`
- [ ] Custom field passthrough for user-defined metadata
- [ ] Metadata validation with helpful error messages
- [ ] Type coercion (dates, numbers, booleans)
- [ ] Default values for missing fields
- [ ] Metadata inheritance (for multi-file documents)

### Testing
- [ ] Test suite for all common fields
- [ ] Test edge cases (empty values, special characters)
- [ ] Test nested structures
- [ ] Test array handling

### Documentation
- [ ] Complete metadata field reference
- [ ] Examples for each field type
- [ ] Migration guide from Pandoc

## Phase 3: Multi-file Support 📚

**Goal**: Process multiple Markdown files into a single document

### Features
- [ ] Accept multiple input files
- [ ] Order files by frontmatter `order` or `weight` field
- [ ] Combined table of contents
- [ ] Section/chapter structure from files
- [ ] File-level metadata vs document-level metadata
- [ ] Include/exclude files with `toc: false`

### API Design
- [ ] `\frontmatter-document[files={file1.md,file2.md}]`
- [ ] `\frontmatter-chapter[src=chapter1.md]`
- [ ] Configuration file support (YAML or Lua)

### Testing
- [ ] Multi-file example project
- [ ] Test file ordering
- [ ] Test metadata merging
- [ ] Test TOC generation

## Phase 4: Advanced Features 🚀

**Goal**: Professional publishing-grade capabilities

### Cross-References
- [ ] Use frontmatter `id` or `slug` for references
- [ ] Support `[[reference]]` syntax
- [ ] Generate SILE label/ref pairs
- [ ] Cross-file links

### Table of Contents
- [ ] Automatic TOC generation
- [ ] Configurable depth
- [ ] Custom TOC formatting
- [ ] Mini-TOCs per chapter

### Bibliography
- [ ] CSL/BibLaTeX integration
- [ ] Citation support from frontmatter
- [ ] Bibliography generation
- [ ] Citation style configuration

### Templates
- [ ] Document class templates
- [ ] Header/footer templates using metadata
- [ ] Cover page generation
- [ ] Custom theming system

### Index
- [ ] Auto-generate from keywords
- [ ] Manual index entries
- [ ] Multiple indexes (subject, author, etc.)

## Future Possibilities 💡

### Markdown Extensions
- [ ] GitHub Flavored Markdown (GFM)
- [ ] Tables (if not in markdown.sile)
- [ ] Task lists
- [ ] Definition lists
- [ ] Footnotes

### CLI Tool
- [ ] Command-line interface
- [ ] Watch mode for live updates
- [ ] Batch processing
- [ ] Template scaffolding

### Integration
- [ ] Pandoc JSON AST input
- [ ] Export to other formats
- [ ] Plugin system for extensions
- [ ] Integration with build tools (Make, Gulp, etc.)

### Documentation
- [ ] Full API reference
- [ ] Tutorial series
- [ ] Video guides
- [ ] Example project gallery

## Community & Ecosystem 🌍

### Outreach
- [ ] Open issue in SILE repo to announce project
- [ ] Post to SILE forums/mailing list
- [ ] Write blog post about the package
- [ ] Submit to LuaRocks

### Collaboration
- [ ] Engage with markdown.sile maintainer (Omikhleia)
- [ ] Discuss potential upstream contribution
- [ ] Coordinate with SILE core team
- [ ] Seek feedback from users

### Maintenance
- [ ] Set up CI/CD (GitHub Actions)
- [ ] Automated testing on multiple Lua versions
- [ ] Version tagging and releases
- [ ] Changelog maintenance
- [ ] Issue triage and management

## Success Metrics 📈

### Short-term (3 months)
- [ ] 10+ GitHub stars
- [ ] 3+ external contributors
- [ ] 1+ production user

### Medium-term (6 months)
- [ ] 50+ GitHub stars
- [ ] Published on LuaRocks
- [ ] Mentioned in SILE documentation
- [ ] 5+ production users

### Long-term (12 months)
- [ ] 100+ GitHub stars
- [ ] Standard tool for SILE Markdown workflows
- [ ] Integration into markdown.sile or SILE core
- [ ] Active community contributions

---

**Last Updated**: 2026-03-17  
**Current Phase**: Phase 1 (MVP)  
**Status**: Initial scaffolding complete, ready for testing
