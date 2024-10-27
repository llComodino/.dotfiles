local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- various ascii arts for `ComoVim`
dashboard.section.header.val = {
  [[     ___             __   __          ]],
  [[    / __|___ _ __  __\ \ / (_)_ __    ]],
  [[   | (__/ _ \ '  \/ _ \ V /| | '  \   ]],
  [[    \___\___/_|_|_\___/\_/ |_|_|_|_|  ]],
  [[                                      ]],
  [[     Simple, Fast, and Powerful       ]],
  [[      -- By @comodino                 ]],
};

dashboard.section.buttons.val = {
  dashboard.button( "c", "  > Code",         ":cd $HOME/code | Oil<CR>"),
  dashboard.button( "n", "  > Notes",        ":cd $HOME/documents/ComoVault | Oil<CR>"),
  dashboard.button( "w", "  > Work",         ":cd $OS3 | Oil<CR>"),
  dashboard.button( "l", "󰁯  > Last open",    ":Telescope oldfiles<CR>"),
  dashboard.button( "s", "  > Settings",     ":cd $HOME/.config/nvim | Oil<CR>"),
  dashboard.button( "q", "  > Quit NVIM",    ":qa<CR>"),
}

alpha.setup(dashboard.opts)

vim.cmd([[
  autocmd FileType alpha setlocal nofoldenable
]])
