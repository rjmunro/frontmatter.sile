---
title: "Getting Started with sile-frontmatter"
author: "John Doe"
date: "2026-03-17"
description: "A basic example demonstrating frontmatter parsing"
---

# Introduction

This is a simple example of using YAML frontmatter with SILE.

The metadata from the frontmatter block is automatically parsed and made available to your document.

## Features

- **Title**: Extracted from frontmatter
- **Author**: Available as metadata
- **Date**: Can be used in headers/footers
- **Description**: Used for document properties

## How It Works

The `sile-frontmatter` package:

1. Reads the YAML block between `---` delimiters
2. Parses the YAML into a Lua table
3. Stores metadata in `SILE.scratch`
4. Processes the remaining Markdown content
5. Makes metadata available via `\meta{key}` command

## Next Steps

Try adding more metadata fields to customize your document!
