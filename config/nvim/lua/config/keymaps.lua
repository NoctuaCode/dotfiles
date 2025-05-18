local set = vim.keymap.set

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
	---@diagnostic disable-next-line: undefined-field
	if vim.opt.hlsearch:get() then
		vim.cmd.nohl()
		return ""
	else
		return "<CR>"
	end
end, { expr = true })

-- Normally these are not good mappings, but I have left/right on my thumb
-- cluster, so navigating tabs is quite easy this way.
set("n", "H", "gT")
set("n", "L", "gt")

set("i", "<C-c>", "<Esc>", { desc = "Return to normal mode" })

set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save file" })
set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })

set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line Down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line Up" })

set("n", "J", "mzJ`z", { desc = "Shrink the line below and keep cursor at the same spot" })
set("n", "<C-d>", "<C-d>zz", { desc = "Move down half screen with cursor on the middle of the screen" })
set("n", "<C-u>", "<C-u>zz", { desc = "Move up half screen with cursor on the middle of the screen" })
set("n", "n", "nzzzv", { desc = "Go to next search occurence with cursor on middle of the screen" })
set("n", "N", "Nzzzv", { desc = "Go to previoius search occurence with cursor on middle of the screen" })

set("x", "<leader>p", [["_dP]], { desc = "Paste in selection without replacing the register" })
set({ "n", "x" }, "<leader>P", [["+p]], { desc = "Paste from system clipboard" })
set({ "n", "x" }, "x", [["_x]], { desc = "Remove caracter without adding it to the register" })
set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into the system clipboard" })
set("n", "<leader>Y", [["+Y]], { desc = "Yank the rest of the line to the system clipboard" })

set("n", "Q", "<nop>", { desc = "Disable maccro triggering" })

set("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
set("n", "<leader>-", "<cmd>split<CR>", { desc = "Horizontal split" })

set("n", "<C-e>", "<cmd>Oil<cr>", { desc = "Oil Explorer" })

set({ "n", "t" }, "<c-/>", function()
	Snacks.terminal()
end, { desc = "Toggle terminal" })

set("n", "<c-[>", "<cmd>cprev<CR>", { desc = "Previous element in the quickfix list" })
set("n", "<c-]>", "<cmd>cnext<CR>", { desc = "Next element in the quickfix list" })
