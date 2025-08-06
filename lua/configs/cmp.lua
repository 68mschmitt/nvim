return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'L3MON4D3/LuaSnip'
    },
    version = '*',
    opts = {
        keymap = { preset = 'default' },
        completion = {
            autocomplete = false,
        },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' }
        },
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
        require("blink.cmp").setup(opts)
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = vim.fn.stdpath("config") .. "/snippets/"
        })
    end
}
