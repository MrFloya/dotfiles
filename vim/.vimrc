" ======================
" # PLUGINS
" ======================
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" VIM enhancements
Plug 'ciaranm/securemodelines'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

" Syntax highlighting (ale)
Plug 'w0rp/ale'

" Completion (ncm2)
Plug 'ncm2/ncm2'

call plug#end()

" ======================
" # EDITOR SETTINGS
" ======================
"
" General stuff
filetype plugin indent on
syntax on
set autoindent
set timeoutlen=300
set encoding=utf-8
set noshowmode
set hidden
"set nowrap
set nojoinspaces
set number

set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in Insert mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in Insert mode, and do not wrap old long lines

" Sane splits
set splitright
set splitbelow

set scrolloff=3

set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,.git,*~,*.png,*.jpg,*.gif,*.pdf

" Permanent undo
set undodir=~/.vimdid
set undofile

" Search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Search with ripgrep if available
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" ======================
" # GUI SETTINGS
" ======================
"
" General stuff
set vb t_vb=
set ruler
set ttyfast
set lazyredraw
set showcmd
set mouse=a

set list
set listchars=nbsp:¬,extends:»,precedes:«,trail:•,tab:>-

" Colors
set background=dark

" ======================
" # KEYBINDINGS
" ======================
"
" ; as :
nnoremap ; :

" No arrow keys..
nnoremap <up> <nop>
nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" ======================
" # LANGUAGE SETTINGS
" ======================

" ======================
" # PLUGIN SETTINGS
" ======================
"
" ale
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
