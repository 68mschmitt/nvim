return {
    {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
        lazy = false,
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require("configs/telescope")
        end
	},

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        config = function()
            require("configs/treesitter")
        end,
    },

	{ 'nvim-treesitter/playground' },

	{
        'ThePrimeagen/harpoon',
        lazy = false,
        config = function()
            require("configs/harpoon")
        end
    },

	{
        'mbbill/undotree',
        lazy = false,
        config = function()
            require("configs/undotree")
        end
    },

	{
        'tpope/vim-fugitive',
        lazy = false,
        config = function()
            require("configs/fugitive")
        end
    },

	{
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            require("configs/lsp")
        end
    },

	{ 'hrsh7th/nvim-cmp' },

	{ 'hrsh7th/cmp-nvim-lsp' },

	{
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require("configs/mason")
        end
    },

	{ 'williamboman/mason-lspconfig.nvim' },

	{
        'mfussenegger/nvim-dap',
        config = function()
            require("configs/dap")
        end
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies =
        {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio'
        },
        config = function()
            require("configs/dapui")
        end
    },

    -- Random Fun
    { 'alec-gibson/nvim-tetris' },
    { 'eandrju/cellular-automaton.nvim' },
}
