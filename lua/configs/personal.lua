return {
    '68mschmitt/my_quote.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = { function() require("my_quote").setup({ site = "zenquotes" }) end }
}
