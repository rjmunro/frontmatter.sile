--
-- sile-frontmatter: YAML frontmatter support for SILE Markdown
-- Main package entry point
--

local base = require("packages.base")
local yamlParser = require("packages.frontmatter.yaml-parser")
local metadata = require("packages.frontmatter.metadata")

local package = pl.class(base)
package._name = "frontmatter"

function package:_init()
  base._init(self)
  self.class:loadPackage("markdown")
end

function package:registerCommands()
  
  -- Command to process a Markdown file with frontmatter
  self:registerCommand("frontmatter-markdown", function(options, content)
    local filename = options.src or content[1]
    
    if not filename then
      SU.error("frontmatter-markdown requires a filename")
    end
    
    -- Read the file
    local file = io.open(filename, "r")
    if not file then
      SU.error("Cannot open file: " .. filename)
    end
    local rawContent = file:read("*all")
    file:close()
    
    -- Parse frontmatter
    local meta, markdownContent = yamlParser.parse(rawContent)
    
    -- Store metadata in document
    if meta then
      metadata.store(SILE.scratch, meta)
      
      -- Set common document properties if present
      if meta.title then
        SILE.call("meta:title", {}, {meta.title})
      end
      if meta.author then
        SILE.call("meta:author", {}, {meta.author})
      end
      if meta.date then
        SILE.call("meta:date", {}, {meta.date})
      end
    end
    
    -- Process the Markdown content (without frontmatter)
    SILE.processString(markdownContent, "markdown")
  end, "Process a Markdown file with YAML frontmatter")
  
  -- Command to access metadata values
  self:registerCommand("meta", function(options, content)
    local key = options.key or content[1]
    if not key then
      SU.error("meta requires a key")
    end
    
    local value = metadata.get(SILE.scratch, key)
    if value then
      SILE.typesetter:typeset(tostring(value))
    end
  end, "Access a frontmatter metadata value")
  
end

return package
