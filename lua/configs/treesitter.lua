local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == 'Darwin'
_G.IS_LINUX = OS == 'Linux'
_G.IS_WINDOWS = OS:find 'Windows' and true or false
_G.IS_WSL = IS_LINUX and uname.release:find 'Microsoft' and true or false

if(_G.IS_WINDOWS) then
    require('nvim-treesitter.install').compilers = { 'zig' }
end

require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "regex", "javascript", "typescript", "c_sharp", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "json" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = function()
      if(_G.IS_WINDOWS) then
          return true
      end
      return false
  end,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.vil",
  command = "set filetype=json",
})

vim.cmd([[TSUpdate]])
