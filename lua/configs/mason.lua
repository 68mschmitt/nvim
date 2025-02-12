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
})

require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'rust_analyzer', 'ts_ls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
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
