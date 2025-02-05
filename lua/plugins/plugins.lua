return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        lazy = false,
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
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
            require("configs/nvim-dap")
        end
    },

    {
        'seblj/roslyn.nvim',
        lazy = false,
        ft = "cs",
        opts = {
            -- your configuration comes here; leave empty for default settings
            require('configs.roslyn')
        },
        init = function()
            vim.keymap.set("n", "<leader>ds", function()
                if not vim.g.roslyn_nvim_selected_solution then
                    return vim.notify("No solution file found")
                end

                local projects = require("roslyn.sln.api").projects(vim.g.roslyn_nvim_selected_solution)
                local files = vim.iter(projects)
                    :map(function(it)
                        return vim.fs.dirname(it)
                    end)
                    :totable()

                local root = vim.fs.root(0, ".git") or vim.fs.dirname(vim.g.roslyn_nvim_selected_solution)

                require("telescope.pickers")
                    .new({}, {
                        cwd = root,
                        prompt_title = "Find solution files",
                        finder = require("telescope.finders").new_oneshot_job(
                            vim.list_extend({ "fd", "--type", "f", "." }, files),
                            { entry_maker = require("telescope.make_entry").gen_from_file({ cwd = root }) }
                        ),
                        sorter = require("telescope.config").values.file_sorter({}),
                        previewer = require("telescope.config").values.grep_previewer({}),
                    })
                    :find()
            end)
        end,
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
