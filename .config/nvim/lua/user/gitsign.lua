local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  -- Configuration for signs
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },

  -- ignore untracked files
  attach_to_untracked = false,
  -- Callback called when attaching to a buffer. Mainly used to setup keymaps. 
  -- The buffer number is passed as the first argument.
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>hj', function()
      if vim.wo.diff then return '<leader>hj' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '<leader>hk', function()
      if vim.wo.diff then return '<leader>hk' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '<leader>hr', gs.reset_hunk)
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hb', gs.blame_line)
    map('n', '<leader>hd', gs.toggle_deleted)
  end
}

