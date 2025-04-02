return {
        {
                "nvim-telescope/telescope.nvim",
                lazy = true,
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        "nvim-tree/nvim-web-devicons"
                },
                opts = {
                          defaults = {
                            preview = {
                                hide_on_startup = true
                            },
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
                        },
        },
}

