set nocompatible

" Plug-ins
call plug#begin('~/.config/nvim/plugged')

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" Syntax Highlighting & Language Support
Plug 'sheerun/vim-polyglot'

" Functions
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'

" nvim-lsp
" Plug 'neovim/nvim-lsp'

" Auto Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Settings
set background=dark
colorscheme molokai
syntax on

set tabstop=4
set shiftwidth=4
set expandtab

set number
set cursorline
filetype on
set showmatch
set scrolloff=7
set splitbelow splitright

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

" Key Mappings
let mapleader=" "
let localmapleader="\\"

" Disabled Mappings
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Normal Mode Mappings
nnoremap gV `[v`]

nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

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

nnoremap <leader>c <C-w>c

nnoremap <leader>j :split<CR>
nnoremap <leader>k :vsplit<CR>

nnoremap <silent> <C-n> :nohl<CR>

nnoremap <Leader>s :setlocal spell! spelllang=en_us<CR>

nnoremap <Leader>p :!tectonic main.tex<CR>
nnoremap <leader>o :!open main.pdf<CR><CR>

nnoremap <Leader>t :TagbarToggle<CR>

nnoremap <leader>n :NERDTreeToggle<CR>

" Insert Mode Mappings

inoremap jk <esc>

" All Mode Mappings

noremap <silent> <C-H> <esc><C-w>h
noremap <silent> <C-J> <esc><C-w>j
noremap <silent> <C-K> <esc><C-w>k
noremap <silent> <C-L> <esc><C-w>l

" Auto Commands

" Delete all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Per language indentation setting
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Plug-in Settings

" Airline
let g:airline_theme="kolor"
let g:airline#extensions#tabline#enabled = 1

" Ctrl-p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ }

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

echo ">^.^<"

