local M = {}

M.DebugLsp = function()
    vim.lsp.set_log_level(vim.log.levels.DEBUG)
    vim.lsp.log.set_format_func(vim.inspect)
end

M.isWindows = function()
    local platform = vim.loop.os_uname().sysname
    return platform == "Windows_NT"
end

return M
