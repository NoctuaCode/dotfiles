return {
	{
		'folke/tokyonight.nvim',
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			vim.cmd.hi 'Comment gui=none'
		end,
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		init = function()
			vim.cmd.colorscheme 'rose-pine'
		end,
	},
}
