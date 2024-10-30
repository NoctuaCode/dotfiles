return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      skip_confirm_for_simple_edits = true,
      lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = true,
      },
      watch_for_changes = true,
    },
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
}
