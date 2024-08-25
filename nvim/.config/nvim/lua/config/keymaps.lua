local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

table.insert(opts, { desc = "Toggle Undo Tree" })
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)
