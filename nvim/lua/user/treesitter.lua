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
    "bash",
		"vim",
		"lua",
		"json",
		"dockerfile",
		"haskell",
    "go",
		"bash"
  },
}
