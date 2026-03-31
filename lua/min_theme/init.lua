local palette = require("min_theme.palette")
local highlights = require("min_theme.highlights")

local M = {}

local config = {
  style = "min",
}

local function normalize_style(style)
  if not style or style == "" then
    return config.style
  end
  return style
end

local function is_valid_style(style)
  return style == "min" or style == "min-dark" or style == "min-light"
end

local function resolve_style(style)
  if style == "min" then
    if vim.o.background == "light" then
      return "min-light"
    end
    return "min-dark"
  end
  return style
end

local function apply(groups)
  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

function M.setup(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})
end

function M.load(style)
  local normalized = normalize_style(style or vim.g.min_theme_style)
  if not is_valid_style(normalized) then
    vim.notify(("min-theme.nvim: unknown style '%s', fallback to min-dark"):format(normalized), vim.log.levels.WARN)
    normalized = "min-dark"
  end

  local selected = resolve_style(normalized)
  local colors = palette[selected]
  if not colors then
    vim.notify(("min-theme.nvim: unknown style '%s', fallback to min-dark"):format(selected), vim.log.levels.WARN)
    selected = "min-dark"
    colors = palette[selected]
  end

  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = colors.background
  vim.g.colors_name = normalized == "min" and "min" or selected
  apply(highlights.build(colors))
end

return M
