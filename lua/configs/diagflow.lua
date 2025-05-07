return {
    "dgagn/diagflow.nvim",
    enabled = true,
    config = function()
        require('diagflow').setup({
            scope = 'line',
            show_borders = true,
            placement = "top",
        })
    end,
}
