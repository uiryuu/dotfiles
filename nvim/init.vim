set nocompatible

call plug#begin('~/.config/nvim/plugged')

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorchemes
Plug 'flazz/vim-colorschemes'

" Functions
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'ArtBIT/vim-modularvimrc'

" Auto Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Colors
set background=dark
colorscheme molokai
syntax on

" Spaces & Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" UI Config
set number
set cursorline
filetype on
set showmatch
set scrolloff=7

" Search
set incsearch
set hlsearch
set inccommand=split

set ruler
set autoread
set completeopt=menu
set hidden
set clipboard+=unnamed
set colorcolumn=81

set encoding=utf8

let mapleader=" "

nnoremap gV `[v`]

nnoremap <leader>v :e $MYVIMRC<CR>

nnoremap <C-s> :mksession<CR>

nnoremap <silent> <Leader>b :bo sp term://bash\|resize 8<CR>i
if has('nvim')
    tnoremap <silent> <C-[> <C-\><C-n>
endif

nnoremap <silent> <Leader>w :bd!<CR>
nnoremap <silent> <Leader>1 :buffer 1<CR>
nnoremap <silent> <Leader>2 :buffer 2<CR>
nnoremap <silent> <Leader>3 :buffer 3<CR>
nnoremap <silent> <Leader>4 :buffer 4<CR>
nnoremap <silent> <Leader>5 :buffer 5<CR>
nnoremap <silent> <Leader>6 :buffer 6<CR>
nnoremap <silent> <Leader>7 :buffer 7<CR>
nnoremap <silent> <Leader>8 :buffer 8<CR>
nnoremap <silent> <Leader>9 :buffer 9<CR>

nnoremap <silent> ,, :bp<CR>
nnoremap <silent> .. :bn<CR>

" Disable navigation keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap <leader>c <C-w>c

nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

noremap <silent> <C-H> <C-w>h
noremap <silent> <C-J> <C-w>j
noremap <silent> <C-K> <C-w>k
noremap <silent> <C-L> <C-w>l

inoremap <silent> <C-H> <esc><C-w>h
inoremap <silent> <C-J> <esc><C-w>j
inoremap <silent> <C-K> <esc><C-w>k
inoremap <silent> <C-L> <esc><C-w>l

if has('nvim')
    tnoremap <silent> <C-H> <C-\><C-n><C-w>h
    tnoremap <silent> <C-J> <C-\><C-n><C-w>j
    tnoremap <silent> <C-K> <C-\><C-n><C-w>k
    tnoremap <silent> <C-L> <C-\><C-n><C-w>l
endif

" Turn off search highlight after each search
nnoremap <silent> <C-n> :nohl<CR>

let g:tex_flavor='latex'

" Airline
let g:airline_theme="kolor"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_symbols_ascii = 0
let g:airline_powerline_fonts = 1

" Ctrl-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" Tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

