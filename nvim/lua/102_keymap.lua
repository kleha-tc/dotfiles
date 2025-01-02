local set = vim.keymap.set

vim.g.mapleader = " "

set("i", "<Leader>jj", "<Esc>")
set("t", "<Leader>jj", "<C-\\><C-n>")
set("n", "<C-A>", "<C-a>", { noremap = true })
