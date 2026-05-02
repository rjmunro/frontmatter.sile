--
-- frontmatter.sile: resilient.sile adapter
-- Overrides the meta:* hooks to integrate with resilient.book document class.
--
-- Usage: load this package after packages.frontmatter when using resilient.book.
--   \use[module=packages.frontmatter]
--   \use[module=packages.frontmatter-resilient]
--

local base = require("packages.base")

local package = pl.class(base)
package._name = "frontmatter-resilient"

function package:registerCommands()

  -- Map meta:title to resilient.book's \chapter command
  self:registerCommand("meta:title", function(_, content)
    SILE.call("chapter", {}, content)
  end, "Maps frontmatter title to a resilient.sile chapter heading")

  -- meta:author and meta:date: stored in scratch by packages.frontmatter,
  -- accessible via \meta[key=author] — no visible output needed here.
  self:registerCommand("meta:author", function(_, _) end, "No-op for resilient.sile (use \\meta[key=author] to access)")
  self:registerCommand("meta:date", function(_, _) end, "No-op for resilient.sile (use \\meta[key=date] to access)")

end

return package
