vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ({
		'folke/tokyonight.nvim',
		as = 'tokyonight',
		config = function()
			vim.cmd('colorscheme tokyonight')
		end
	})

	use ({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})

	use ({'nvim-treesitter/playground'})

	use ({'ThePrimeagen/harpoon'})

	use ({'mbbill/undotree'})

	use ({'tpope/vim-fugitive'})

	use({'neovim/nvim-lspconfig'})
	use({'hrsh7th/nvim-cmp'})
	use({'hrsh7th/cmp-nvim-lsp'})

	use({'williamboman/mason.nvim'})
	use({'williamboman/mason-lspconfig.nvim'})

	use({'mfussenegger/nvim-dap'})
    use({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} })

end)
