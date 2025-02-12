return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            picker = { enabled = true },
            dashboard = require('configs.snacks.dashboard').options(true),

            terminal = { enabled = false },
            bigfile = { enabled = false },
            explorer = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = false },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        lazy = false,
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function() require("configs.telescope") end
    },

    { 'nvim-treesitter/nvim-treesitter', lazy = false, config = function() require("configs.treesitter") end },

    { 'nvim-treesitter/playground' },

    { 'lewis6991/gitsigns.nvim', config = require('configs.gitsigns') },

    { 'ThePrimeagen/harpoon', lazy = false, config = function() require("configs.harpoon") end },

    { 'mbbill/undotree', lazy = false, config = function() require("configs.undotree") end },

    { 'tpope/vim-fugitive', lazy = false, config = function() require("configs.fugitive") end },

    { 'hrsh7th/nvim-cmp', lazy = false },

    { 'hrsh7th/cmp-nvim-lsp', lazy = false },

    { 'williamboman/mason.nvim', lazy = false, config = function() require('configs.mason') end },

    { 'neovim/nvim-lspconfig', lazy = false, config = function() require('configs.lsp') end },

    { 'williamboman/mason-lspconfig.nvim', lazy = false },

    { 'mfussenegger/nvim-dap', config = function() require("configs.nvim-dap") end },

    {
        'seblj/roslyn.nvim',
        lazy = true,
        ft = "cs",
        events = { 'BufReadPre', 'BufNewFile' },
        opts = {
            config = {
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_compiler_diagnostics_scope = "fullSolution"
                    },
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        csharp_enable_inlay_hints_for_types = true,
                        dotnet_enable_inlay_hints_for_indexer_parameters = true,
                        dotnet_enable_inlay_hints_for_literal_parameters = true,
                        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                        dotnet_enable_inlay_hints_for_other_parameters = true,
                        dotnet_enable_inlay_hints_for_parameters = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                    ["csharp|symbol_search"] = {
                        dotnet_search_reference_assemplies = true,
                    },
                }
            },
        },
        init = require('configs.roslyn').init()
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
        config = function() require("configs.dapui") end
    },

    -- Random Fun
    { 'alec-gibson/nvim-tetris', config = function() require('configs.random').tetris() end },
    { 'eandrju/cellular-automaton.nvim', config = function() require('configs.random').cellular_automaton() end },
    { 'NStefan002/donut.nvim' },
    { 'tamton-aquib/duck.nvim',
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
            vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
        end
    },
}
