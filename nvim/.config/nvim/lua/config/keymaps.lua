vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-c>', '<Esc>')

vim.keymap.set('n', '<leader>-', '<CMD>Oil<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')

vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Next loclist' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Prev loclist' })
