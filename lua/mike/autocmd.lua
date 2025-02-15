-- Auto command to register .vil (Vial QMK for keyboard) files
vim.cmd([[ augroup _vil autocmd! autocmd BufRead,BufEnter *.vil set filetype=vil augroup end ]])

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
})
