set nocompatible

call plug#begin('~/.vim/plugged')

" Define bundles via Github repos
Plug 'sensible.vim'
Plug 'vim-scripts/pbcopy.vim'

" Languages
"   Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'nelstrom/vim-textobj-rubyblock'
"   JavaScript
Plug 'kchmck/vim-coffee-script'
Plug 'jiangmiao/simple-javascript-indenter'
Plug 'leshill/vim-json'
Plug 'itspriddle/vim-jquery'
"   HTML
Plug 'xenoterracide/html.vim'
Plug 'tudorprodan/html_annoyance.vim'
"   Python
Plug 'klen/python-mode'
"   Go
Plug 'fatih/vim-go'
"   Other
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-markdown'
Plug 'avakhov/vim-yaml'
Plug 'juvenn/mustache.vim'
Plug 'nono/vim-handlebars'
Plug 'digitaltoad/vim-jade'
Plug 'jshint.vim'
Plug 'timcharper/textile.vim'

"  File exploration
Plug 'scrooloose/nerdtree'

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
Plug 'godlygeek/tabular'
Plug 'Align'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'speeddating.vim'
Plug 'switch.vim'
Plug 'matchit.zip'
Plug 'sjl/gundo.vim'
Plug 'abolish.vim'
Plug 'danro/rename.vim'
Plug 'bogado/file-line'
Plug 'dockyard/vim-easydir'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'jgdavey/vim-blockle'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'henrik/vim-reveal-in-finder'
Plug 'justincampbell/vim-eighties'
Plug 'myusuf3/numbers.vim'
Plug 'Valloric/YouCompleteMe'

"indent guides
Plug 'nathanaelkane/vim-indent-guides'

" SnipMate and dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'

" Colors
Plug 'd11wtq/tomorrow-theme-vim'
Plug 'altercation/vim-colors-solarized'

" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on

set guioptions=egm
set guifont=Menlo:h14
set antialias

colorscheme Tomorrow-Night-Eighties
set splitbelow
set splitright

let g:vimfiler_as_default_explorer        = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent  = 3
let g:indent_guides_start_level           = 2
let g:indent_guides_guide_size            = 1
let g:airline_powerline_fonts             = 1

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
