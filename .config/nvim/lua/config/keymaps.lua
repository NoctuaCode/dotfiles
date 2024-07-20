local keymap = vim.keymap

keymap.set("n", "<M-+>", "<C-a>", { desc = "Increment" })
keymap.set("n", "<M-->", "<C-x>", { desc = "Decrement" })

-- Undo tree
keymap.set("n", "<leader>cu", ":UndotreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle undotree" })

-- TreesJ
keymap.set("n", "gS", require("treesj").toggle, { noremap = true, silent = true, desc = "TreesJ Toggle" })
