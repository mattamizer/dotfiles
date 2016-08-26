call plug#begin('~/.vim/plugged')
" If I'm neovim, load sane defaults
if !has('nvim') | Plug 'noahfrederick/vim-neovim-defaults' | end

" Define bundles via Github repos
Plug 'sensible.vim'
Plug 'vim-scripts/pbcopy.vim'

" Languages
"   Salt
Plug 'saltstack/salt-vim'
"   Ruby
Plug 'ecomba/vim-ruby-refactoring'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
"   JavaScript
Plug 'itspriddle/vim-jquery'
Plug 'jiangmiao/simple-javascript-indenter'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
"   HTML
Plug 'tudorprodan/html_annoyance.vim'
Plug 'xenoterracide/html.vim'
"   Go
Plug 'fatih/vim-go'
"   Other
Plug 'digitaltoad/vim-jade'
Plug 'jshint.vim'
Plug 'slim-template/vim-slim'
Plug 'stephpy/vim-yaml'
Plug 'timcharper/textile.vim'
Plug 'tpope/vim-markdown'

"  File exploration
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'align'
Plug 'bling/vim-airline'
Plug 'bogado/file-line'
Plug 'danro/rename.vim'
Plug 'dockyard/vim-easydir'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'henrik/vim-reveal-in-finder'
Plug 'ivyl/vim-bling'
Plug 'jgdavey/vim-blockle'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lokaltog/vim-easymotion'
Plug 'matchit.zip'
Plug 'mattn/gist-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'myusuf3/numbers.vim'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'nvie/vim-flake8'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'shougo/deoplete.nvim'
Plug 'speeddating.vim'
Plug 'switch.vim'
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'

"indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Neosnippet
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'd11wtq/tomorrow-theme-vim'
Plug 'mhinz/vim-janah'
Plug 'justincampbell/vim-eighties'

" All of your Plugs must be added before the following line
call plug#end()

" Remap leader to comma
let mapleader="\<Space>"

" Clear highlight on esc
nnoremap <esc> :noh<cr><esc>
" :W to sudo save
command W w !sudo tee % > /dev/null

set guioptions=egm
set guifont=Menlo:h14

" More sane window split resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" colorscheme Tomorrow-Night-Eighties
autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah
set splitbelow
set splitright

" Soft tabs
set shiftwidth=2
set softtabstop=2
set tabstop=4
set expandtab

" Fix numbers.vim bug with Vim 7.4+
set number

set smartindent
set lazyredraw

" Filetype specific settings
autocmd FileType gitcommit,markdown set nonumber
autocmd FileType gitcommit,markdown set spell
autocmd FileType markdown,"" set wrap

" Put temp files in the same spot
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Use english for spellchecking
set spl=en spell
set nospell

" Indent-Guides
autocmd VimEnter * :IndentGuidesEnable
let g:indent_guides_auto_colors = 0
highlight IndentGuidesEven ctermbg=233
highlight IndentGuidesOdd ctermbg=black

" Ignore case on search unless search has uppercase characters
set ignorecase
set smartcase

" Use relative line numbers, but show the absolute number on the current line
set number

" Show whitespace as unicode chars
set listchars=tab:‣\ ,trail:\ ,extends:…,precedes:…,nbsp:˖
set list

" 100-column line
set colorcolumn=100
highlight! link ColorColumn CursorColumn

let g:airline_powerline_fonts            = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_guide_size           = 1
let g:indent_guides_start_level          = 2
let g:flake8_show_in_gutter              = 1

" Call flake8 every time we write a python file
autocmd BufWritePost *.py call Flake8()

let g:numbers_exclude    = ['tagbar', 'gundo', 'minibufexpl']

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" rainbow_parentheses.vim
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
let g:rbpt_max = len(g:rbpt_colorpairs)

" Filetype mappings
autocmd BufNewFile,BufRead *.hjson set filetype=json
autocmd BufNewFile,BufRead *.skim set filetype=slim
autocmd BufNewFile,BufRead *.md,*.markdown set filetype=markdown
autocmd BufNewFile,BufRead Dockerfile.* set filetype=dockerfile

""""""""""""""""
""" NERDTree """
""""""""""""""""

let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

nnoremap <leader>f :NERDTreeFind<enter>
nnoremap <leader>n :NERDTreeToggle<enter>

""""""""""""""""""
"""" Keywords """"
""""""""""""""""""
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
  endif
endif

""""""""""""""""""
""" Whitespace """
""""""""""""""""""

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | :call <SID>StripTrailingWhitespaces() | endif

" Use handlebars syntax highlighting for dataviews
au BufRead,BufNewFile *.dataview setf handlebars

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    silent! %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

""""""""""""""
""" CTRL P """
""""""""""""""

let g:ctrlp_custom_ignore = '\.git$\|tmp$\|\.bundle$\|public/uploads$\|public/system$\|public\/topics$\|public/user_profiles\|\.sass-cache$|node_modules$'


" Use The SilverSearcher to find files. It means we no longer need to cache.
let g:ag_binary = system("which ag | xargs echo -n")
if filereadable(g:ag_binary)
  let g:ctrlp_user_command = g:ag_binary . ' %s -l --nocolor -g ""'
endif

let g:ctrlp_use_caching = 0


""""""""""""""""""
""" Neosnippet """
""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
