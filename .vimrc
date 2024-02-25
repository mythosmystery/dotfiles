let mapleader = " "
set rnu
set nu
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set incsearch
set hlsearch
set wrap
set showcmd
set clipboard=unnamedplus
set scrolloff=8

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>
nnoremap <C-y> :noh<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap J :m '>+1<CR>gv=gv<CR>
vnoremap K :m '<-2<CR>gv=gv<CR>

