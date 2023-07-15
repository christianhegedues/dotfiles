local colors = require("tokyonight.colors").setup({})
local util = require("tokyonight.util")

local colorscheme = 'tokyonight'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

local highlights = {
  -- Statusline
  { "StatusLine", { bg = colors.bg_dark }},
  { "Mode", { bg = colors.blue, fg = colors.bg_dark, gui = "bold" }},
  { "ModeAlt", { bg = colors.bg_dark, fg = colors.blue }},
  { "Git", { bg = util.darken(colors.blue, 0.2), fg = colors.blue }},
  { "GitAlt", { bg = util.darken(colors.blue, 0.2), fg = colors.bg_dark }},
  { "FileName", { bg = colors.bg_dark, fg = colors.blue }},
  { "FileNameAlt", { bg = colors.bg_dark, fg = util.darken(colors.blue, 0.2) }},
  { "FileType", { bg = util.darken(colors.blue, 0.2), fg = colors.blue }},
  { "FileTypeAlt", { bg = colors.bg_dark, fg = util.darken(colors.blue, 0.2) }},
  { "RowInfo", { bg = util.darken(colors.blue, 0.2), fg = colors.blue }},
  { "RowInfoAlt", { bg = colors.bg_dark, fg = util.darken(colors.blue, 0.2) }},
}

local set_highlight_group = function(group, options)
  local bg = options.bg == nil and "" or "guibg=" .. options.bg
  local fg = options.fg == nil and "" or "guifg=" .. options.fg
  local gui = options.gui == nil and "" or "gui=" .. options.gui

  vim.cmd(string.format("hi %s %s %s %s", group, bg, fg, gui))
end

for _, highlight in ipairs(highlights) do
  set_highlight_group(highlight[1], highlight[2])
end

