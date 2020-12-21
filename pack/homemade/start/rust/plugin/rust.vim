
" fold stuff
let g:rust_fold = 1

" auto run rustfmt when save file
let g:rustfmt_autosave = 1

" style as rust std
let g:rust_recommended_style = 1

let g:cargo_shell_command_runner = "botright terminal"
set termwinsize=10x0
hi Terminal ctermbg=white ctermfg=black

" shortcuts
autocmd FileType rust  nnoremap ,r :Crun<cr>
autocmd FileType rust  nnoremap ,c :Ccheck<cr>
autocmd FileType rust  nnoremap ,l :Cclean<cr>
autocmd FileType rust  nnoremap ,m :!make<cr>

autocmd FileType rust  nnoremap ,t :Ctest -- --nocapture<cr>
autocmd FileType rust  nnoremap ,o :RustTest -- --nocapture<cr>
autocmd FileType rust  nnoremap ,b :Cbench<cr>

autocmd FileType rust  nnoremap ,e :RustExpand<cr>

" repo url: https://github.com/prabirshrestha/vim-lsp
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" repo url: https://github.com/prabirshrestha/asyncomplete.vim
" tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" force refresh completion
imap <c-space> <Plug>(asyncomplete_force_refresh)


