call plug#begin('~/.vim/plugged')

" Define bundles via Github repos
Plug 'sensible.vim'
Plug 'vim-scripts/pbcopy.vim'

" Languages
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
Plug 'leshill/vim-json'
"   HTML
Plug 'tudorprodan/html_annoyance.vim'
Plug 'xenoterracide/html.vim'
"   Python
Plug 'klen/python-mode'
"   Go
Plug 'fatih/vim-go'
"   Other
Plug 'avakhov/vim-yaml'
Plug 'digitaltoad/vim-jade'
Plug 'jshint.vim'
Plug 'juvenn/mustache.vim'
Plug 'nono/vim-handlebars'
Plug 'slim-template/vim-slim'
Plug 'timcharper/textile.vim'
Plug 'tpope/vim-markdown'

"  File exploration
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler'

Plug 'abolish.vim'
Plug 'airblade/vim-gitgutter'
Plug 'align'
Plug 'bling/vim-airline'
Plug 'bogado/file-line'
Plug 'danro/rename.vim'
Plug 'dockyard/vim-easydir'
Plug 'godlygeek/tabular'
Plug 'henrik/vim-reveal-in-finder'
Plug 'ivyl/vim-bling'
Plug 'jgdavey/vim-blockle'
Plug 'justincampbell/vim-eighties'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lokaltog/vim-easymotion'
Plug 'matchit.zip'
Plug 'mattn/gist-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'myusuf3/numbers.vim'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'speeddating.vim'
Plug 'switch.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'shougo/neocomplete.vim'
Plug 'vim-scripts/argtextobj.vim'

"indent guides
Plug 'nathanaelkane/vim-indent-guides'

" SnipMate and dependencies
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'd11wtq/tomorrow-theme-vim'

" All of your Plugs must be added before the following line
call plug#end()

set mouse=a
set guioptions=egm
set guifont=Menlo:h14
set antialias

" More sane window split resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

colorscheme Tomorrow-Night-Eighties
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

" 80-column line
set colorcolumn=81
highlight! link ColorColumn CursorColumn

let g:airline_powerline_fonts            = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_guide_size           = 1
let g:indent_guides_start_level          = 2
let g:vimfiler_as_default_explorer       = 1

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl']

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

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

""""""""""""""""""
""" Whitespace """
""""""""""""""""""

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | :call <SID>StripTrailingWhitespaces() | endif

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


"""""""""""""""""""
""" Neocomplete """
"""""""""""""""""""

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
