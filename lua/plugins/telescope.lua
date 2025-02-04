return {
	'nvim-telescope/telescope.nvim',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
    require('config.telescopeconfig')
	end
}
