--------------------------------------------------------------------------------------
--- telescope
--------------------------------------------------------------------------------------
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
vim.keymap.set('n','<leader>z',function() builtin.find_files({cwd = utils.buffer_dir()}) end, {silent = true, desc = 'Find_file - current buffer'})
vim.keymap.set('n','<leader>e',function() builtin.find_files({}) end, {silent = true, desc = 'Find files'})
vim.keymap.set('n','<leader>b',builtin.buffers, {silent = true, desc = 'Buffers'})
vim.keymap.set('n','<leader>h',builtin.oldfiles, {silent = true, desc = 'Old files'})
vim.keymap.set('n','<leader>g',builtin.git_files, {silent = true, desc = 'Git files'})
vim.keymap.set('n','<leader>s',builtin.live_grep, {silent = true, desc = 'Live grep'})
vim.keymap.set('n','<leader>k',builtin.keymaps, {silent = true, desc = 'Keymaps'})
--
-- Telescope file browser
require('telescope').load_extension 'file_browser'
vim.api.nvim_set_keymap(
  "n",
  "<space>f",
  ":Telescope file_browser<CR>",
  { noremap = true, silent = true, desc = 'Open file browser' }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>z",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true, silent = true, desc = 'Open file browser - cwd' }
)
--
-- Telescope command history
vim.api.nvim_set_keymap(
  "n",
  "<space>c",
  ":Telescope command_history<CR>",
  { noremap = true, silent = true, desc = 'Command history' }
)

-- Telescope builtins
vim.api.nvim_set_keymap(
  "n",
  "<space>t",
  ":Telescope builtin<CR>",
  { noremap = true, silent = true, desc = 'Telescope builtins' }
)
--------------------------------------------------------------------------------------
--- nvim-tree
--------------------------------------------------------------------------------------
map('n','<leader>f',':NvimTreeToggle<CR>',{silent = true, desc = 'NvimTreeToggle' })
map('n','<leader>n',':NvimTreeFindFile<CR>',{silent = true, desc = 'NvimTree find file in tree' })
--------------------------------------------------------------------------------------
--- LSP key mappings
--------------------------------------------------------------------------------------
-- goto definition of object under cursor
map('n','gd',':lua vim.lsp.buf.definition()<CR>',{ silent = true, desc = 'Goto definition' })
-- Show type definition of item under cursor (hover)
map('n','K',':lua vim.lsp.buf.hover()<CR>',{ silent = true, desc = 'Show type information' })
-- Rename the item under cursor (must goto definition first)
map('n','gn',':lua vim.lsp.buf.rename()<CR>',{ silent = true, desc = 'Rename item' })
-- Show all references to item under cursor
map('n','gr',':lua vim.lsp.buf.references()<CR>',{ silent = true, desc = 'Show all references' })
-- Toggle metals tree view pane
map('n','T',':lua require("metals.tvp").toggle_tree_view()<CR>',{ silent = true, desc = 'Toggle metals tree view' })
-- diagnostics prev/next
map('n','<C-p>',':lua vim.diagnostic.goto_prev()<CR>',{ silent = true, desc = 'Previous diagnostic' })
map('n','<C-n>',':lua vim.diagnostic.goto_prev()<CR>',{ silent = true, desc = 'Next diagnostic' })
