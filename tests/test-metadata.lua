#!/usr/bin/env lua
--
-- Test metadata management functionality
--

package.path = package.path .. ";./packages/?.lua;./packages/?/init.lua"

local metadata = require("frontmatter.metadata")

print("=== Metadata Management Test ===\n")

-- Create a mock scratch space
local scratch = {}

-- Test 1: Store and retrieve simple metadata
print("Test 1: Store and retrieve")
local testMeta = {
  title = "My Document",
  author = "John Doe",
  date = "2026-03-17",
  keywords = {"test", "example", "sile"}
}

metadata.store(scratch, testMeta)
print("✓ Metadata stored")

local title = metadata.get(scratch, "title")
if title == "My Document" then
  print("✓ Retrieved title:", title)
else
  print("✗ Failed to retrieve title")
end

-- Test 2: Nested metadata access
print("\nTest 2: Nested metadata")
local nestedMeta = {
  author = {
    name = "Jane Smith",
    email = "jane@example.com"
  }
}

metadata.store(scratch, nestedMeta)
local authorName = metadata.get(scratch, "author.name")
if authorName == "Jane Smith" then
  print("✓ Retrieved nested value:", authorName)
else
  print("✗ Failed to retrieve nested value")
end

-- Test 3: Check existence
print("\nTest 3: Check existence")
if metadata.has(scratch, "title") then
  print("✓ 'title' exists")
else
  print("✗ 'title' should exist")
end

if not metadata.has(scratch, "nonexistent") then
  print("✓ 'nonexistent' correctly reported as missing")
else
  print("✗ 'nonexistent' should not exist")
end

-- Test 4: Value to string conversion
print("\nTest 4: Value conversion")
print("  String:", metadata.toString("plain text"))
print("  Number:", metadata.toString(42))
print("  Array:", metadata.toString({"one", "two", "three"}))

-- Test 5: Validation
print("\nTest 5: Validation")
local validMeta = {title = "Doc", author = "Someone"}
local valid, missing = metadata.validate(validMeta, {"title", "author"})
if valid then
  print("✓ Validation passed")
else
  print("✗ Validation failed, missing:", table.concat(missing, ", "))
end

local invalidMeta = {title = "Doc"}
valid, missing = metadata.validate(invalidMeta, {"title", "author", "date"})
if not valid then
  print("✓ Validation correctly failed, missing:", table.concat(missing, ", "))
else
  print("✗ Validation should have failed")
end

print("\n=== Tests Complete ===")
