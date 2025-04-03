local M = {}

function ColorMyEditor()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

M.colorschemes = {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme industry]])
        end
    },
    { "catppuccin/nvim", name = "catppuccin" },
}

return M
