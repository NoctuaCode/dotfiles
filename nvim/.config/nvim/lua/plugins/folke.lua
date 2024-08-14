return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup {
        icons = false,
      }

      vim.keymap.set('n', '<leader>tt', function()
        require('trouble').toggle()
      end, { desc = '[T]oggle [T]trouble' })

      vim.keymap.set('n', '[t', function()
        require('trouble').next { skip_groups = true, jump = true }
      end)

      vim.keymap.set('n', ']t', function()
        require('trouble').previous { skip_groups = true, jump = true }
      end)
    end,
  },
}
