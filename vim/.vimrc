" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself
Plugin 'gmarik/Vundle.vim'

" syntastic (external syntax checking)
Plugin 'scrooloose/syntastic'

" rust.vim
Plugin 'rust-lang/rust.vim'

" racer
Plugin 'phildawes/racer'

" vim-toml (toml filetype)
Plugin 'cespare/vim-toml'

call vundle#end()
filetype plugin indent on

" Default settings

syntax on
set background=dark
set number
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set nowrap

set laststatus=2
set encoding=utf-8
set ttimeoutlen=50

" racer settings
set hidden
let g:racer_cmd = "~/src/rust/racer/target/release/racer"
let $RUST_SRC_PATH = "/home/florian/src/rust/rust_mozilla/src"
