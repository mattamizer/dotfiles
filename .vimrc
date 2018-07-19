call plug#begin('~/.vim/plugged')
" If I'm neovim, load sane defaults
if !has('nvim') | Plug 'noahfrederick/vim-neovim-defaults' | end
if !has('nvim') | Plug 'sensible.vim' | end

" Languages
"   Ruby
Plug 'ecomba/vim-ruby-refactoring'
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
Plug 'slim-template/vim-slim'
Plug 'stephpy/vim-yaml'
Plug 'timcharper/textile.vim'
Plug 'elzr/vim-json'
Plug 'hashivim/vim-terraform'

"  File exploration
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'godlygeek/tabular'
Plug 'jgdavey/vim-blockle'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lokaltog/vim-easymotion'
Plug 'mattn/gist-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'myusuf3/numbers.vim'
Plug 'w0rp/ale'
Plug 'sjl/gundo.vim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'whiteinge/diffconflicts'

"indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Neosnippet
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'd11wtq/tomorrow-theme-vim'
Plug 'justincampbell/vim-eighties'
Plug 'mhinz/vim-janah'
Plug 'fenetikm/falcon'

" All of your Plugs must be added before the following line
call plug#end()

set noshowmode

" Python support
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Remap leader to comma
let mapleader="\<Space>"

" Clear highlight on esc
nnoremap <esc> :noh<cr><esc>
" :W to sudo save
command W w !sudo tee % > /dev/null

set grepprg=rg\ --vimgrep

" More sane window split resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Color options
" autocmd ColorScheme janah highlight Normal ctermbg=235
" colorscheme janah
colorscheme falcon

set splitbelow
set splitright

" Soft tabs
set shiftwidth=2
set softtabstop=2
set tabstop=4
set expandtab
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

" 120-column line
set colorcolumn=120
highlight! link ColorColumn CursorColumn

let g:indent_guides_color_change_percent = 3
let g:indent_guides_guide_size           = 1
let g:indent_guides_start_level          = 2
let g:falcon_lightline                   = 1

let g:lightline = {'colorscheme': 'falcon', 'component_function': {'gitbranch': 'fugitive#head'}}
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
autocmd BufNewFile,BufRead *.rules set filetype=yaml
"""""""""""""""
""""" ALE """""
"""""""""""""""
" Use the quickfix window, not the location window
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" Open the window when there are errors
let g:ale_open_list = 1
" Only save on write, otherwise the cursor jumping fucks with my chi
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

""""""""""""""""
""" NERDTree """
""""""""""""""""

let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
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

""""""""""""""""""
"""" FZF + RG """"
""""""""""""""""""
nnoremap <leader>f :Files<enter>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

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
