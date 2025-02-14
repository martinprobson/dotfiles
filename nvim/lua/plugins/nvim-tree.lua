return {
        {
                "kyazdani42/nvim-tree.lua",
                lazy = true,
                opts = {
                  respect_buf_cwd = true,
                  view = {
                    adaptive_size = true,
                    side = "left"
                  },
                },
                cmd = 'NvimTree',
                keys = {
                  { '<leader>f', ':NvimTreeToggle<CR>', desc = 'NvimTree reveal', silent = true }
                },
        },
}
