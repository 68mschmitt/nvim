require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    registries = {
        'github:mason-org/mason-registry',
        'github:crashdummyy/mason-registry',
    },
    max_concurrent_installers = 1,
})

require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'ts_ls', 'jsonls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        ["jsonls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.jsonls.setup {
                settings = {
                    filetypes = { 'json', 'vil' }
                }
            }
        end,
        ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
        end
    },
})

vim.cmd([[ augroup _vil autocmd! autocmd BufRead,BufEnter *.vil set filetype=vil augroup end ]])
