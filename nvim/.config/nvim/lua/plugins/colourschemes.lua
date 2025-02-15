return {
        {
                "savq/melange-nvim",
                lazy = false,
                priority = 1000,
                config = function()
                        vim.cmd([[colorscheme melange]])
                end,
        },
}
-- Other colourschemes
--                "morhetz/gruvbox",
--                "savq/melange-nvim",
--                "folke/tokyonight.nvim",
--                "lunarvim/darkplus.nvim",
