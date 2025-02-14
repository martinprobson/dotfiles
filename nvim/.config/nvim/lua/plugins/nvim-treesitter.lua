return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- This will run TSUpdate after the plugin is installed
    config = function()
      require("nvim-treesitter.configs").setup {
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
        highlight = {
          enable = true, -- Enable highlighting
          additional_vim_regex_highlighting = false, -- Disable regex highlighting (may cause issues)
        },
        indent = { enable = true },
        sync_install = false,
      }
    end,
  },
}
