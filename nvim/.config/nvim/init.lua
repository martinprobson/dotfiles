require('user.common')
require('user.options')
require('user.plugins')
--require('user.bufferline')
--require('user.fzf')
require('user.telescope')
--require('user.tmuxline')
require('user.nvim-tree')
require('user.treesitter')
require('user.colorscheme')
require('user.vimwiki')
require('gitsigns').setup()
require('user.lualine')
require('user.lsp')
require('user.cmp')
require('user.indent-guide')
require('user.trouble')
--
-- Map additional leader key on OS-X
--
if vim.fn.has('macunix') == 1 then
  vim.cmd [[
  nmap ` \
  ]]
end
