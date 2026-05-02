# frontmatter.sile

YAML frontmatter support for SILE Markdown documents.

## Overview

`frontmatter.sile` extends SILE's Markdown support to handle YAML frontmatter metadata. This plugin parses frontmatter blocks delimited by `---` markers and makes the metadata available to SILE documents.

## Features

**Phase 1 (MVP):**
- ✅ YAML frontmatter parsing
- ✅ Extract title, author, date, description
- ✅ Pass content to markdown.sile for rendering
- ✅ Basic template integration

**Planned:**
- 🔄 Multi-file document support
- 🔄 Automatic table of contents generation
- 🔄 Cross-references between files
- 🔄 Custom metadata field passthrough

## Installation

### Docker (Recommended)

The easiest way to use frontmatter.sile is via Docker with pre-installed dependencies:

```bash
# Build the custom image (one-time setup)
docker build -t frontmatter-sile .

# Use the helper script
./docker-sile.sh your-document.sil

# Or run directly
docker run --rm --volume "$(pwd):/data" frontmatter-sile your-document.sil
```

The Dockerfile extends the official SILE image and includes:
- SILE v0.15.13
- api7-lua-tinyyaml (YAML parser)
- All standard SILE packages

### Requirements (Non-Docker)

- SILE v0.15.0 or later
- Lua 5.1, 5.2, 5.3, or LuaJIT
- `markdown.sile` package
- `lyaml` or `tinyyaml` for YAML parsing

### Via LuaRocks (when published)

```bash
luarocks install frontmatter.sile
```

### Manual Installation

```bash
git clone https://github.com/YOUR-USERNAME/frontmatter.sile.git
cd frontmatter.sile
luarocks make
```

## Usage

### Basic Example

Given a Markdown file with frontmatter:

```markdown
---
title: "My Document"
author: "John Doe"
date: "2026-03-17"
description: "A sample document with metadata"
---

# Chapter 1

This is the content of my document...
```

Process it with SILE:

```lua
\begin{document}
\use[module=packages.frontmatter]
\frontmatter-markdown{myfile.md}
\end{document}
```

Or from the command line:

```bash
sile -u packages.frontmatter mydocument.sil
```

### Accessing Metadata

The frontmatter metadata is available in your SILE document:

```lua
\set[parameter=document.title]{\meta{title}}
\set[parameter=document.author]{\meta{author}}
\set[parameter=document.date]{\meta{date}}
```

## Architecture

The package consists of three main components:

1. **yaml-parser.lua** - Parses YAML frontmatter using `lyaml` or `tinyyaml`
2. **metadata.lua** - Manages metadata extraction and validation
3. **init.lua** - Main package interface, integrates with markdown.sile

## Development

### Project Structure

```
frontmatter.sile/
├── README.md
├── LICENSE
├── frontmatter.sile-dev-1.rockspec
├── packages/
│   └── frontmatter/
│       ├── init.lua          # Main package entry point
│       ├── yaml-parser.lua   # YAML parsing logic
│       └── metadata.lua      # Metadata handling
├── examples/
│   ├── basic.md              # Simple example
│   ├── basic.sil             # SILE document using frontmatter
│   └── multi-file/           # Multi-file document example
└── tests/
    ├── test-yaml-parsing.lua
    └── test-metadata.lua
```

### Running Tests

```bash
lua tests/test-yaml-parsing.lua
lua tests/test-metadata.lua
```

## Contributing

Contributions are welcome! This package fills a genuine gap in the SILE ecosystem.

### Areas for Contribution

- Multi-file document processing
- Table of contents generation from frontmatter + headers
- Cross-reference support
- Additional metadata field support
- Documentation improvements

## License

MIT License - See LICENSE file for details

## Related Projects

- [SILE](https://github.com/sile-typesetter/sile) - The SILE Typesetter
- [markdown.sile](https://github.com/Omikhleia/markdown.sile) - Comprehensive Markdown support for SILE
- [Pandoc](https://pandoc.org/) - Universal document converter (alternative approach)

## Acknowledgments

- Built on top of the excellent [markdown.sile](https://github.com/Omikhleia/markdown.sile) by Didier Willis
- Inspired by Pandoc's YAML metadata block support
- Part of the SILE typesetting ecosystem

## Status

🚧 **Work in Progress** - Phase 1 implementation ongoing

Current focus: MVP implementation with basic frontmatter parsing and metadata extraction.
