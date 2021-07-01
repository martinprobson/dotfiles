" vim:fdm=marker
"                                                
"                                                
"██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"
" https://github.com/martinprobson/dotfiles/tree/master/nvim/.config/nvim
"                                                
"
" {{{GENERAL
"
" Syntax highlighting
syntax enable
" Turn off sounds
set belloff=all
" Allow buffer switching without saving first
set hidden
"
inoremap jj <ESC> 			" Map jj to Esc
tnoremap <Esc> <C-\><C-n> 		" Map Esc/jj in terminal mode
tnoremap jj <C-\><C-n>
set number relativenumber      	            " Vim absolute and relative line numbers
set noshowmode				    " Do not show mode on last line (airline does this on status line)
set hlsearch				    " highlight all search matches
set wildmenu				    " enhanced command line completion 
set path+=**
set showmatch				    " show matched brackets
set modeline
set ignorecase smartcase
if (has("termguicolors"))
	set termguicolors
endif
" List buffers with \b
"nnoremap <silent> <leader>b :ls<CR>:b<Space>
nnoremap <C-e> :ls<CR>:b<Space>
autocmd BufNewFile,BufRead *.scala set path+=**
" }}}
" {{{netrw
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
filetype plugin on
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
" }}}
" {{{plugins
"
" Plugins
"
call plug#begin(stdpath('data') . '/plugged')
" colour scheme
Plug 'https://github.com/morhetz/gruvbox'
" Status line 
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'GEverding/vim-hocon'
" Markdown support
Plug 'https://github.com/suan/vim-instant-markdown.git'
" vimwiki 
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf' , { 'do' : { -> fzf#install () } }
Plug 'junegunn/fzf.vim'
"
" Enable Language server/metals if we have NVIM 0.5
"
if has('nvim-0.5')
	Plug 'neovim/nvim-lspconfig'
	Plug 'scalameta/nvim-metals'
	Plug 'haorenW1025/completion-nvim'
	Plug 'haorenW1025/diagnostic-nvim'
endif
call plug#end()
" }}}
" {{{fzf.vim
nnoremap <silent><leader>b :FZF<CR>
" }}}
" {{{vim-signify
" Default updatetime of 4000ms is not good for async update
set updatetime=100
nnoremap <silent> <leader>st :SignifyToggleHighlight<CR>
nnoremap <silent> <leader>sd :SignifyHunkDiff<CR>
" }}}
" {{{NerdTree
nnoremap <silent> <leader>f :NERDTreeToggle<CR>
" }}}
" {{{CTRL-P
let g:ctrlp_map = '<c-e>'
let g:ctrlp_cmd = 'CtrlPBuffer'
" }}}
" {{{COLOURS/STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOUR SCHEME/STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='medium'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
colorscheme gruvbox
" }}}
" {{{VIMWIKI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMWIKI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For vimwiki to use markdown syntax
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }
let g:vimwiki_list = [{'path' : '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" }}}
" {{{Markdown Preview
" Instant markdown preview
let g:instant_markdown_autostart = 0
map <leader>md :InstantMarkdownPreview
" }}}
" {{{Language server config
"
" Language server config
"
if has('nvim-0.5')
augroup lsp
au!
au FileType scala,sbt lua require('metals').initialize_or_attach({})
augroup end
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
autocmd Filetype scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
"
"

:lua << EOF
  metals_config = require'metals'.bare_config
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

  metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = '',
      }
    }
  )
EOF

let g:diagnostic_enable_virtual_text = 0
nnoremap <silent> [c          :NextDiagnostic<CR>
nnoremap <silent> ]c          :PrevDiagnostic<CR>
nnoremap <silent> go          :OpenDiagnostic<CR>
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
" Set maxmimum number of signs to show in signcolumn
set signcolumn=auto:5
endif
" }}}
