vim.pack.add({
  {
    src = 'https://github.com/lewis6991/gitsigns.nvim',
    version = 'v2.1.0',
  },
})

require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end, { desc = 'Jump to next git [c]hange' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = 'Jump to previous git [c]hange' })

    -- Actions
    local function visual_range()
      if vim.fn.mode():match('[vV\22]') then
        return { vim.fn.line('.'), vim.fn.line('v') }
      end
    end

    map(
      { 'n', 'x' },
      '<leader>hs',
      function() gitsigns.stage_hunk(visual_range()) end,
      { desc = 'git [s]tage hunk' }
    )

    map(
      { 'n', 'x' },
      '<leader>hr',
      function() gitsigns.reset_hunk(visual_range()) end,
      { desc = 'git [r]eset hunk' }
    )

    map(
      'n',
      '<leader>hS',
      gitsigns.stage_buffer,
      { desc = 'git [S]tage buffer' }
    )

    map(
      'n',
      '<leader>hR',
      gitsigns.reset_buffer,
      { desc = 'git [R]eset buffer' }
    )

    map(
      'n',
      '<leader>hp',
      gitsigns.preview_hunk_inline,
      { desc = 'git [p]review hunk inline' }
    )

    map(
      'n',
      '<leader>hb',
      function() gitsigns.blame_line({ full = true }) end,
      { desc = 'git [b]lame line' }
    )

    map(
      'n',
      '<leader>hd',
      gitsigns.diffthis,
      { desc = 'git [d]iff against index' }
    )

    map(
      'n',
      '<leader>hD',
      function() gitsigns.diffthis('@') end,
      { desc = 'git [D]iff against last commit' }
    )

    map(
      'n',
      '<leader>hq',
      function() gitsigns.setqflist('all') end,
      { desc = 'git hunks to [q]uickfix' }
    )

    -- Toggles
    map(
      'n',
      '<leader>tb',
      gitsigns.toggle_current_line_blame,
      { desc = '[T]oggle git show [b]lame line' }
    )

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'git [h]unk' })
  end,
})
-- vim: ts=2 sts=2 sw=2 et
