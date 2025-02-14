require('nvim-treesitter.install').compilers = { 'zig' }

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "javascript", "typescript", "c_sharp", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "json" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.treesitter.language.register('json', 'vil')
vim.cmd([[TSUpdate]])
