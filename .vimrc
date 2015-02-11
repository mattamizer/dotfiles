set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Define bundles via Github repos
Plugin 'sensible.vim'
Plugin 'vim-scripts/pbcopy.vim'

" Languages
"   Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'nelstrom/vim-textobj-rubyblock'
"   JavaScript
Plugin 'kchmck/vim-coffee-script'
Plugin 'jiangmiao/simple-javascript-indenter'
Plugin 'leshill/vim-json'
Plugin 'itspriddle/vim-jquery'
"   HTML
Plugin 'xenoterracide/html.vim'
Plugin 'tudorprodan/html_annoyance.vim'
"   Other
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-markdown'
Plugin 'avakhov/vim-yaml'
Plugin 'juvenn/mustache.vim'
Plugin 'nono/vim-handlebars'
Plugin 'digitaltoad/vim-jade'
Plugin 'jshint.vim'
Plugin 'timcharper/textile.vim'
Plugin 'fatih/vim-go'
Plugin 'klen/python-mode'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'godlygeek/tabular'
Plugin 'Align'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-textobj-user'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'speeddating.vim'
Plugin 'switch.vim'
Plugin 'matchit.zip'
Plugin 'sjl/gundo.vim'
Plugin 'abolish.vim'
Plugin 'danro/rename.vim'
Plugin 'bogado/file-line'
Plugin 'dockyard/vim-easydir'
Plugin 'nicholaides/words-to-avoid.vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'rking/ag.vim'
Plugin 'henrik/vim-reveal-in-finder'
Plugin 'justincampbell/vim-eighties'

"indent guides
Plugin 'nathanaelkane/vim-indent-guides'

" SnipMate and dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'

" Colors
Plugin 'd11wtq/tomorrow-theme-vim'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

set guioptions=egm
set guifont=Menlo:h14
set antialias

colorscheme Tomorrow-Night-Eighties
set splitbelow
set splitright

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent  = 3
let g:indent_guides_start_level           = 2
let g:indent_guides_guide_size            = 1
let g:airline_powerline_fonts             = 1
