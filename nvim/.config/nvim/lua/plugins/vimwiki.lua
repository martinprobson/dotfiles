return {
        {
                "vimwiki/vimwiki",
                lazy = false,
                init = function()
                        vim.cmd [[
                        let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }
                        let g:vimwiki_list = [{'path' : '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
                        let g:vimwiki_listsyms = '✗○◐●✓'
                        ]]
                end,
        },
}

