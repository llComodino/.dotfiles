-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  	
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope fzf
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
        'thePrimeagen/harpoon'
    )

    use (
        'APZelos/blamer.nvim'
    )
    
    use (
        'github/copilot.vim'
    )
    
    use (
        'xiyaowong/transparent.nvim'
    )
    
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
                name = "personal",
                path = "~/Documents/ComoVault",
            },
        })
        end,
    })

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
