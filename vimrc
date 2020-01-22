" My vimrc setup
" Also works as a reference sheet
" mikael.berglund2@gmail.com

" BASIC SETUP {{{

" misc
echo "(╯°□°）╯︵ ┻━┻"
let mapleader = ","
let maplocalleader = " "
set nocompatible
set encoding=utf-8
set laststatus=2
filetype plugin on

" visual
syntax enable
colorscheme molokai
set number
set relativenumber
set wrap
set ruler
set visualbell
set showmatch
set hlsearch

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" folding
set foldmethod=marker
setlocal foldlevelstart=0

" status line
set statusline=%.20F

set statusline=%.20F
set statusline+=%=
set statusline+=[%4c]\ \ [%l/%L]

" }}}

" PLUGINS {{{

" set runtime path to vundle and init vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" add plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'vim-header'

call vundle#end()

let g:closetag_filenames = '*.jsx,*.html,*.xhtml,*phtml'
let g:closetag_xhtml_filenames = '*.jsx,*.xhtml'
let g:closetag_filetypes = 'jsx,html,xhtml,phtml'
let g:closetag_xhtml_filtypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 0
let g:closetag_shortcut = '>'

let g:header_auto_add_header = 0
let g:header_alignment = 2
let g:header_max_size = 10
let g:header_field_author = "Mikael Berglund"
let g:header_field_author_email = "mikael.berglund2@gmail.com"
let g:header_field_copyright = "Hahmota Oy"

map <F2> :AddHeader<cr>

" }}}

" REMAPS {{{

" auto close brackets
inoremap [<cr> [<cr>]<esc>O
inoremap {<cr> {<cr>}<esc>O

" make word uppercase
nnoremap <c-u> vawUe
inoremap <c-u> <esc>vawUea

" vimrc quick edit
nnoremap <leader>ev :split $HOME/dev/vim/vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" zsh config quick edit
nnoremap <leader>zv :split $HOME/.zshrc<cr>

" enclose word in quatations
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Easier edit mode quit remap
inoremap jk <esc>

" Enclose selection in quotations
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>

" Remove trailing whitespaces
nnoremap <leader>cc :%s/\s\+$//e<cr>

" }}}

" FINDING FILES {{{

"search down into subfolders
set path+=**

" display all matching files when using tab complete
set wildmenu

" }}}

" TAG FINDING {{{

" create the 'tags' files
" Use ^] to jump to tag
" Use g^] for ambigous tags
" Use ^t to jump up the tag stack
command! Maketags !ctags -R .

" ctags enables autocomplete
" - ^x^n for this file
" - ^x^f for filenames
" - ^x^] for tags
" - ^n for anything specified by the complete option
" - ^n and ^p go down and up in autocomplete list

" }}}

" FILE BROWSING {{{

" Tweaks for browsing
let g:netrw_banner=0		" disable banner
let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3		" tree view

" }}}

" SNIPPETS {{{

nnoremap ,main :-1read $HOME/dev/vim/snippets/main.c<CR>f(ci(

" }}}
