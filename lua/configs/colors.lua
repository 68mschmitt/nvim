local M = {}

function ColorMyEditor()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

M.colorschemes = {
    { "EdenEast/nightfox.nvim", name = "nightfox" },
    { "catppuccin/nvim",        name = "catppuccin" },
    { "kepano/flexoki-neovim",  name = "flexoki" },
}

return M
