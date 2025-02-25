return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "tweekmonster/django-plus.vim",
      "HallerPatrick/py_lsp.nvim",
    },
    config = function()
      require("py_lsp").setup({
        language_server = "pylsp",
        source_strategies = { "poetry", "default", "system" },
        on_attach = LazyVim.lsp.on_attach,
        pylsp_plugins = {
          autopep8 = {
            enabled = true,
          },
          pyls_mypy = {
            enabled = true,
          },
          pyls_isort = {
            enabled = true,
          },
          flake8 = {
            enabled = true,
            executable = ".venv/bin/flake8",
          },
        },
      })
    end,
  },
}
