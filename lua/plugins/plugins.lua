return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
---@diagnostic disable-next-line: undefined-doc-name
        ---@type snacks.Config
        opts = {
            picker = { enabled = true },
            dashboard = require('configs.snacks.dashboard').options(true),
            notifier = { enabled = true, timeout = 3000 },
            explorer = { enabled = true, replace_netrw = true, },
            image = { enabled = true },
            input = { enabled = true },
            scratch = { enabled = true },
            scroll = { enabled = true },
            words = { enabled = true },
            statuscolumn = { enabled = true },

            terminal = { enabled = false },
            bigfile = { enabled = false },
            indent = { enabled = false },
            quickfile = { enabled = false },
            scope = { enabled = false },
        },
        keys = require('configs.snacks.picker').Keys
    },

    { require('configs.colors').colorschemes },

    { 'nvim-treesitter/nvim-treesitter', lazy = false, config = function() require("configs.treesitter") end },

    { 'nvim-treesitter/playground' },

    { 'lewis6991/gitsigns.nvim', config = require('configs.gitsigns') },

    { 'ThePrimeagen/harpoon', dependencies = { 'nvim-lua/plenary.nvim' }, lazy = false, config = function() require("configs.harpoon") end },

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
            filewatching = false,
            lock_target = true,
            config = require('configs.roslyn').config,
        },
        init = require('configs.roslyn').init()
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
        config = function() require("configs.dapui") end
    },

    {
        'lewis6991/gitsigns.nvim',
        config = require('configs.gitsigns'),
    },

    -- Random Fun
    { 'alec-gibson/nvim-tetris', config = function() require('configs.random').tetris() end },
    { 'eandrju/cellular-automaton.nvim', config = function() require('configs.random').cellular_automaton() end },
    { 'NStefan002/donut.nvim', init = function() require('donut').setup({ timeout = 0 }) end },
    { 'tamton-aquib/duck.nvim',
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
            vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
        end
    },
    {
        'tamton-aquib/duck.nvim',
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
            vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
        end
    },
    {
        "letieu/hacker.nvim",
    },
    {
        'NStefan002/donut.nvim'
    },
}
