call plug#begin('~/.config/nvim/plugged')

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" Colorchemes
Plug 'flazz/vim-colorschemes'
Plug 'bcicen/vim-vice'
Plug 'sonjapeterson/1989.vim'
Plug 'hhff/SpacegrayEighties.vim'

" Functions
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'a.vim'
Plug 'itchyny/calendar.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-expand-region'

" Auto Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

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

set colorcolumn=81

" Disable mouse
set mouse-=a

set list
set listchars=trail:·,tab:»·

colorscheme jellyx
set background=dark


let mapleader=","

nmap <Leader>z :bo sp term://zsh\|resize 8<CR>i
nmap <Leader>f :bo sp term://fish\|resize 8<CR>i
nmap <Leader>b :bo sp term://bash\|resize 8<CR>i
nmap <Leader>p :bo sp term://python\|resize 10<CR>i
nmap <Leader>y :bo sp term://python3\|resize 10<CR>i
if has('nvim')
	tnoremap <C-[> <C-\><C-n>
endif

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
let g:airline_theme="kolor"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 0

" vim-indent-guides
set ts=4 sw=4 noet

" Ctrl-p
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" A.vim
nnoremap <Leader>a :A<CR>

" Calendar
nnoremap <Leader>c :Calendar -view=year -split=vertical -width=27<CR>
nnoremap <Leader>s :Calendar -view=clock<CR>

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

