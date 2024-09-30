return {
  {
    'tpope/vim-sleuth',
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Open Fugitive Panel' })
    end,
  },
  {
    'tpope/vim-repeat',
  },
}
