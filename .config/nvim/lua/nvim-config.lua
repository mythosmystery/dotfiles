vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set termguicolors")
vim.cmd("set nu")
vim.cmd("set relativenumber")
vim.cmd("set scrolloff=8")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-c>", "<ESC>", opts)
vim.keymap.set("n", "<C-i>", ":noh<CR>", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("n", "J", ":lua require('functions').move_line_down()<CR>", opts)
vim.keymap.set("n", "K", ":lua require('functions').move_line_up()<CR>", opts)
vim.keymap.set("n", "<C-n>", ":bnext<CR>", opts)
vim.keymap.set("n", "<C-p>", ":bprev<CR>", opts)

vim.filetype.add({ extension = { templ = "templ" } })

