return {
    {
        "williamboman/mason.nvim",
            lazy = false,
            config = function()
                require("mason").setup()
            end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true
        },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { "html","lua_ls", "clangd", "jsonls", "pyright", "angularls", "eslint", "tailwindcss", "omnisharp", "ast_grep" },
            })
        end
    }
}
