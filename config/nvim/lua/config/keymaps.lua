-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-c>", "<Esc>", { desc = "Return to normal mode" })

vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>CodeCompanion<CR>", { desc = "Code Companion" })
vim.keymap.set({ "n", "v" }, "<leader>aC", "<cmd>CodeCompanionCmd<CR>", { desc = "Code Companion Command" })
vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionAction<CR>", { desc = "Code Companion Action" })
vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat<CR>", { desc = "Code Companion Chat" })
