require('gitsigns').setup{
        on_attach = function(bufnr)
          -- Setup keymaps
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', {})
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'hb', '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', {})
          -- More keymaps
        end
}
