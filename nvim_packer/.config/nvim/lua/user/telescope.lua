local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
vim.keymap.set('n','<leader>z',function() builtin.find_files({cwd = utils.buffer_dir()}) end, {desc = 'find_file - current buffer'})
vim.keymap.set('n','<leader>e',function() builtin.find_files({}) end, {desc = 'find files'})
vim.keymap.set('n','<leader>b',builtin.buffers, {desc = 'buffers'})
vim.keymap.set('n','<leader>h',builtin.oldfiles, {desc = 'old files'})
vim.keymap.set('n','<leader>g',builtin.git_files, {desc = 'git files'})
vim.keymap.set('n','<leader>s',builtin.live_grep, {desc = 'live grep'})
vim.keymap.set('n','<leader>k',builtin.keymaps, {desc = 'keymaps'})
require('telescope').setup{
  defaults = {
    wrap_results = false,
    winblend = 0

    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- ..
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true
    }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
--
-- Telescope file browser
require('telescope').load_extension 'file_browser'
vim.api.nvim_set_keymap(
  "n",
  "<space>f",
  ":Telescope file_browser<CR>",
  { noremap = true }
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
 
