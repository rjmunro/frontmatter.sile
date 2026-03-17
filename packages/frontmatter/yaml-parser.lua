--
-- sile-frontmatter: YAML parsing module
-- Handles extraction and parsing of YAML frontmatter from Markdown content
--

local yamlParser = {}

-- Compatibility: Use SILE's SU if available, otherwise plain Lua
local SU = SU or {
  warn = function(msg) print("Warning: " .. msg) end,
  error = function(msg) error(msg) end
}

-- Try to load YAML library (prefer lyaml, fall back to tinyyaml)
local yaml
local yamlLib = "none"

local function tryRequire(module)
  local success, result = pcall(require, module)
  return success and result or nil
end

yaml = tryRequire("lyaml")
if yaml then
  yamlLib = "lyaml"
else
  yaml = tryRequire("tinyyaml")
  if yaml then
    yamlLib = "tinyyaml"
  end
end

-- Extract frontmatter block from content
-- Returns: frontmatter string (or nil), remaining content
local function extractFrontmatter(content)
  -- Check if content starts with ---
  if not content:match("^%s*%-%-%-") then
    return nil, content
  end

  -- Find the closing --- (must be on its own line)
  local _, endPos = content:find("^%-%-%-.-\n%-%-%-\n", 1)

  if not endPos then
    -- No closing delimiter found, no frontmatter
    return nil, content
  end

  -- Extract the frontmatter block (between the --- markers)
  local frontmatterBlock = content:sub(4, endPos - 4)
  local remainingContent = content:sub(endPos + 1)

  return frontmatterBlock, remainingContent
end

-- Parse YAML string into Lua table
-- Returns: table or nil
local function parseYaml(yamlString)
  if not yaml then
    SU.warn("No YAML library available (install lyaml or tinyyaml)")
    return nil
  end

  local success, result

  if yamlLib == "lyaml" then
    success, result = pcall(yaml.load, yamlString)
  elseif yamlLib == "tinyyaml" then
    success, result = pcall(yaml.parse, yamlString)
  else
    return nil
  end

  if not success then
    SU.warn("Failed to parse YAML frontmatter: " .. tostring(result))
    return nil
  end

  return result
end

-- Main parse function
-- Returns: metadata table (or nil), markdown content
function yamlParser.parse(content)
  local frontmatterString, markdownContent = extractFrontmatter(content)

  if not frontmatterString then
    return nil, content
  end

  local metadata = parseYaml(frontmatterString)

  return metadata, markdownContent
end

-- Check if YAML library is available
function yamlParser.hasYamlSupport()
  return yaml ~= nil
end

-- Get the name of the loaded YAML library
function yamlParser.getYamlLibrary()
  return yamlLib
end

return yamlParser
