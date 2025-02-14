-- Auto command to register .vil (Vial QMK for keyboard) files
vim.cmd([[ augroup _vil autocmd! autocmd BufRead,BufEnter *.vil set filetype=vil augroup end ]])
