return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        codestral = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "Codestral",
            schema = {
              model = {
                default = "codestral",
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
        mistral_small = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "Mistral Small",
            schema = {
              model = {
                default = "mistral-small",
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
        mixtral = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "Mixtral",
            schema = {
              model = {
                default = "mixtral:8x7b",
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
          adapter = "codestral",
        },
      },
    },
  },
}
