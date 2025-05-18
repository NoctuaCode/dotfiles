return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.bracketed").setup({})
			require("mini.comment").setup({
				options = {
					ignore_blank_line = true,
				},
			})
			require("mini.hipatterns").setup({})
			require("mini.icons").setup({})
			require("mini.operators").setup({})
			require("mini.pairs").setup({
				modes = { insert = true, command = true, terminal = true },
			})
			require("mini.surround").setup()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
