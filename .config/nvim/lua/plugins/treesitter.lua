vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
})

vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup(
    'nvim-treesitter-pack-change-update',
    { clear = true }
  ),
  callback = function(ev)
    if ev.data.kind == 'update' then
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
        vim.notify('TSUpdate completed successfully', vim.log.levels.INFO)
      else
        vim.notify(
          'TSUpdate command not available yet, skipping',
          vim.log.levels.WARN
        )
      end
    end
  end,
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

require('nvim-treesitter').setup({})
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function()
    local filetype = vim.bo.filetype
    if filetype and filetype ~= '' then
      local ok = pcall(function() vim.treesitter.start() end)
      if not ok then return end
    end
  end,
})
-- vim: ts=2 sts=2 sw=2 et
