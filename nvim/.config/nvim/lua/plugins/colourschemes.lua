-- Other colourschemes
--                "morhetz/gruvbox",
--                "savq/melange-nvim",
--                "folke/tokyonight.nvim",
--                "xiantang/darcula-dark.nvim",
--                "lunarvim/darkplus.nvim",
--                "rebelot/kanagawa.nvim",

return {
        {
            "EdenEast/nightfox.nvim",
            lazy = false,
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
            },
            priority = 1000,
            config = function()
                vim.cmd([[colorscheme nightfox ]])
            end,
        }
}
