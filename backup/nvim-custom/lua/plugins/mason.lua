return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        },
        config = function()
            require("mason").setup()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "lua-language-server",
                    "gopls",
                    "pyright",
                    "typescript-language-server",
                    "tailwindcss-language-server",
                    "intelephense",
                    "stylua",
                    "prettierd",
                    "prettier",
                    "eslint_d",
                    "isort",
                    "black",
                },
            })
        end,
    },
}
