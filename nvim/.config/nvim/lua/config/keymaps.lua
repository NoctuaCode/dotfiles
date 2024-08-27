local keymap = vim.keymap

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = true, desc = "Toggle undotree" })
