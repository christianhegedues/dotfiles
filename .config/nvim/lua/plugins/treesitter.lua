-- Must be registered before vim.pack.add to also catch the initial install
vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Update treesitter parsers after plugin update',
  group = vim.api.nvim_create_augroup('chhe-treesitter-update', { clear = true }),
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
})

local parsers = {
  'bash',
  'c',
  'css',
  'diff',
  'html',
  'javascript',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'scss',
  'typescript',
  'vim',
  'vimdoc',
  'vue',
}

require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Start treesitter for supported filetypes',
  group = vim.api.nvim_create_augroup('chhe-treesitter', { clear = true }),
  callback = function(ev)
    -- Parser names don't always match filetypes (e.g. bash -> sh, vimdoc ->
    -- help). Resolve here, as nvim-treesitter registers them after init.lua.
    local lang = vim.treesitter.language.get_lang(ev.match)
    if vim.list_contains(parsers, lang) then pcall(vim.treesitter.start) end
  end,
})
-- vim: ts=2 sts=2 sw=2 et
