set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>
