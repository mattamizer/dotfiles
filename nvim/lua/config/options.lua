local opt = vim.opt

opt.autoread = true
opt.backspace = "2"

vim.cmd([[ set noswapfile ]])
vim.cmd([[ set termguicolors ]])

-- Line numbers
vim.wo.number = true

-- Use Ruff
vim.g.lazyvim_python_ruff = "ruff"
-- Use Pyright
vim.g.lazyvim_python_lsp = "pyright"
