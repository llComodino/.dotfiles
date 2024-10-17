vim.g.mapleader = " "

vim.keymap.set("n", "<C-c>", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-c>", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ex", ":Oil<CR>")
vim.keymap.set("n", "<leader>psy", ":PackerSync<CR>")

vim.keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")
