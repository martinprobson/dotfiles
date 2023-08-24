-----------------------------------------------------------------------------
--- Language server config
-----------------------------------------------------------------------------
--
-- javascript/ typescript setup
--
require'lspconfig'.tsserver.setup{}
--
-- golang setup
--
vim.cmd [[
"-- Show GoDoc in a popup window
let g:go_doc_popup_window = 1
augroup gobindings
	autocmd! gobindings
	"-- GoRun
	autocmd FileType go nmap <buffer><leader>gr <Plug>(go-run-split)
	"-- go-test
	autocmd FileType go nmap <buffer><leader>gt <Plug>(go-test)
	"-- go-build
	autocmd FileType go nmap <buffer><leader>gb <Plug>(go-build)
	"-- go-fmt
	autocmd FileType go nmap <buffer><leader>gf <Plug>(go-fmt)
	"-- go-lint
	autocmd FileType go nmap <buffer><leader>gl <Plug>(go-lint)
augroup end
"-- Turn of the default keymapping for GoDoc (K) 
let g:go_doc_keywordprg_enabled = 0
]]
--require'lspconfig'.gopls.setup{}
--vim.cmd [[
--autocmd Filetype go setlocal omnifunc=v:lua.vim.lsp.omnifunc
--]]
--
-- metals (scala)
--
metals_config = require'metals'.bare_config()
metals_config.init_options.statusBarProvider = "on"
metals_config.settings = {
   showImplicitArguments = true,
   excludedPackages = {
     "akka.actor.typed.javadsl",
     "com.github.swagger.akka.javadsl"
   }
}

metals_config.on_attach = function()
  require'completion'.on_attach();
end
vim.cmd [[
augroup lsp
au!
au FileType scala,sbt,java lua require('metals').initialize_or_attach({metals_config})
au FileType haskell lua require'lspconfig'.hls.setup{}
au FileType go,golang lua require'lspconfig'.gopls.setup{}
augroup end
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gD 		<cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" SHow the full worksheet output
"nnoremap <silent> K     <cmd>lua require("metals").hover_worksheet()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> T     <cmd>lua require("metals.tvp").toggle_tree_view()<CR>
" Does not work
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_next()<CR>
autocmd Filetype scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufWritePre *.scala lua vim.lsp.buf.format(nil, 100)
]]
--
--
-- Haskell Language Server setup
require'lspconfig'.hls.setup{}
--
-- Do not show diagnostics, just use underlines and use CTRL-P/CTRL-N to show
-- the virtual text.
--
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, { 
		underline = true,
		virtual_text = true,
		signs = true,
		update_in_insert = true, 
		}
	)


