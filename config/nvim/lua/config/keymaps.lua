vim.keymap.set("n", "<space>m", function()
  require("treesj").toggle()
end, { desc = "Toggle Treesj" })
