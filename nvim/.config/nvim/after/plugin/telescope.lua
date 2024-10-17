local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

require("telescope").load_extension("git_worktree")

local twt = require('telescope').extensions.git_worktree

vim.keymap.set ('n', '<leader>ft', function()
  twt.git_worktrees()
end, {})

vim.keymap.set ('n', '<leader>ct', function()
  twt.create_git_worktree()
end, {})
