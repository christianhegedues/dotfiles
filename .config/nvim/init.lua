-- Set , as the leader key
-- See: `:help mapleader`
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Set to true if you have a Nerd Font installed and selected in terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require('options')

-- [[ Basic Keymaps ]]
require('keymaps')

-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt`
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
--@diagnostic disable-next-line; undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ import = 'plugins' }, {
  change_detection = {
    notify = false,
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
