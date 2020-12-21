" set no vi compatiable
set nocompatible

" show line numbers
set nu


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

" disable vim auto into replace mode in wsl2
set t_u7=

" nerdtree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && 
  \ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | 
  \ exe 'cd '.argv()[0] | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && 
  \ b:NERDTree.isTabTree()) | q | endif


" default indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

<<<<<<< HEAD
" set foldmethod=indent
"

" color scheme
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
=======
" add color column
set colorcolumn=81
highlight ColorColumn ctermbg=3
>>>>>>> 5ebf272c56c0ef5c91ed096839459acc71ff5e89
