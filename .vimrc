function! InstallVimPlug()
    " Define the path to the vim-plug plugin file depending on the environment
" Determine the appropriate path for vim-plug depending on the operating system
  if has('unix')
    let plugPath = expand('~/.vim/autoload/plug.vim')
  elseif has('win32') || has('win64')
    let plugPath = expand('~/vimfiles/autoload/plug.vim')
  endif

  " Form the complete curl command ensuring the plugPath is correctly escaped
  let installCmd = 'curl -fLo ' . shellescape(plugPath) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  " Execute the curl command to download vim-plug
  execute 'silent !' . installCmd
endfunction

" Call the function when Vim starts
call InstallVimPlug()

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'nanotee/zoxide.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

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
set nowrap
set hlsearch
set showcmd
set scrolloff=8
set termguicolors
set encoding=UTF-8

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:netrw_liststyle = 3

colorscheme tokyonight

command! Sync call PlugInstall() | execute 'colorscheme tokyonight'

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>f\ :BLines<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
