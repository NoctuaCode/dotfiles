return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>-", require("oil").open, { desc = "Open Oil" })
	end,
}
