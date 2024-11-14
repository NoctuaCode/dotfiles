return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
    })
    vim.keymap.set(
      "n",
      "gm",
      "<Cmd>lua require('treesj').toggle()<CR>",
      { noremap = true, silent = true, desc = "Split/Join" }
    )
  end,
}
