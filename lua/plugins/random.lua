return {
    {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            vim.cmd([[TSUpdate]])
        end,
    },

	{'nvim-treesitter/playground'},

	{'ThePrimeagen/harpoon'},

	{'mbbill/undotree'},

	{'tpope/vim-fugitive'},

	{'neovim/nvim-lspconfig'},

	{'hrsh7th/nvim-cmp'},

	{'hrsh7th/cmp-nvim-lsp'},

	{'williamboman/mason.nvim'},

	{'williamboman/mason-lspconfig.nvim'},

	{'mfussenegger/nvim-dap'},

    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

    {"alec-gibson/nvim-tetris"},

    {"eandrju/cellular-automaton.nvim"},
}
