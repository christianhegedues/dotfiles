local o = vim.opt

--[[ Context ]]
o.clipboard     = "unnamedplus"
o.cmdheight     = 2
o.colorcolumn   = { "80" }
o.completeopt   = { "menuone", "noselect", "noinsert" }
o.number        = true
o.numberwidth   = 4
o.sidescrolloff = 8
o.scrolloff     = 8
o.signcolumn    = "yes"
o.listchars     = { tab = "» ", space = "·" }
o.laststatus    = 3
o.pumheight     = 10

--[[ File ]]
o.backup        = false
o.encoding      = "utf8"
o.fileencoding  = "utf8"
o.swapfile      = false
o.undofile      = true
o.writebackup   = false

--[[ Buffer ]]
o.autowrite     = true
o.hidden        = true

--[[ Theme ]]
o.syntax        = "ON"
o.termguicolors = true

--[[ Search ]]
o.hlsearch      = true
o.ignorecase    = true
o.incsearch     = true
o.smartcase     = true

--[[ Indent ]]
o.autoindent    = true
o.smartindent   = true
o.smarttab      = true
o.expandtab     = true
o.shiftwidth    = 2
o.tabstop       = 2

--[[ Splits ]]
o.splitbelow    = true
o.splitright    = true

