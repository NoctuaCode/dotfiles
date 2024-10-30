return {
  'linux-cultist/venv-selector.nvim',
  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
    name = { 'venv', '.venv' },
    auto_refresh = true,
  },
  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>cv', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    { '<leader>cV', '<cmd>VenvSelectCached<cr>' },
  },
}