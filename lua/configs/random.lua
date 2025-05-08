return {
    {
        'alec-gibson/nvim-tetris',
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>tet", function() vim.cmd("Tetris") end )
        end
    },
    {
        'eandrju/cellular-automaton.nvim',
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>mir", function() vim.cmd([[CellularAutomaton make_it_rain]]) end )
            vim.keymap.set("n", "<leader>sbl", function() vim.cmd([[CellularAutomaton scramble]]) end )
            vim.keymap.set("n", "<leader>gol", function() vim.cmd([[CellularAutomaton game_of_life]]) end )
        end
    },
    -- {
    --     'NStefan002/donut.nvim',
    --     lazy = false,
    --     init = function()
    --         vim.keymap.set("n", "<leader>tet", function() vim.cmd([[Tetris]]) end )
    --     end
    -- },
}
