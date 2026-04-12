-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,

  float = {
    border = 'rounded',
    source = 'if_many',
  },

  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
})

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
  desc = 'Open diagnostics in a floating window',
})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, {
  desc = 'Open diagnostics [Q]uickfix list',
})
