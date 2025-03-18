return {
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>U", "<cmd>UndotreeToggle<CR>", { desc = "Undotree" })
		end,
	},
}
