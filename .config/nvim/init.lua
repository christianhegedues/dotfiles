-- Set `,` as the leader key
-- See: `:help mapleader`
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require('options')

-- [[ Basic Keymaps ]]
require('keymaps')

-- [[ Diagnostics ]]
require('diagnostics')

-- [[ Plugins ]]
require('plugins.plenary')
require('plugins.lazydev')

-- require 'plugins.which-key',
-- require 'plugins.todo-comments',
-- require 'plugins.debug',
-- require 'plugins.indent_line',
-- require 'plugins.autopairs',
-- require 'plugins.neo-tree',

require('plugins.blink-cmp')

require('plugins.guess-indent')
require('plugins.treesitter')
require('plugins.lspconfig')
require('plugins.gitsigns')
require('plugins.telescope')
require('plugins.mini')
require('plugins.conform')
require('plugins.lint')
require('plugins.markview')
require('plugins.zk')
require('plugins.copilot')
require('plugins.tokyonight')
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
