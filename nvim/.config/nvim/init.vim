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
" Not needed for neovim
set nocompatible 
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
set number relativenumber      	        	" Vim absolute and relative line numbers
set noshowmode				    " Do not show mode on last line (airline does this on status line)
set hlsearch				    " highlight all search matches
set wildmenu				    " enhanced command line completion 
set path+=**
set showmatch				    " show matched brackets
set modeline
set ignorecase smartcase
" List buffers with \b
nnoremap <silent> <leader>b :ls<CR>
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
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Open netrw in vsplit with \f
nnoremap <silent> <leader>f :Vex.<CR>
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
" Scala support (see help scala)
Plug 'derekwyatt/vim-scala'
" Haskell vim support
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
" Markdown support
Plug 'https://github.com/suan/vim-instant-markdown.git'
" vimwiki 
Plug 'vimwiki/vimwiki'
call plug#end()
" }}}
" {{{COLOURS/STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOUR SCHEME/STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='medium'
let g:airline_theme='zenburn'
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
