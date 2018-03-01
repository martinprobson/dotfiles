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
set nocompatible
set hidden
set confirm
filetype off

set undodir=~/.vim/undo//
set backupdir=~/.vim/backups//
set directory=~/.vim/swaps

set runtimepath+=~/.vim/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/{autoload,bundle,cache,undo,backups,swaps}')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

call plug#begin('~/.vim/plugged')

" colors
Plug 'vim-scripts/Zenburn'

" features
"Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'derekwyatt/vim-scala'
"Plug 'motus/pig.vim'
Plug 'scrooloose/nerdtree'
"Plug 'jlanzarotta/bufexplorer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'

call plug#end()
filetype plugin indent on	" Required
set modeline 
set showmatch 
set showcmd 
set autochdir
"
" Martin 26/05/2017 - Add statusline showing full pathname
" See
" https://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
set laststatus=2
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction
" Martin 26/05/2017 - End
set t_Co=256
syntax enable
"colorscheme slate
" Martin 20/02/2018 - use zenburn colour scheme
"colorscheme molokai
colorscheme zenburn
"set guifont=monaco\ 11
set guifont=Source\ Code\ Pro\ 12
" Hide the toolbar in gvim (I never use it)
set guioptions -=T
" set airline theme
let g:airline_theme='zenburn'
" Enable folding and allow folding using the space bar
set foldmethod=indent
set foldlevel=99
" Enables folding with the spacebar
nnoremap <space> za	
" Show docstrings when folded
let g:SimpylFold_docstring_preview=1
" Indents for python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
" Martin 26/09/2017 Add syntax highlight for hive hql files
" for .hql files
au BufNewFile,BufRead *.hql set filetype=hive expandtab
" for .q files
au BufNewFile,BufRead *.q set filetype=hive expandtab
" Martin 08/01/2018 shortcut (CTRL-N) for NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
" for .hql files
"
" CTRL-P
let g:ctrlp_map = '<C-p>' 
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>be :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/](\.git|\.hg|\.svn|target)$',
\ 'file': '\v\.(class|zip)$',
\ }
