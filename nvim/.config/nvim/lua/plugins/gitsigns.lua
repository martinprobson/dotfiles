return {
        {
                "lewis6991/gitsigns.nvim",
                event = "BufReadPre",
                lazy = false,
                opts = {
                        on_attach = function(buffer)
                          vim.api.nvim_buf_set_keymap(buffer, 'n', 'hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', {})
                          vim.api.nvim_buf_set_keymap(buffer, 'n', 'hb', '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>', {})
                        end,
                },
        },
}
