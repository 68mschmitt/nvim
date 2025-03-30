local autocmd = vim.api.nvim_create_autocmd
local augroups = require('mike.utils').augroups

autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = augroups.yank,
    callback = function() require("vim.hl").on_yank({ higroup = "Substitute", timeout = 200 }) end,
})

autocmd("FileType", {
    group = augroups.mike,
    pattern = "cs",
    command = "compiler dotnet",
})

autocmd("LspAttach", {
    desc = "LSP options and keymaps",
    group = augroups.lsp.attach,
    callback = function(event)
        local id = vim.tbl_get(event, "data", "client_id")
        local client = id and vim.lsp.get_client_by_id(id)

        if not client then return end

        require("mike.keymaps.lsp").setup(client, event.buf)

        if client.supports_method("textDocument/codeLens") then
            autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                buffer = event.buf,
                callback = function(ev) vim.lsp.codelens.refresh({ bufnr = ev.buf }) end,
            })
        end

        if client.supports_method("textDocument/documentHighlight") then
            autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = augroups.lsp.highlight,
                callback = vim.lsp.buf.document_highlight,
            })

            autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = augroups.lsp.highlight,
                callback = vim.lsp.buf.clear_references,
            })

            autocmd("LspDetach", {
                group = augroups.lsp.detach,
                buffer = event.buf,
                callback = function(ev)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "UserLspHighlight", buffer = ev.buf })
                end,
            })
        end

        if client.supports_method("textDocument/formatting") then
            autocmd("BufWritePre", {
                buffer = event.buf,
                group = augroups.lsp.efm,
                callback = function(_)
                    vim.lsp.buf.format({ async = true })
                end,
            })
        end
    end,
})
