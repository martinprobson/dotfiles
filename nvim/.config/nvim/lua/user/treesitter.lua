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
		"java",
		"vim",
		"lua",
		"json",
		"dockerfile",
		"haskell",
		"bash"
  },
}
