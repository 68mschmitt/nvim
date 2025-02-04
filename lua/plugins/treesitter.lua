return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require('config.treesitterconfig')
    end
  },
  {
    'nvim-treesitter/playground',
    lazy = false,
    config = function() end
  }
}
