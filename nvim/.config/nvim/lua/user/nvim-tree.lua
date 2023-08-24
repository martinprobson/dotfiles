require("nvim-tree").setup{
	respect_buf_cwd = true,
	view = {
		adaptive_size = true,
		side = "left"},
		}
map('n','<leader>f',':NvimTreeToggle<CR>',{silent = true })
map('n','<leader>n',':NvimTreeFindFile<CR>',{silent = true })
