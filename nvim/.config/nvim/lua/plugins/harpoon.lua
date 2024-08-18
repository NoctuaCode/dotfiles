return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon Deez Nuts' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<M-a>', function()
        harpoon:list():select(1)
      end, { desc = 'Go to buffer 1' })
      vim.keymap.set('n', '<M-o>', function()
        harpoon:list():select(2)
      end, { desc = 'Go to buffer 2' })
      vim.keymap.set('n', '<M-e>', function()
        harpoon:list():select(3)
      end, { desc = 'Go to buffer 3' })
      vim.keymap.set('n', '<M-u>', function()
        harpoon:list():select(4)
      end, { desc = 'Go to buffer 4' })
    end,
  },
}
