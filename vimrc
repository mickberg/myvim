" File              : .vimrc
" Author            : Mikael Berglund <mikael.berglund2@gmail.com>
" Date              : 17.08.2019
" Last Modified Date: 17.08.2019
" Last Modified By  : Mikael Berglund <mikael.berglund2@gmail.com>
echo "(╯°□°）╯︵ ┻━┻"
let mapleader = ","
let maplocalleader = " "

" Plugins			---- {{{

set nocompatible
filetype off

" set runtime path to vundle and init vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" add plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'alpertuna/vim-header'

call vundle#end()
" }}}

let g:header_field_author = 'Mikael Berglund'
let g:header_field_author_email = 'mikael.berglund2@gmail.com'
nnoremap <f1> :addHeader<cr>

" Basic rules			---- {{{

"" visual
syntax on
set foldlevelstart=0
colorscheme molokai
set number
set wrap

"" misc
set encoding=utf-8
set wildmenu
set laststatus=2
set ruler
set visualbell
set showmatch

"" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
" }}}

" Vimscript file settings ------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Javascript file settings ------------ {{{
augroup statLine
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType javascript set statusline=%.20F
	autocmd FileType javascript set statusline+=%=
	autocmd FileType javascript set statusline+=[%4c]\ \ [%l/%L]
	" autofill curlybrackets
	autocmd FileType javascript inoremap {<cr> {<cr>}<esc>O
	autocmd FileType javascript inoremap [<cr> [<cr>]<esc>O
	" move to next / prev brackets
	nnoremap <localleader>bn /{<cr>:nohlsearch<cr>
	nnoremap <localleader>bp ?{<cr>:nohlsearch<cr>
augroup END
" }}}

" Markdown file settings		---- {{{
augroup mkgroup
	autocmd!
	autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
	autocmd FileType markdown onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" Remaps		---- {{{
"--- Normal mode ---"

" move line up or down
nnoremap - ddkP
nnoremap + ddp
" make word uppercase
nnoremap <c-u> vawUe
" vimrc quick edit
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" gitignore quick edit
nnoremap <leader>gi :split $HOME/.gitignore_global<cr>
" enclose word in quatations
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"--- Insert mode ---"

" Remove line in
inoremap <c-d> <esc>ddi
" Make word uppercase
inoremap <c-u> <esc>vawUea
inoremap jk <esc>
" Make vim comment header
inoremap <c-h> <esc>0i"--- <esc>$a ---"

"--- Visual mode ---"

" Enclose selection in quotations
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" }}}

" Disable arrows and esc		---- {{{
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <left> <NOP>
inoremap <right> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <esc> <NOP>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
" }}}

" Useful autocorrections		---- {{{
iabbrev senior señor fartface
iabbrev  @@ mikael.berglund2@gmail.com
iabbrev ccopy Copyright 2019 Mikael Berglund, all rights reserved.
iabbrev ssig -- <cr>Mikael Berglund<cr>mikael.berglund2@gmail.com
iabbrev funtcion function

iabbrev ftjs FileType javascript
iabbrev vmap vnoremap
iabbrev map nnoremap
iabbrev nmap nnoremap
iabbrev imap inoremap

" }}}

" Remove trailing whitespace			---- {{{
function! <SID>remove_ws()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

augroup remove_ws
	autocmd!
	autocmd BufWritePre,BufRead * :call <SID>remove_ws()
augroup END
" }}}

iabbrev fmark "			---- {{{
