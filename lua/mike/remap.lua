vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move a highlighted line up or down 1 line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when removing the line break at the end of a line
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll up and down while staying centered in the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- /searching for words in the file centers the n/N result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- While in highlight mode, delete the highlighted text and paste the yanked text
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Delete into the void
vim.keymap.set("n", "<leader>d", "\"_dP")
vim.keymap.set("v", "<leader>d", "\"_dP")

-- Yank into the system clipboard, awesome
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnect<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")





























































































































































































































