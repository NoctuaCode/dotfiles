-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-c>", "<Esc>", { desc = "Return to normal mode" })

vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>CodeCompanion<CR>", { desc = "Code Companion" })
vim.keymap.set({ "n", "v" }, "<leader>aC", "<cmd>CodeCompanionCmd<CR>", { desc = "Code Companion Command" })
vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionAction<CR>", { desc = "Code Companion Action" })
vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat<CR>", { desc = "Code Companion Chat" })

vim.keymap.set("n", "<M-f>", function()
  Snacks.picker.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<M-b>", function()
  Snacks.picker.buffers()
end, { desc = "Find files" })

vim.keymap.set("n", "<M-e>", function()
  Snacks.explorer.open()
end, { desc = "File explorer" })

vim.keymap.set("n", "<M-S-e>", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "File explorer (Mini)" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line Up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Shrink the line below and keep cursor at the same spot" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half screen with cursor on the middle of the screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half screen with cursor on the middle of the screen" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Go to next search occurence with cursor on middle of the screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to previoius search occurence with cursor on middle of the screen" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste in selection without replacing the register" })
vim.keymap.set({ "n", "x" }, "<leader>P", [["+p]], { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "x", [["_x]], { desc = "Remove caracter without adding it to the register" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into the system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank the rest of the line to the system clipboard" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable maccro triggering" })

vim.keymap.set("n", "+", "<C-a>", { desc = "Increase" })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrease" })

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })
