return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require('treesj').setup {--[[ your config ]]
			use_default_keymaps = false,
		}
		vim.keymap.set('n', '<localleader>m', '<CMD>TSJToggle<CR>', { desc = 'Toggle Split/Join' })
	end,
}
