return {
	{
		'nvim-neotest/neotest',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'antoinemadec/FixCursorHold.nvim',
			'olimorris/neotest-rspec',
			'haydenmeade/neotest-jest',
			'zidhuss/neotest-minitest',
			'mfussenegger/nvim-dap',
			'weilbith/neotest-gradle',
			'nvim-neotest/neotest-go',
		},
		opts = {},
		config = function()
			local neotest = require 'neotest'

			local neotest_jest = require 'neotest-jest' {
				jestCommand = 'npm test --',
			}
			neotest_jest.filter_dir = function(name)
				return name ~= 'node_modules' and name ~= '__snapshots__'
			end

			neotest.setup {
				adapters = {
					require 'neotest-rspec' {
						rspec_cmd = function()
							return vim.tbl_flatten {
								'bundle',
								'exec',
								'rspec',
							}
						end,
					},
					neotest_jest,
					require 'neotest-minitest',
					require 'neotest-go',
				},
				output_panel = {
					enabled = true,
					open = 'botright split | resize 15',
				},
				quickfix = {
					open = false,
				},
			}
		end,
	},
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			{
				'rcarriga/nvim-dap-ui',
				'nvim-neotest/nvim-nio',
				config = function(_, opts)
					local dap = require 'dap'
					local dapui = require 'dapui'
					dap.set_log_level 'INFO'
					dapui.setup(opts)
					dap.listeners.after.event_initialized['dapui_config'] = function()
						dapui.open {}
					end
					dap.listeners.before.event_terminated['dapui_config'] = function()
						dapui.close {}
					end
					dap.listeners.before.event_exited['dapui_config'] = function()
						dapui.close {}
					end
				end,
			},
			{
				'leoluz/nvim-dap-go',
				config = function()
					require('dap-go').setup()
				end,
			},
			{
				'theHamsta/nvim-dap-virtual-text',
				opts = {},
			},
			{
				'jay-babu/mason-nvim-dap.nvim',
				dependencies = 'mason.nvim',
				cmd = { 'DapInstall', 'DapUninstall' },
				opts = {
					automatic_installation = true,
					handlers = {},
					ensure_installed = {
						'delve',
					},
				},
			},
			{ 'jbyuki/one-small-step-for-vimkind', module = 'osv' },
		},
	},
}
