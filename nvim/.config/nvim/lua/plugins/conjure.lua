return {
        {
                "Olical/conjure",
                lazy = false,
                init = function()
                        vim.cmd [[
                        let g:conjure#filetype#scheme = "conjure.client.guile.socket"
                        let  g:conjure#client#guile#socket#pipename = "/home/martinr/guile.repl.socket"
                        ]]
                end,
        },
}

--return {
--        {
--                "Olical/conjure",
--                lazy = false,
--        },
--}
--return {
--  {
--    "Olical/conjure",
--    lazy = false,
--    dependencies = {
--      "tpope/vim-repeat",
--      "guns/vim-sexp",
--      "tpope/vim-sexp-mappings-for-regular-people",
--      "tpope/vim-surround"
--    },
--  },
--}
