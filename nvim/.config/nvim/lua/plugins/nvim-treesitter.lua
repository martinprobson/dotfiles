return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- This will run TSUpdate after the plugin is installed
    config = function()
      require("nvim-treesitter.configs").setup {
        modules = {},
        auto_install = false,
        ignore_install = {},
        ensure_installed = {
                    "scala",
                    "lua",
                    "java",
                    "clojure",
                    "vim",
                    "json",
                    "dockerfile",
                    "haskell",
                    "go",
                    "xml",
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
