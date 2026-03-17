# Testing sile-frontmatter

## Current Status

### ✅ Working Tests

The standalone Lua tests work perfectly and verify the core functionality:

```bash
# Setup LuaRocks path
eval $(luarocks path)

# Run tests
./tests/test-metadata.lua      # ✓ All metadata tests pass
./tests/test-yaml-parsing.lua  # ✓ YAML parsing tests pass
```

**Test Results:**
- ✅ YAML frontmatter extraction
- ✅ YAML parsing via tinyyaml library
- ✅ Metadata storage and retrieval
- ✅ Nested key access (e.g., `author.name`)
- ✅ Value conversion and validation
- ✅ Array/table handling

### ✅ SILE Integration with Docker

**Docker workflow is now working!** The SILE Docker image provides a clean, working environment.

```bash
# Using the helper script (recommended)
./docker-sile.sh test-frontmatter-only.sil

# Or run directly
docker run --entrypoint sh --volume "$(pwd):/data" siletypesetter/sile:latest -c \
  "luarocks install api7-lua-tinyyaml && cd /data && sile your-file.sil"
```

**What works:**
- ✅ YAML parsing in SILE Docker environment (LuaJIT 2.1)
- ✅ Metadata extraction and storage
- ✅ PDF generation with frontmatter data
- ✅ All core package functionality

**Current limitation:**
- The standard SILE Docker image doesn't include the `markdown` package
- Alternative: Can use SILE's built-in `pandoc` package
- Or: Install third-party sile-markdown package in container

### ⚠️ SILE Installation via Homebrew

The SILE installation (0.15.13 via Homebrew) currently has dependency issues with Lua 5.5. This is an environmental issue, not a problem with our package code.

**Issue**: SILE's `core/globals.lua` is looking for `lua-utf8` but the vendored dependency is named `luautf8`.

**Workarounds:**

1. **Use Docker** (recommended) - See above
2. **Use Pandoc for PDF generation**
   - Pandoc has native YAML frontmatter support
   - Works perfectly out of the box
   - See: `/live-stream-manual` for working example
3. **Build SILE from source** (future option)
   - Clone https://github.com/sile-typesetter/sile
   - Build with correct Lua version configuration

## Dependencies Installed

### YAML Library
```bash
luarocks install --local api7-lua-tinyyaml
```

**Status**: ✅ Installed and working
-**Version**: 0.4.4-0
- **Module name**: `tinyyaml`
- **Compatible with**: Lua 5.5

### SILE Dependencies (attempted)
```bash
luarocks install --local penlight
luarocks install --local luafilesystem
```

**Status**: ⚠️ Installed but SILE still has issues
- These are installed in `~/.luarocks`
- SILE's Homebrew installation doesn't use them

## Running Tests

### Setup Environment
```bash
cd /Users/rjmunro/aldates/av-config/sile-frontmatter
eval $(luarocks path)
```

### Run Individual Tests
```bash
./tests/test-yaml-parsing.lua
./tests/test-metadata.lua
```

### Expected Output

**test-yaml-parsing.lua:**
```
=== YAML Parser Test ===

Test 1: Valid frontmatter
✓ Frontmatter parsed successfully
  Title:        Test Document
  Author:       Jane Smith
  Date: 2026-03-17
  Tags: test, example
  Markdown length:      44      chars

Test 2: No frontmatter
✓ Correctly detected no frontmatter
  Markdown length:      41      chars

Test 3: YAML library check
  Has YAML support:     true
  YAML library: tinyyaml

=== Tests Complete ===
```

**test-metadata.lua:**
```
=== Metadata Management Test ===

Test 1: Store and retrieve
✓ Metadata stored
✓ Retrieved title:      My Document

Test 2: Nested metadata
✓ Retrieved nested value:       Jane Smith

Test 3: Check existence
✓ 'title' exists
✓ 'nonexistent' correctly reported as missing

Test 4: Value conversion
  String:       plain text
  Number:       42
  Array:        one, two, three

Test 5: Validation
✓ Validation passed
✓ Validation correctly failed, missing: author, date

=== Tests Complete ===
```

## Next Steps

### Short Term (When SILE is Fixed)

1. **Test with SILE**:
   ```bash
   sile examples/basic.sil
   ```
   Expected: `examples/basic.pdf` generated

2. **Test with live-stream-manual** files
3. **Add more examples**

### Medium Term

1. **Create alternate test** that simulates SILE environment
2. **Add CI/CD** with GitHub Actions
3. **Publish to LuaRocks**
4. **Write more documentation**

## Troubleshooting

### "No YAML library available"

**Problem**: Tests report no YAML support

**Solution**:
```bash
# Make sure LuaRocks path is set
eval $(luarocks path)

# Verify tinyyaml is installed
luarocks list | grep tinyyaml
```

### "module not found" errors

**Problem**: Lua can't find our package files

**Solution**:
```bash
# Run from package root directory
cd /Users/rjmunro/aldates/av-config/sile-frontmatter

# Check package.path includes current directory
lua -e "print(package.path)"
```

### SILE dependency errors

**Problem**: SILE reports missing modules

**Status**: Known issue with Homebrew SILE 0.15.13 + Lua 5.5

**Workaround**: Use standalone tests for now, or use Pandoc for PDF generation

## Summary

✅ **Package code is working and tested**
✅ **Core functionality verified**
✅ **YAML parsing functional**
✅ **Metadata management operational**
⚠️ **SILE integration pending environment fix**

The package is ready for development and further testing. The SILE issue is environmental and will be resolved when SILE's Homebrew formula is updated or when building from source.
