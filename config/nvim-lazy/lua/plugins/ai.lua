return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        qwent = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "Qwen2.5 Coder Instruct",
            schema = {
              model = {
                default = "qwen2.5-coder:32b-instruct-q5_K_S",
              },
              num_ctx = {
                default = 16384,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "qwent",
        },
      },
    },
  },
}
