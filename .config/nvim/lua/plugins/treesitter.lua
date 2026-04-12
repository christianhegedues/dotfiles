vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({
  { src = 'https://github.com/neovim-treesitter/nvim-treesitter' },
})

require('nvim-treesitter.config').setup({
  ensure_installed = {
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
  },
  -- Autoinstall languages that are not installed
  auto_install = true,
  indent = { enable = true, disable = { 'ruby' } },
  -- More accurate highlighting.
  -- Language-aware distinctions, even for complex constructions.
  highlight = {
    enable = true,
    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
    --  If you are experiencing weird indenting issues, add the language to
    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
    additional_vim_regex_highlighting = { 'ruby' },
    disable = { 'latex' },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
-- vim: ts=2 sts=2 sw=2 et
