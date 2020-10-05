

" set no vi compatiable
set nocompatible

" show line numbers
set nu

" default indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" enable syntax highlight
syntax on

" enable filetype detection
" filetype off should after syntax on, or else not working
filetype on
filetype plugin indent on


" window switch
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" disable mouse in all modes
set mouse=
