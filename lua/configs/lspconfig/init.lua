-- LSP CONFIG --

vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●" },
    ---@diagnostic disable-next-line: assign-type-mismatch
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignHint",
        },
    },
})

return
{
    {
        "mason-org/mason-lspconfig.nvim",
        opts = { 
            handlers = { vim.lsp.enable },
        },
        event = { "BufReadPre", "BufNewFile" },
        dependencies =
        {
            { "neovim/nvim-lspconfig" },
            {
                "mason-org/mason.nvim",
                opts = 
                {
                    registries = {
                        "github:mason-org/mason-registry",
                        "github:Crashdummyy/mason-registry",
                    },
                },
                cmd = "Mason",
                dependencies = { "roslyn.nvim" }
            },
        },
    },
    { "seblyng/nvim-lsp-extras" },
    { "b0o/schemastore.nvim", lazy = true },
    { "onsails/lspkind.nvim", lazy = true },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts =
        {
            library =
            {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "${3rd}/busted/library" },
                { path = "${3rd}/luassert/library" },
                { path = "snacks.nvim", words = { "Snacks" } },
                { path = "nvim-test" },
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "prettier",
                "roslyn",
                "lua_ls",
                "clangd",
                "rust-analyzer",
            },
            auto_update = true,
        }
    },
}
