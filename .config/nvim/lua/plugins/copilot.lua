return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    version = '4.7.4',
    dependencies = {
      {
        'github/copilot.vim',
        tag = 'v1.59.0',
      },
      {
        'nvim-lua/plenary.nvim',
        version = '0.1.4',
      },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
