return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		opts = {
			servers = {
				lua_ls = {},
				gopls = {},
				pyright = {},
				ts_ls = {},
				tailwindcss = {},
				intelephense = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
			local map = function(keys, func, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, keys, func, { desc = desc })
			end

			map("gd", "<cmd>FzfLua lsp_definitions<CR>", "Goto Definition")
			map("gD", "<cmd>FzfLua lsp_declaration<CR>", "Goto Declaration")
			map("gr", "<cmd>FzfLua lsp_references<CR>", "Goto References")
			map("gI", "<cmd>FzfLua lsp_implementations<CR>", "Goto Implementations")
			map("<leader>cd", "<cmd>FzfLua lsp_typdefs<CR>", "Type Definition")
			map("<leader>cs", "<cmd>FzfLua lsp_document_symbols<CR>", "Document Symbols")
			map("<leader>cS", "<cmd>FzfLua lsp_workspace_symbols<CR>", "Workspace Symbols")
			map("<leader>cr", vim.lsp.buf.rename, "Rename")
			map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
		end,
	},
}
