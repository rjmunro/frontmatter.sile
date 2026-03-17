#!/usr/bin/env lua
--
-- Test YAML parsing functionality
--

package.path = package.path .. ";./packages/?.lua;./packages/?/init.lua"

local yamlParser = require("frontmatter.yaml-parser")

print("=== YAML Parser Test ===\n")

-- Test 1: Document with valid frontmatter
print("Test 1: Valid frontmatter")
local content1 = [[---
title: "Test Document"
author: "Jane Smith"
date: "2026-03-17"
tags:
  - test
  - example
---

# Main Content

This is the document body.
]]

local meta1, markdown1 = yamlParser.parse(content1)
if meta1 then
  print("✓ Frontmatter parsed successfully")
  print("  Title:", meta1.title)
  print("  Author:", meta1.author)
  print("  Date:", meta1.date)
  print("  Tags:", table.concat(meta1.tags or {}, ", "))
  print("  Markdown length:", #markdown1, "chars")
else
  print("✗ Failed to parse frontmatter")
end

-- Test 2: Document without frontmatter
print("\nTest 2: No frontmatter")
local content2 = [[# Regular Markdown

No frontmatter here.
]]

local meta2, markdown2 = yamlParser.parse(content2)
if meta2 == nil then
  print("✓ Correctly detected no frontmatter")
  print("  Markdown length:", #markdown2, "chars")
else
  print("✗ False positive: detected frontmatter where none exists")
end

-- Test 3: Check YAML library availability
print("\nTest 3: YAML library check")
print("  Has YAML support:", yamlParser.hasYamlSupport())
print("  YAML library:", yamlParser.getYamlLibrary())

print("\n=== Tests Complete ===")
