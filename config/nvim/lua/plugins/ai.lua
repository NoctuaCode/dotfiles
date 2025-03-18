return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				qwen = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "Qwen2.5 Coder 14B Instruct",
						schema = {
							model = {
								default = "qwen2.5-coder:14b-instruct-q5_K_S",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
				deepseek = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "Deepseek Coder 32B",
						schema = {
							model = {
								default = "Mrs_peanutbutt3r/deepseek-r1-coder-tools:32b",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "qwen",
				},
			},
		},
	},
}
