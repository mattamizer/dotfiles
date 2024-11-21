local opt = vim.opt

opt.autoread = true
opt.backspace = "2"

vim.cmd([[ set noswapfile ]])
vim.cmd([[ set termguicolors ]])

--Line numbers
vim.wo.number = true

vim.g.python3_host_prog = "/Users/mmorrissey/.pyenv/versions/neovim/bin/python"
