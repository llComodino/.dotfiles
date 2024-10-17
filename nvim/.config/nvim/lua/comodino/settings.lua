local opt = vim.opt
local g = vim.g

--local sline = require("statusline")

--------------------- Global ----------------------
g.mapleader = " "
g.blamer_enabled = true
g.vimtex_view_method = 'zathura'
g.copilot_enabled = 1

--------------------- Show full errors ------------
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  underline = true,
  virtual_lines = true,
})

--------------------- Options ---------------------
opt.laststatus = 3
opt.showmode = false

opt.guicursor = ""
opt.mouse = ""

--opt.statusline = sline.get()

opt.wrap = false

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.listchars = { trail = '~', tab = '→ ', space = '·', nbsp = '␣', eol = '↵' }
opt.list = true

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

vim.cmd[[
  augroup MarkdownConceal
    autocmd!
    autocmd FileType markdown setlocal conceallevel=2
  augroup END
]]
