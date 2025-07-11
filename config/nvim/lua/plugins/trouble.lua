return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
			})

			vim.keymap.set("n", "<leader>xx", function()
				require("trouble").toggle()
			end)

			vim.keymap.set("n", "[x", function()
				require("trouble").next({ skip_groups = true, jump = true })
			end)

			vim.keymap.set("n", "]x", function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end)
		end,
	},
}
