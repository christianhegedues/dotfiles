vim.pack.add({
  {
    src = 'https://github.com/github/copilot.vim',
    version = 'v1.59.0',
  },
  {
    src = 'https://github.com/CopilotC-Nvim/CopilotChat.nvim',
    version = 'v4.7.4',
  },
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'CopilotChat' and (kind == 'install' or kind == 'update') then
      vim.cmd('make tiktoken')
    end
  end,
})

require('Copilotchat').setup({})

-- Auto-command to customize chat buffer behavior
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0
  end,
})
-- vim: ts=2 sts=2 sw=2 et
