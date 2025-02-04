local servers = { "html", "cssls", "omnisharp", "clangd", "lua_ls" }
print("hello")
local on_attach = function(client,bufnr)
	local bufopts = {noremap = true, silent = true,buffer=bufnr}
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
	if client.name == "gopls" then
	  vim.api.nvim_create_augroup("LSPAutocommands",{clear=true})
	  vim.api.nvim_create_autocmd("BufWritePre",{
	    group = "LSPAutocommands",
	    pattern = "*.go",
	    callback = function()
	      vim.lsp.buf.format({async = true})
	    end,
	  })
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

require("config.omnisharpconfig")
