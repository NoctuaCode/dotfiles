return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			spec = {
				{ "<leader>a", group = "Harpoon" },
				{ "<leader>b", group = "Buffers" },
				{ "<leader>c", group = "Code" },
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>x", group = "Trouble" },
				{ "<leader>s", group = "Search" },
			},
		},
	},
}
