function! InstallVimPlug()
    " Define the path to the vim-plug plugin file depending on the environment
    if has('unix')
        let plugPath = '~/.vim/autoload/plug.vim'
    elseif has('win32') || has('win64')
        let plugPath = '~/vimfiles/autoload/plug.vim'
    endif

    " Check if vim-plug is installed by checking for the existence of plug.vim
    if !filereadable(expand(plugPath))
        " If not installed, display a message
        echo "vim-plug not found. Installing..."
        " Define the installation command for vim-plug
        let installCmd = 'curl -fLo ' . plugPath . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        " Execute the installation command
        silent !execute installCmd

        " Display a message upon completion
        echo "vim-plug installed."
    endif
endfunction

" Call the function when Vim starts
call InstallVimPlug()

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'nanotee/zoxide.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'

call plug#end()

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
set scrolloff=8
set termguicolors

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight


nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h

nnoremap <C-p> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-x> :bdelete<CR>
nnoremap <ESC> :noh<CR>

tnoremap <C-c> <C-\><C-n>
tnoremap <C-l> <C-w>l
tnoremap <C-k> <C-w>k
tnoremap <C-j> <C-w>j
tnoremap <C-h> <C-w>h

inoremap <C-z> <C-o>u
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-d> <C-o><C-d>
inoremap <C-u> <C-o><C-u>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
