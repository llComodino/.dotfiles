vim.g.mapleader = " "

vim.keymap.set ("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set ("n", "<leader>psy", vim.cmd.PackerSync)

vim.keymap.set ("n", "<leader>of", vim.cmd.ObsidianFollowLink)

vim.keymap.set ("n", "<leader>ut", vim.cmd.UndotreeToggle)
vim.keymap.set ("n", "<leader>uf", vim.cmd.UndotreeFocus)

vim.keymap.set ("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set ("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set ("x", "<leader>p", "\"_dP")

vim.keymap.set ("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set ("n", "<leader>y", "\"+y")
vim.keymap.set ("n", "<leader>Y", "\"+Y")
vim.keymap.set ("v", "<leader>y", "\"+y")


------- The Most Important Ones ---------
vim.keymap.set ("n", "<left>",  ":echoe \"Use h\"\n")
vim.keymap.set ("n", "<right>", ":echoe \"Use l\"\n")
vim.keymap.set ("n", "<up>",    ":echoe \"Use k\"\n")
vim.keymap.set ("n", "<down>",  ":echoe \"Use j\"\n")

vim.keymap.set ("i", "<left>",  "<ESC>:echoe \"Use h\"\n")
vim.keymap.set ("i", "<right>", "<ESC>:echoe \"Use l\"\n")
vim.keymap.set ("i", "<up>",    "<ESC>:echoe \"Use k\"\n")
vim.keymap.set ("i", "<down>",  "<ESC>:echoe \"Use j\"\n")
