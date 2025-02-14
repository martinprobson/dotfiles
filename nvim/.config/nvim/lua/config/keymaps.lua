--------------------------------------------------------------------------------------
--- telescope
--------------------------------------------------------------------------------------
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
vim.keymap.set('n','<leader>z',function() builtin.find_files({cwd = utils.buffer_dir()}) end, {desc = 'find_file - current buffer'})
vim.keymap.set('n','<leader>e',function() builtin.find_files({}) end, {desc = 'find files'})
vim.keymap.set('n','<leader>b',builtin.buffers, {desc = 'buffers'})
vim.keymap.set('n','<leader>h',builtin.oldfiles, {desc = 'old files'})
vim.keymap.set('n','<leader>g',builtin.git_files, {desc = 'git files'})
vim.keymap.set('n','<leader>s',builtin.live_grep, {desc = 'live grep'})
vim.keymap.set('n','<leader>k',builtin.keymaps, {desc = 'keymaps'})
--
-- Telescope file browser
require('telescope').load_extension 'file_browser'
vim.api.nvim_set_keymap(
  "n",
  "<space>f",
  ":Telescope file_browser<CR>",
  { noremap = true, silent = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>z",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)
--
-- Telescope command history
vim.api.nvim_set_keymap(
  "n",
  "<space>c",
  ":Telescope command_history<CR>",
  { noremap = true }
)

-- Telescope builtins
vim.api.nvim_set_keymap(
  "n",
  "<space>t",
  ":Telescope builtin<CR>",
  { noremap = true }
)
--------------------------------------------------------------------------------------
--- nvim-tree
--------------------------------------------------------------------------------------
map('n','<leader>f',':NvimTreeToggle<CR>',{silent = true })
map('n','<leader>n',':NvimTreeFindFile<CR>',{silent = true })
--------------------------------------------------------------------------------------
--- LSP key mappings
--------------------------------------------------------------------------------------
-- goto definition of object under cursor
map('n','gd',':lua vim.lsp.buf.definition()<CR>',{ silent = true })
-- Show type definition of item under cursor (hover)
map('n','K',':lua vim.lsp.buf.hover()<CR>',{ silent = true })
-- Rename the item under cursor (must goto definition first)
map('n','gn',':lua vim.lsp.buf.rename()<CR>',{ silent = true })
-- Show all references to item under cursor
map('n','gr',':lua vim.lsp.buf.references()<CR>',{ silent = true })
-- Toggle metals tree view pane
map('n','T',':lua require("metals.tvp").toggle_tree_view()<CR>',{ silent = true })
-- diagnostics prev/next
map('n','<C-p>',':lua vim.diagnostic.goto_prev()<CR>',{ silent = true })
map('n','<C-n>',':lua vim.diagnostic.goto_prev()<CR>',{ silent = true })
