-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","

local function map(mode, l, r, opts)
  opts = opts or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, l, r, opts)
end

--[[ Normal Mode ]]
-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- Navigate windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize
map("n", "<C-S-k>", ":resize -2<CR>")
map("n", "<C-S-j>", ":resize +2<CR>")
map("n", "<C-S-h>", ":vertical resize -2<CR>")
map("n", "<C-S-l>", ":vertical resize +2<CR>")

--[[ Visual Mode ]]
-- Move text up and down
map("v", "<C-k>", ":m .-2<CR>==gi")
map("v", "<C-j>", ":m .+1<CR>==gi")

--[[ Inset Mode ]]
-- Faster switching from insert mode to normal mode
map('i', 'jk', '<ESC>')

--[[ Plugins ]]
--[[ Telescope ]]
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>')
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>')
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>')

--[[ Nvimtree ]]
map('n', '<leader>e', ':NvimTreeToggle<CR>')

