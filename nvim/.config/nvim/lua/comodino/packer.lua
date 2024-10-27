-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.3',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use (
    'nvim-treesitter/nvim-treesitter',
  { run = 'TSUpdate'}
  )

  use (
    'nvim-treesitter/playground'
  )

  use (
    'saghen/blink.cmp'
  )

  -- use 'kyazdani42/nvim-web-devicons'
  --
  -- use {'neoclide/coc.nvim', {branch = 'release'} }
  --
  -- use {
  --     'hardcoreplayers/spaceline.vim'
  --   --requires = { {'neoclide/coc.nvim', {branch = 'release'} } }
  -- }
  use (
    'goolord/alpha-nvim'
  )

  use (
    'mrcjkb/rustaceanvim'
  )

  use (
    'thePrimeagen/harpoon'
  )

  use (
    'APZelos/blamer.nvim'
  )

  use (
    'gaborvecsei/usage-tracker.nvim'
  )

  use({
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup()
    end,
  })

  use (
    'github/copilot.vim'
  )

  use (
    'voldikss/vim-floaterm'
  )

  use (
    'xiyaowong/transparent.nvim'
  )

  use ({
    'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
  })

  use (
    'joshdick/onedark.vim'
  )

  use({
    "epwalsh/obsidian.nvim",
    tag = "*",
    requires = { "nvim-lua/plenary.nvim" },

    config = function()
    require("obsidian").setup({

      workspaces = {
      {
        name = "ComoVault",
        path = "~/documents/ComoVault",
      }
      },

    })
    end,
  })

  use (
    'lervag/vimtex'
  )

  use (
    'junegunn/goyo.vim'
  )

  use (
    'junegunn/limelight.vim'
  )

  use (
    'ThePrimeagen/git-worktree.nvim'
  )

  use (
    'neovim/nvim-lspconfig'
  )

  -- use (
  --   'hrsh7th/nvim-cmp'
  -- )

  -- use (
  --   'hrsh7th/cmp-nvim-lsp'
  -- )

  -- use (
  --   'saadparwaiz1/cmp_luasnip'
  -- )

  use (
    'L3MON4D3/LuaSnip'
  )

  use (
    'williamboman/mason-lspconfig.nvim'
  )

  use (
    'williamboman/mason.nvim'
  )

  use (
    'mbbill/undotree'
  )

  use (
    'andweeb/presence.nvim'
  )

end)
