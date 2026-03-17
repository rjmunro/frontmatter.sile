--
-- sile-frontmatter: Metadata management module
-- Handles storage, retrieval, and validation of frontmatter metadata
--

local metadata = {}

-- Store metadata in SILE.scratch for document-wide access
function metadata.store(scratch, meta)
  if not scratch.frontmatter then
    scratch.frontmatter = {}
  end

  -- Store all metadata
  for key, value in pairs(meta) do
    scratch.frontmatter[key] = value
  end
end

-- Retrieve a metadata value by key
function metadata.get(scratch, key)
  if not scratch.frontmatter then
    return nil
  end

  -- Support nested keys with dot notation (e.g., "author.name")
  local keys = {}
  for k in key:gmatch("[^%.]+") do
    table.insert(keys, k)
  end

  local value = scratch.frontmatter
  for _, k in ipairs(keys) do
    if type(value) ~= "table" then
      return nil
    end
    value = value[k]
    if value == nil then
      return nil
    end
  end

  return value
end

-- Get all metadata
function metadata.getAll(scratch)
  return scratch.frontmatter or {}
end

-- Check if a key exists
function metadata.has(scratch, key)
  return metadata.get(scratch, key) ~= nil
end

-- Common metadata fields mapping
metadata.commonFields = {
  "title",
  "author",
  "date",
  "description",
  "subtitle",
  "keywords",
  "abstract",
  "lang",
  "documentclass",
}

-- Validate that required fields are present
function metadata.validate(meta, requiredFields)
  local missing = {}

  for _, field in ipairs(requiredFields or {}) do
    if not meta[field] then
      table.insert(missing, field)
    end
  end

  return #missing == 0, missing
end

-- Convert metadata value to string (handles tables, etc.)
function metadata.toString(value)
  if type(value) == "string" then
    return value
  elseif type(value) == "number" or type(value) == "boolean" then
    return tostring(value)
  elseif type(value) == "table" then
    -- For arrays, join with commas
    if #value > 0 then
      return table.concat(value, ", ")
    end
    -- For objects, return a simple representation
    local parts = {}
    for k, v in pairs(value) do
      table.insert(parts, k .. ": " .. metadata.toString(v))
    end
    return table.concat(parts, "; ")
  else
    return tostring(value)
  end
end

return metadata
