return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      { 'yavorski/lualine-macro-recording.nvim' },
    },
    event = 'VeryLazy',
    opts = {
      sections = {
        lualine_c = { 'macro_recording', '%s' },
      },
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
    },
  },
}
