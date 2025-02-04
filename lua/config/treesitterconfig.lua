local config = require("nvim-treesitter.configs")
require('nvim-treesitter.install').conpilers = { "gcc", "zig" }
config.setup({
	ensure_installed = { "javascript", "typescript", "c_sharp", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = { enable = true },
})
