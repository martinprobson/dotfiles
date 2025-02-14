return {
        {
                "nvim-telescope/telescope-file-browser.nvim",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        "nvim-tree/nvim-web-devicons",
                        "nvim-telescope/telescope.nvim"
                },
                init = function()
                        require("telescope").load_extension("file_browser")
                end,
        },
}
