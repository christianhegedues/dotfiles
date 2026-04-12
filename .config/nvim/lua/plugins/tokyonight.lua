vim.pack.add({
  { 
    src = 'https://github.com/folke/tokyonight.nvim',
    version = 'v4.14.1',
  }
})

require('tokyonight').setup({
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
})

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
vim.cmd.colorscheme('tokyonight-moon')
-- vim: ts=2 sts=2 sw=2 et
