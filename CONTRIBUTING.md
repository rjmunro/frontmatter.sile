# Contributing to sile-frontmatter

Thank you for considering contributing to sile-frontmatter! This package fills a genuine gap in the SILE ecosystem, and contributions are warmly welcomed.

## Getting Started

### Prerequisites

- Lua 5.1, 5.2, 5.3, or LuaJIT
- SILE v0.15.0 or later
- Git
- A YAML library (`lyaml` or `tinyyaml`)

### Setting Up Development Environment

1. **Clone the repository:**
   ```bash
   git clone https://github.com/YOUR-USERNAME/sile-frontmatter.git
   cd sile-frontmatter
   ```

2. **Install SILE** (if not already installed):
   ```bash
   # macOS
   brew install sile
   
   # Or build from source
   # See: https://sile-typesetter.org/
   ```

3. **Install YAML library:**
   ```bash
   luarocks install lyaml
   # or
   luarocks install tinyyaml
   ```

4. **Run tests:**
   ```bash
   lua tests/test-yaml-parsing.lua
   lua tests/test-metadata.lua
   ```

## Development Workflow

### Making Changes

1. **Create a feature branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** in the appropriate files:
   - Core logic: `packages/frontmatter/*.lua`
   - Tests: `tests/*.lua`
   - Examples: `examples/`

3. **Test your changes:**
   ```bash
   # Run Lua tests
   lua tests/test-yaml-parsing.lua
   lua tests/test-metadata.lua
   
   # Test with SILE (if you have a .sil file)
   sile examples/basic.sil
   ```

4. **Commit with a clear message:**
   ```bash
   git add .
   git commit -m "Add feature: brief description of what changed"
   ```

5. **Push and create a pull request:**
   ```bash
   git push origin feature/your-feature-name
   ```

### Code Style

- Follow Lua community conventions
- Use 2 spaces for indentation
- Add comments for complex logic
- Keep functions focused and small
- Use descriptive variable names

### Testing

- Add tests for new features
- Ensure existing tests still pass
- Test edge cases and error conditions
- Include example files demonstrating new features

## Areas for Contribution

We especially welcome contributions in these areas:

### High Priority

- **Multi-file document support**: Process multiple Markdown files in order
- **Table of contents generation**: Automatic TOC from frontmatter + headers
- **Documentation**: Usage examples, tutorials, API docs
- **Error handling**: Better error messages and validation

### Medium Priority

- **Cross-references**: Link between files using frontmatter metadata
- **Template system**: Customizable document templates
- **Advanced metadata**: Support for nested structures, arrays, etc.
- **Integration tests**: Test with actual SILE rendering

### Nice to Have

- **Bibliography support**: Integration with CSL/BibLaTeX
- **Index generation**: Auto-generate index from keywords
- **Markdown extensions**: Support GFM, tables, etc.
- **CLI tool**: Command-line interface for common tasks

## Reporting Issues

### Bug Reports

When reporting bugs, please include:

- Your Lua version (`lua -v`)
- Your SILE version (`sile --version`)
- YAML library and version
- Minimal example that reproduces the issue
- Expected vs actual behavior
- Error messages (if any)

### Feature Requests

When requesting features:

- Describe the use case
- Explain why it would be valuable
- Provide examples of desired behavior
- Consider whether it fits the package scope

## Questions?

- Check the [README](README.md) for basic usage
- Look at [examples](examples/) for working code
- Open an issue for discussion
- Reach out to the SILE community

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Assume good intentions

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Recognition

Contributors will be acknowledged in:
- The README
- Release notes
- Git commit history

Thank you for helping make sile-frontmatter better!
