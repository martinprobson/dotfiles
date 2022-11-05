map('n','L',':BufferLineCycleNext<CR>',{ silent = true })
map('n','H',':BufferLineCyclePrev<CR>',{ silent = true })
require("bufferline").setup{ options = {
			offsets = {{filetype = "NvimTree", text = "File Explorer" , text_align = "left" }}
		}
}
