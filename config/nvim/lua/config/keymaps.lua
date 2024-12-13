vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Hide search highlighting" })
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Return to normal mode" })

vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })

-- vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open Oil explorer" })

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

vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Next element in the quickfix list" })
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Previous element in the quickfix list" })

vim.keymap.set("n", "+", "<C-a>", { desc = "Increase" })
vim.keymap.set("n", "+", "<C-x>", { desc = "Decrease" })

vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>", { desc = "Horizontal split" })
