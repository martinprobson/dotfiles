-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
require("config.lazy")
require("config.keymaps")
require('java').setup()
require('lspconfig').jdtls.setup({})
--require("scratch")

if vim.fn.has('macunix') == 1 then
  vim.cmd [[
    nmap ` \
  ]]
end
