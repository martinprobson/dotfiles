require('user.common')
require('user.options')
require('user.plugins')
require('user.telescope')
require('user.nvim-tree')
require('user.treesitter')
require('user.colorscheme')
require('user.vimwiki')
require('user.gitsigns')
require('user.lualine')
require('user.lsp')
require('user.cmp')
require('user.indent-guide')
require('user.trouble')
require('user.tmuxline')
--
-- Map additional leader key on OS-X
--
if vim.fn.has('macunix') == 1 then
  vim.cmd [[
  nmap ` \
  ]]
end
