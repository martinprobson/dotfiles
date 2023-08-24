local builtin = require('telescope.builtin')
vim.keymap.set('n','<leader>e',builtin.find_files, {})
vim.keymap.set('n','<leader>b',builtin.buffers, {})
vim.keymap.set('n','<leader>h',builtin.oldfiles, {})
vim.keymap.set('n','<leader>g',builtin.git_files, {})
vim.keymap.set('n','<leader>s',builtin.live_grep, {})
