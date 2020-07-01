"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ author ▓ Martin Robson (martinprobson@gmail.com)
" ░▓ code   ▓ https://github.com/martinprobson/dotfiles
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░
"
set noshowmode      " Do not show mode on last line (airline does this on status line)
set hlsearch        " highlight all search matches
set wildmenu        " enhanced command line completion 
set modeline        " Allow use of modelines
set showmatch 	    " show matched brackets
set autochdir
set hidden
" Vim absolute and relative line numbers
" Use Hybrid line numbers and switch between hybrid and absolute automatically
set number relativenumber
" Map jj to <ESC> key
inoremap jj <ESC>

filetype off

"
set runtimepath+=~/.vim/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install plug.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/autoload')
  silent call system('mkdir -p ~/.vim/bundle')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" colors
Plug 'https://github.com/morhetz/gruvbox'

" features
Plug 'derekwyatt/vim-scala'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/suan/vim-instant-markdown.git'
" Install vimwiki 23/05/2018
Plug 'vimwiki/vimwiki'
" Haskell vim support
Plug 'https://github.com/neovimhaskell/haskell-vim.git'
" golang support
"Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }
if !has("win32")
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
endif
"
call plug#end()
" fzf shortcuts
if has("win32")
	nnoremap <silent> <leader>b :ls<CR>
else
	nnoremap <silent> <leader>f :Files<CR>
	nnoremap <silent> <leader>g :Rg<CR>
	nnoremap <silent> <leader>b :Buffers<CR>
	nnoremap <silent> <leader>l :Lines<CR>
	nnoremap <silent> <leader>ft :Filetypes<CR>
endif
"
filetype plugin indent on	" Required
filetype plugin on
"
set laststatus=2
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction
set t_Co=256
syntax enable
if v:version > 740
	set termguicolors
endif
set background=dark
" set  airline theme
"let g:airline_theme='base16'
let g:gruvbox_undercurl=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
if has("win32")
	set guifont=Source_Code_Pro:h12:cANSI:qDRAFT
else
	set guifont=Source\ Code\ Pro\ 14
endif
" Hide the toolbar in gvim (I never use it)
if has("gui_running")
    set guioptions -=T
endif
" Enable folding and allow folding using the space bar
set foldmethod=indent
set foldlevel=99
" Enables folding with the spacebar
nnoremap <space> za	
" Show docstrings when folded
let g:SimpylFold_docstring_preview=1
" Show tabs as four spaces for golang *.go code
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" Indents for python
autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

autocmd BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
" Martin 26/09/2017 Add syntax highlight for hive hql files
" for .hql files
autocmd BufNewFile,BufRead *.hql set filetype=hive expandtab
" for .q files
autocmd BufNewFile,BufRead *.q set filetype=hive expandtab
"
" Instant markdown preview
let g:instant_markdown_autostart = 0
map <leader>md :InstantMarkdownPreview
" For vimwiki to use markdown syntax
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }
let g:vimwiki_list = [{'path' : '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" disable the <tab> mapping provied by vimwiki as this interferes with
" SuperTab
let g:vimwiki_table_mappings = 0
" Turn off vimwiki menu in gui as seems to cause issues - Martin 10/10/2018
let g:vimwiki_menu=''
" Turn off sounds
set belloff=all
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
" Martin 25/06/2018 - Add airline tabline extension 
let g:airline#extensions#tabline#fnamemod = ':t'
" Martin 30/09/2019 - <ESC> in terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>
