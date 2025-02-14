require("lazy").setup({{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = {
                    "scala",
                    "lua",
                    "java",
                    "vim",
                    "json",
                    "dockerfile",
                    "haskell",
                    "go",
                    "bash"
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }})
