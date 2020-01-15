" ======================
" # PLUGINS
" ======================
set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-speeddating'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/goyo.vim'

" GUI enhancements
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-signify'

" Linting & Quick Fixes (ale)
Plug 'w0rp/ale'

" Completion (ncm2) only supported on >= nvim-0.3
if has('nvim-0.3')
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2'
    " Completion sources
    Plug 'ncm2/ncm2-bufword'
end

" LSP support
" LanguageClient for general integration
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
\ }
" EchoDoc to show inline function signatures and documentation
Plug 'Shougo/echodoc.vim'

" Language specific
Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'dart-lang/dart-vim-plugin'
Plug 'hankchiutw/flutter-reload.vim'
Plug 'plasticboy/vim-markdown'
Plug 'mephux/bro.vim'
Plug 'chrisbra/csv.vim'

" Notes
Plug 'pedrosans/vim-misc'
Plug 'pedrosans/vim-notes'

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
if has('nvim')
    let base16colorspace=256
    colorscheme base16-atelier-dune
end

" Diffs
if has('nvim-0.3')
    set diffopt+=algorithm:patience
    set diffopt+=indent-heuristic
end

" ======================
" # COMMANDS
" ======================
"
" trim trailing whitespaces
command TrimTrailing :%s/\s\+$//

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
map <C-o> :Buffers<CR>

map <C-Space> :Goyo<CR>

" Suspend with Ctrl-F
inoremap <C-f> <Esc>:sus<CR>
vnoremap <C-f> <Esc>:sus<CR>
nnoremap <C-f> :sus<CR>

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Completion
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

" ======================
" # LANGUAGE SETTINGS
" ======================

" Rust
let g:rustfmt_command = 'rustfmt'
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let $RUST_SRC_PATH = systemlist('rustc --print sysroot')[0] . '/lib/rustlib/src/rust/src'

" ======================
" # PLUGIN SETTINGS
" ======================

" ale
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_virtualtext_cursor = 1

" color None seems to only be supported on nvim
if has('nvim')
    highlight ALEError guibg=None
    highlight ALEWarning guibg=None
end

let g:ale_linters = {'rust': ['rls'], 'python': ['flake8']}

let g:ale_rust_rls_config = {
    \ 'rust': {
        \ 'all_targets': 1,
        \ 'build_on_save': 1,
        \ 'clippy_preference': 'on'
    \ }
\ }

let g:ale_python_flake8_options = '--max-line-length=120'


" fzf
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \ <bang>0 ? fzf#vim#with_preview('up:60%')
  \         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \ <bang>0)

" goyo
let g:goyo_width = '30%'
let g:goyo_height = '90%'

" languageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_useVirtualText = 0

" ncm2
if has('nvim-0.3')
    autocmd BufEnter * call ncm2#enable_for_buffer()
    set completeopt=noinsert,menuone,noselect
end

" notes
let g:notes_suffix = '.md'
let g:notes_title_sync = 'rename_file'
let g:notes_unicode_enabled = 0
let g:notes_smart_quotes = 0
if isdirectory($HOME . '/sync/doc/notes')
    let g:notes_directories = ['~/sync/doc/notes']
end
