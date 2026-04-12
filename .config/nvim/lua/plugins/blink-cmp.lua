vim.pack.add({
  {
    src = 'https://github.com/L3MON4D3/LuaSnip',
    version = 'v2.5.0',
  },
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = 'v1.10.2',
  },
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      vim.cmd('make install_jsregexp')
    end
  end,
})

require('blink-cmp').setup({
  keymap = {
    -- For an understanding of why the 'default' preset is recommended,
    -- you will need to read `:help ins-completion`
    --
    -- All presets have the following mappings:
    -- <tab>/<s-tab>: move to right/left of your snippet expansion
    -- <c-space>: Open menu or open docs if already open
    -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
    -- <c-e>: Hide menu
    -- <c-k>: Toggle signature help
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    preset = 'default',
    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  },

  completion = {
    menu = {
      border = 'rounded',
      draw = {
        treesitter = { 'lsp' },
      },
    },
    documentation = {
      window = {
        border = 'rounded',
      },
    },
    ghost_text = {
      enabled = true,
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = {
        module = 'lazydev.integrations.blink',
        score_offset = 100,
      },
    },
  },

  snippets = {
    preset = 'luasnip',
  },

  fuzzy = {
    implementation = 'lua',
  },
})
-- vim: ts=2 sts=2 sw=2 et
