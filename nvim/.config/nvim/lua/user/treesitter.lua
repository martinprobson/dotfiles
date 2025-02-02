require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
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
}
