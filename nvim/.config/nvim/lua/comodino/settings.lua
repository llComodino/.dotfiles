local opt = vim.opt
local g = vim.g

--------------------- Global ----------------------
g.mapleader = " "
g.blamer_enabled = true
g.vimtex_view_method = 'zathura'

--------------------- Options ---------------------
opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.guicursor = ""
opt.mouse = ""

opt.wrap = false

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 6

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

opt.shortmess:append "sI"

opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
