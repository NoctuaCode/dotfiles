return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.ai").setup()
      require("mini.align").setup()
      require("mini.basics").setup()
      require("mini.bracketed").setup()
      require("mini.comment").setup()
      require("mini.icons").setup()
      require("mini.indentscope").setup()
      require("mini.pairs").setup()
      require("mini.splitjoin").setup()
      require("mini.statusline").setup()
      require("mini.surround").setup()
    end,
  },
}
