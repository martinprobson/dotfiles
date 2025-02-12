require('trouble').setup()
--
-- Key mappings for the trouble plugin
--
-- Toggle trouble window ....
map('n','<leader>t',':Trouble diagnostics toggle<CR>',{ silent = true })
