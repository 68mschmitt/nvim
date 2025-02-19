vim.opt.signcolumn = 'no'

local lspconfig_defaults = require('lspconfig').util.default_config

lspconfig_defaults.capabilities =
    vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
    )

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
