return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@diagnostic disable-next-line: undefined-doc-name
        ---@type snacks.Config
        opts = {
            picker = { enabled = true, sources = { explorer = { layout = { layout = { position = "right" } } } } },
            dashboard = require('configs.snacks.dashboard').options(true),
            notifier = { enabled = true, timeout = 3000 },
            explorer = { enabled = true, replace_netrw = true },
            image = { enabled = true },
            input = { enabled = true },
            scratch = { enabled = true },
            scroll = { enabled = true },
            words = { enabled = true },
            statuscolumn = { enabled = true },
            terminal = { enabled = true },

            bigfile = { enabled = false },
            indent = { enabled = false },
            quickfile = { enabled = false },
            scope = { enabled = false },
        },
        keys = require('configs.snacks.picker').Keys,
        init = require('configs.snacks')
    },

    {
        'echasnovski/mini.tabline',
        lazy = true,
        init = function()
            require('mini.tabline').setup()
        end,
        dependencies = { 'echasnovski/mini.icons' }
    },

    {
        'echasnovski/mini.statusline',
        version = false,
        lazy = true,
        init = function()
            require('mini.statusline').setup()
        end
    },

    { require('configs.colors').colorschemes },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        config = function()
            require("configs.treesitter")
        end
    },

    { 'nvim-treesitter/playground' },

    {
        'lewis6991/gitsigns.nvim',
        config = require('configs.gitsigns')
    },

    {
        'mbbill/undotree',
        lazy = false,
        config = function()
            require("configs.undotree")
        end
    },

    {
        'tpope/vim-fugitive',
        lazy = false,
        config = function()
            require("configs.fugitive")
        end
    },

    {
        'hrsh7th/nvim-cmp',
        lazy = true
    },

    {
        'hrsh7th/cmp-nvim-lsp',
        lazy = true
    },

    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('configs.mason')
        end
    },

    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            require('configs.lsp')
        end
    },

    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false
    },

    {
        'seblj/roslyn.nvim',
        lazy = true,
        ft = "cs",
        events = { 'BufReadPre', 'BufNewFile' },
        opts = {
            filewatching = "roslyn",
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
        'mfussenegger/nvim-dap',
        config = function() require("configs.nvim-dap") end
    },

    {
        'lewis6991/gitsigns.nvim',
        config = require('configs.gitsigns'),
    },

    {
        "dgagn/diagflow.nvim",
        enabled = true,
        config = function()
            require('diagflow').setup({
                scope = 'line',
                show_borders = true,
                placement = "top",
            })
        end,
    },

    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' }
            },
        },
        opts_extend = { "sources.default" }
    },

    { 'danilamihailov/beacon.nvim' },

    {
        "GustavEikaas/code-playground.nvim",
        config = function()
            require("code-playground").setup()
        end
    },

    {
        "norcalli/nvim-colorizer.lua",
        enabled = not vim.g.is_perf,
        event = "BufRead",
        config = function()
            require("colorizer").setup({ "*" }, {
                names = false,        -- "Name" codes like Blue
                mode  = 'background', -- Set the display mode.
            })
        end
    },

    -- Random Fun
    {
        'alec-gibson/nvim-tetris',
        lazy = true,
        config = function() require('configs.random').tetris() end
    },
    {
        'eandrju/cellular-automaton.nvim',
        lazy = false,
        config = function() require('configs.random').cellular_automaton() end
    },
    {
        'NStefan002/donut.nvim',
        lazy = true,
        init = function() require('donut').setup({ timeout = 0 }) end
    },

    -- Personal Plugins
    {
        '68mschmitt/my_quote.nvim',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = { function() require("my_quote").setup({ site = "zenquotes" }) end }
    },
}
