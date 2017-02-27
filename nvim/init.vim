set nocompatible

call plug#begin('~/.config/nvim/plugged')

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorchemes
Plug 'flazz/vim-colorschemes'
Plug 'bcicen/vim-vice'
Plug 'sonjapeterson/1989.vim'
Plug 'Justineo/kolor'

" Functions
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'itchyny/calendar.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdtree'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'

" Highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'keith/swift.vim'

" Auto Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

call plug#end()

syntax on
filetype on

set ruler
set number
set autoindent
set autoread
set smartindent
set showmatch
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

" set list
set listchars=trail:·,tab:»·

colorscheme hybrid
set background=dark

set inccommand=split

let mapleader=","

nnoremap <silent> <Leader>z :bo sp term://zsh\|resize 8<CR>i
nnoremap <silent> <Leader>f :bo sp term://fish\|resize 8<CR>i
nnoremap <silent> <Leader>b :bo sp term://bash\|resize 8<CR>i
nnoremap <silent> <Leader>p :bo sp term://python\|resize 10<CR>i
nnoremap <silent> <Leader>i :bo sp term://ipython3\|resize 10<CR>i
if has('nvim')
	tnoremap <silent> <C-[> <C-\><C-n>
endif

nnoremap <silent> <Leader>w :bd<CR>
nnoremap <silent> <Leader>1 :buffer 1<CR>
nnoremap <silent> <Leader>2 :buffer 2<CR>
nnoremap <silent> <Leader>3 :buffer 3<CR>
nnoremap <silent> <Leader>4 :buffer 4<CR>
nnoremap <silent> <Leader>5 :buffer 5<CR>
nnoremap <silent> <Leader>6 :buffer 6<CR>
nnoremap <silent> <Leader>7 :buffer 7<CR>
nnoremap <silent> <Leader>8 :buffer 8<CR>
nnoremap <silent> <Leader>9 :buffer 9<CR>
nnoremap <silent> <tab> :bn<CR>
nnoremap <silent> <S-tab> :bp<CR>

" Disable navigation keys
nnoremap <silent> <Left> <C-w>h
nnoremap <silent> <Down> <C-w>j
nnoremap <silent> <Up> <C-w>k
nnoremap <silent> <Right> <C-w>l

inoremap <silent> <Left> <esc><C-w>h
inoremap <silent> <Down> <esc><C-w>j
inoremap <silent> <Up> <esc><C-w>k
inoremap <silent> <Right> <esc><C-w>l

" Turn off search highlight after each search
nnoremap <silent> <C-n> :nohl<CR>

nnoremap <silent> <Leader>` <esc>gUiw

" Airline
let g:airline_theme="kolor"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_symbols_ascii = 1

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

" NERD Tree
nnoremap <Leader>n :NERDTreeToggle<CR>

" NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" Calendar
" nnoremap <Leader>c :Calendar -view=year -split=vertical -width=27<CR>
nnoremap <Leader>s :Calendar -view=clock<CR>

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" vim-latex
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'

