return {
        {
                "folke/tokyonight.nvim",
                lazy = false,
                priority = 1000,
                config = function() 
                        vim.cmd([[colorscheme tokyonight]])
                end,
        },
}
-- Other colourschemes
--                "morhetz/gruvbox",
--                "savq/melange-nvim",
--                "folke/tokyonight.nvim",
--                "lunarvim/darkplus.nvim",
