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
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

--@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy-plugins')

--[[
require('lazy').setup({ import = 'plugins' }, {
  change_detection = {
    notify = false,
  },
})
--]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
