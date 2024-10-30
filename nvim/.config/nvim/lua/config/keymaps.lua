local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")
local set_keymap = vim.api.nvim_set_keymap

-- Borderless terminal
vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "none" })
end, { desc = "Term with border" })

-- Borderless lazygit
vim.keymap.set("n", "<leader>gg", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "none" })
end, { desc = "Lazygit (root dir)" })

keymap.del({ "n", "i", "v" }, "<A-j>")
keymap.del({ "n", "i", "v" }, "<A-k>")
keymap.del("n", "<C-Left>")
keymap.del("n", "<C-Down>")
keymap.del("n", "<C-Up>")
keymap.del("n", "<C-Right>")

keymap.set("n", "<Leader>-", "<Cmd>Oil<CR>", { silent = true, noremap = true, desc = "Oil" })

vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><localleader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><localleader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><localleader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><localleader>l", require("smart-splits").swap_buf_right)
