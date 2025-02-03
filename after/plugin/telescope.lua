local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope all file search' })
vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = 'Telescope Git File Search' })
vim.keymap.set('n', '<leader>fa', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
