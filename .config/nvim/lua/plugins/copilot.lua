return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      {
        'github/copilot.vim',
        tag = 'v1.56.0',
      },
      {
        'nvim-lua/plenary.nvim',
        commit = 'b9fd5226c2f76c951fc8ed5923d85e4de065e509',
      },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
