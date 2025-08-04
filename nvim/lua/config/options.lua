local opt = vim.opt

opt.autoread = true
opt.backspace = "2"

vim.cmd([[ set noswapfile ]])
vim.cmd([[ set termguicolors ]])

-- Line numbers
vim.wo.number = true

-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = false

-- Use Ruff
vim.g.lazyvim_python_ruff = "ruff"
-- Use Pyright
vim.g.lazyvim_python_lsp = "pyright"

-- Please stop with the AI nonsense
vim.g.ai_cmp = false
