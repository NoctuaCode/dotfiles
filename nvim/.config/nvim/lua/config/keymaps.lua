local keymap = vim.keymap

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

keymap.set("n", "<leader>U", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = true, desc = "Toggle undotree" })
keymap.set("n", "<leader>S", "<cmd>TSJToggle<cr>", { noremap = true, silent = true, desc = "Toggle split/join" })
