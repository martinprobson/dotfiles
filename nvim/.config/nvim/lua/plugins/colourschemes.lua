-- Other colourschemes
--                "morhetz/gruvbox",
--                "savq/melange-nvim",
--                "folke/tokyonight.nvim",
--                "xiantang/darcula-dark.nvim",
--                "lunarvim/darkplus.nvim",

return {
        {
            "xiantang/darcula-dark.nvim",
            lazy = false,
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
            },
            priority = 1000,
            config = function()
                vim.cmd([[colorscheme darcula-dark]])
            end,
        }
}
