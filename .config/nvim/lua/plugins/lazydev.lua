-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins used
-- for completion, annotations and signatures of Neovim apis
vim.pack.add({
  {
    src = 'https://github.com/folke/lazydev.nvim',
    version = 'v1.10.0',
  },
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.lua' },
  callback = function()
    require('lazydev').setup({
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    })
  end,
})
-- vim: ts=2 sts=2 sw=2 et
