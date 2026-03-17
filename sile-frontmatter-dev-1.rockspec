package = "sile-frontmatter"
version = "dev-1"

source = {
   url = "git+https://github.com/YOUR-USERNAME/sile-frontmatter.git"
}

description = {
   summary = "YAML frontmatter support for SILE Markdown documents",
   detailed = [[
      sile-frontmatter extends SILE's Markdown support to handle YAML frontmatter
      metadata blocks. It parses frontmatter delimited by --- markers and makes
      the metadata available to SILE documents for use in templates, headers,
      and document properties.
   ]],
   homepage = "https://github.com/YOUR-USERNAME/sile-frontmatter",
   license = "MIT"
}

dependencies = {
   "lua >= 5.1, < 5.5",
   -- SILE dependency (when available on LuaRocks, currently must be installed separately)
   -- "sile >= 0.15.0",
   -- Will use either lyaml or tinyyaml for YAML parsing
   -- "lyaml >= 6.0" (preferred) or "tinyyaml >= 1.0" (fallback)
}

build = {
   type = "builtin",
   modules = {
      ["packages.frontmatter.init"] = "packages/frontmatter/init.lua",
      ["packages.frontmatter.yaml-parser"] = "packages/frontmatter/yaml-parser.lua",
      ["packages.frontmatter.metadata"] = "packages/frontmatter/metadata.lua",
   }
}
