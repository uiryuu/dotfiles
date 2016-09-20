call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'a.vim'
Plug 'itchyny/calendar.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-expand-region'

call plug#end()

set ruler
set number
syntax on
set autoindent
set autoread
set smartindent
set showmatch
filetype on
set cursorline
set scrolloff=7
set completeopt=menu
set hidden

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set clipboard+=unnamed

" Disable mouse
set mouse-=a

set list
set listchars=trail:·,tab:»·

colorscheme hybrid
set background=dark

let mapleader=","

nnoremap <Leader>w :bd<CR>
nnoremap <Leader>1 :buffer 1<CR>
nnoremap <Leader>2 :buffer 2<CR>
nnoremap <Leader>3 :buffer 3<CR>
nnoremap <Leader>4 :buffer 4<CR>
nnoremap <Leader>5 :buffer 5<CR>
nnoremap <Leader>6 :buffer 6<CR>
nnoremap <Leader>7 :buffer 7<CR>
nnoremap <Leader>8 :buffer 8<CR>
nnoremap <Leader>9 :buffer 9<CR>

nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l

" Disable navigation keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" Turn off search highlight after each search
map <C-n> :nohl<CR>

" Buffer
nnoremap ., :bp<CR>
nnoremap ,. :bn<CR>

" Airline
let g:airline_theme="dark"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 0

" Ctrl-p
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" A.vim
nnoremap <Leader>a :A<CR>

" Calendar
nnoremap <Leader>c :Calendar -view=year -split=vertical -width=27<CR>
nnoremap <Leader>s :Calendar -view=clock<CR>

