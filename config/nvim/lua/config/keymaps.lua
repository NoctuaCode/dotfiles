vim.keymap.set("n", "<leader>m", function()
  require("treesj").toggle()
end, { desc = "Toggle Treesj" })
