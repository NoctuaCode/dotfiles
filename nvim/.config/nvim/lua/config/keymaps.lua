local map = vim.keymap

map.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
map.set("n", "<C-c>", "<Esc>")
map.set("n", "<leader>w", "<Cmd>w<CR>", { noremap = true, silent = true, desc = "Save" })
map.set("n", "<leader>q", "<Cmd>q<cr>", { noremap = true, silent = true, desc = "Quit" })

map.set("n", "<leader>-", "<CMD>Oil<CR>")

map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

map.set("n", "J", "mzJ`z")
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

map.set("x", "<leader>p", [["_dP]])

map.set("n", "Q", "<nop>")

map.set("n", "<leader>qn", "<cmd>cnext<CR>zz")
map.set("n", "<leader>qp", "<cmd>cprev<CR>zz")

map.set("n", "-", "<C-x>", { noremap = true, silent = true })
map.set("n", "+", "<C-a>", { noremap = true, silent = true })

map.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
