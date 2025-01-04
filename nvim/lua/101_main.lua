local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.laststatus = 3

-- IME無効化
vim.fn.system("fcitx5-remote -c")
