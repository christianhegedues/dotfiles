return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'css',
        'html',
        'javascript',
        'lua',
        'luadoc',
        'markdown',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = {
          'ruby',
        },
      },
      indent = {
        enable = true,
        disable = {
          'ruby',
        },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
