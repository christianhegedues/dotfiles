local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    side = "right",
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      git_placement = "signcolumn",
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          deleted = "",
          untracked = "U",
          ignored = "",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    }
  },
}

