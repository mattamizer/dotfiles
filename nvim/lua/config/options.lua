vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set termguicolors ]]

--Line numbers
vim.wo.number = true
vim.opt.relativenumber = true

-- GitHub Copilot
vim.cmd[[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]]

-- Markdown preview
vim.cmd [[
  let g:mkdp_theme = 'light'
  let g:mkdp_command_for_global = 1
]]
