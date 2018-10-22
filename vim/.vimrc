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
Plug 'autowitch/hive.vim'
Plug 'vim-scripts/indentpython.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'derekwyatt/vim-scala'
"Plug 'motus/pig.vim'
Plug 'scrooloose/nerdtree'
"Plug 'jlanzarotta/bufexplorer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'https://github.com/suan/vim-instant-markdown.git'
" Install vimwiki 23/05/2018
Plug 'vimwiki/vimwiki'
" Install vim-go 18/07/2018
Plug 'https://github.com/fatih/vim-go.git', { 'do': ':GoInstallBinaries' }
" Install ultisnips 24/07/2018
"Plug 'SirVer/ultisnips'
" Install actual snippets 24/07/2018
"Plug 'honza/vim-snippets'
"
call plug#end()
filetype plugin indent on	" Required
filetype plugin on
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
if has("gui_running")
    set guioptions -=T
endif
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
"
" Instant markdown preview
let g:instant_markdown_autostart = 0
map <leader>md :InstantMarkdownPreview
" For vimwiki to use markdown syntax
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }
let g:vimwiki_list = [{'path' : '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" Turn off vimwiki menu in gui as seems to cause issues - Martin 10/10/2018
let g:vimwiki_menu=''
" Turn off sounds
set belloff=all
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
" Martin 25/06/2018 - Add airline tabline extension 
let g:airline#extensions#tabline#fnamemod = ':t'
" Martin 25/06/2018 - Shortcuts to move to next/prev buffer
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
"
" GOLANG SUPPORT (vim-go) - START
"
" golang: vim-go support 18/07/2018
" Run GoRun with the <leader>r command
autocmd FileType go nmap <leader>r <Plug>(go-run)
" Run GoTest with the <leader>t command
autocmd FileType go nmap <leader>t <Plug>(go-test)
" Only use quickfix lists in go
let g:go_list_type = "quickfix"
" autowrite when make is called (e.g. GoBuild)
set autowrite 
"
" Function calls :GoBuild or :GoTestCompile 
" depending on type of go file.
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0,1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction
" Run GoBuild with the <leader>b command
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" map \d to start Go debug and \q to stop it.
autocmd FileType go nmap <leader>d :GoDebugStart<CR>
autocmd FileType go nmap <leader>q :GoDebugStop<CR>
" Run GoCoverageToggle with the <leader>c command
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
"
" Use 'goimports' instead of 'gofmt' so that missing imports are automatically
" added.
let g:go_fmt_command = "goimports"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 number
" GOLANG SUPPORT (vim-go) - END
"
" ultisnips configuration 24/07/2018
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ultisnips configuration - END
"
" Map jj to <ESC> key
inoremap jj <ESC>
