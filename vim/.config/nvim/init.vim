" ======================
" # PLUGINS
" ======================
set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'junegunn/fzf.vim'

" GUI enhancements
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

" Syntax highlighting (ale)
Plug 'w0rp/ale'

" Completion (ncm2)
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'

" Completion sources
Plug 'ncm2/ncm2-bufword'

" LSP support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
\ }

" Language support
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'dart-lang/dart-vim-plugin'
Plug 'hankchiutw/flutter-reload.vim'

" Show function signature and inline doc via languageclient
Plug 'Shougo/echodoc.vim'

call plug#end()

runtime macros/matchit.vim

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
set relativenumber

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
set wildignore=.hg,.svn,.git,*~,*.png,*.jpg,*.gif,*.pdf,__pycache__,

" Permanent undo
set undodir=~/.vimdid
set undofile

" Search
set incsearch
set ignorecase
set smartcase
set gdefault

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
set colorcolumn=100
set laststatus=2
set signcolumn=yes

set list
set listchars=nbsp:¬,extends:»,precedes:«,trail:•,tab:>-

" Colors
let base16colorspace=256
colorscheme base16-atelier-dune

" Diffs
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

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

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Open hotkeys
map <C-p> :Files<CR>

" Suspend with Ctrl-F
inoremap <C-f> :sus<CR>
vnoremap <C-f> :sus<CR>
nnoremap <C-f> :sus<CR>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" ======================
" # LANGUAGE SETTINGS
" ======================

" Rust
let g:rustfmt_command = "rustfmt"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" ======================
" # PLUGIN SETTINGS
" ======================

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_virtualtext_cursor = 0

" fzf
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \ <bang>0 ? fzf#vim#with_preview('up:60%')
  \         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \ <bang>0)

" languageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_useVirtualText = 0

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
