local keymap = vim.keymap
local Util = require("lazyvim.util")
local set_keymap = vim.api.nvim_set_keymap

-- Borderless terminal
keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "none" })
end, { desc = "Terminal (borderless)" })

-- Borderless lazygit
keymap.set("n", "<leader>gg", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "none" })
end, { desc = "Lazygit (root dir)" })

-- Remove unwanted keymaps
keymap.del({ "n", "i", "v" }, "<A-j>")
keymap.del({ "n", "i", "v" }, "<A-k>")
keymap.del("n", "<C-Left>")
keymap.del("n", "<C-Down>")
keymap.del("n", "<C-Up>")
keymap.del("n", "<C-Right>")

-- Map oil to Leader-, silently and remaplessly
keymap.set("n", "<Leader>-", "<Cmd>Oil<CR>", { silent = true, noremap = true, desc = "Oil" })

-- Resize splits with Alt + direction keys
keymap.set("n", "<A-h>", require("smart-splits").resize_left)
keymap.set("n", "<A-j>", require("smart-splits").resize_down)
keymap.set("n", "<A-k>", require("smart-splits").resize_up)
keymap.set("n", "<A-l>", require("smart-splits").resize_right)

-- Move cursor between splits
keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)

-- Swap buffers between windows
keymap.set("n", "<leader><localleader>h", require("smart-splits").swap_buf_left)
keymap.set("n", "<leader><localleader>j", require("smart-splits").swap_buf_down)
keymap.set("n", "<leader><localleader>k", require("smart-splits").swap_buf_up)
keymap.set("n", "<leader><localleader>l", require("smart-splits").swap_buf_right)

-- Gen.nvim keymaps
keymap.set({ "n", "v" }, "<leader>aa", "<Cmd>Gen Ask<CR>", { silent = true, noremap = true, desc = "Gen Ask" })
keymap.set({ "n", "v" }, "<leader>ac", "<Cmd>Gen Chat<CR>", { silent = true, noremap = true, desc = "Gen Chat" })
keymap.set(
  { "n", "v" },
  "<leader>ae",
  "<Cmd>Gen Enhance_Code<CR>",
  { silent = true, noremap = true, desc = "Gen Enhance" }
)
keymap.set(
  { "n", "v" },
  "<leader>ag",
  "<Cmd>Gen Generate<CR>",
  { silent = true, noremap = true, desc = "Gen Generate" }
)
keymap.set(
  { "n", "v" },
  "<leader>as",
  "<Cmd>Gen Summarize<CR>",
  { silent = true, noremap = true, desc = "Gen Summarize" }
)
