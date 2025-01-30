return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup {}
      require('mini.bracketed').setup {}
      require('mini.comment').setup {
        options = {
          ignore_blank_line = true,
        },
      }
      require('mini.files').setup {}
      require('mini.hipatterns').setup {}
      require('mini.icons').setup {}
      require('mini.jump').setup {}
      require('mini.operators').setup {}
      require('mini.pairs').setup {
        modes = { insert = true, command = true, terminal = true },
      }
      require('mini.splitjoin').setup {}
      require('mini.statusline').setup {}
      require('mini.surround').setup {
        search_method = 'cover_or_next',
      }
    end,
  },
}
