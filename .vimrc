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
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'glench/vim-jinja2-syntax'

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
Plug 'dense-analysis/ale'
Plug 'sjl/gundo.vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'whiteinge/diffconflicts'
Plug 'luan/vim-concourse'

"indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Neosnippet
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'

" Colors
Plug 'patstockwell/vim-monokai-tasty'
Plug 'embark-theme/vim', { 'as': 'embark' }

" All of your Plugs must be added before the following line
call plug#end()

set noshowmode
set termguicolors

set diffopt=filler,internal,algorithm:histogram,indent-heuristic

" Python support
let g:python2_host_prog = '~/.pyenv/shims/python'
let g:python3_host_prog = '~/.pyenv/shims/python'

" Remap leader to comma
let mapleader="\<Space>"

" Clear highlight on esc
nnoremap <esc> :noh<cr><esc>

set grepprg=rg\ --vimgrep

" More sane window split resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Color options
" let g:vim_monokai_tasty_italic = 1
" colorscheme vim-monokai-tasty
colorscheme embark
set fillchars+=vert:│

let g:lightline = {
      \'colorscheme': 'embark',
      \'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \'component_function': {'gitbranch': 'FugitiveHead'},}

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
au BufRead,BufNewFile *.md setlocal textwidth=70

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

let g:numbers_exclude    = ['tagbar', 'gundo', 'minibufexpl']

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
call deoplete#initialize()

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

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
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy
"""""""""""""""
""""" ALE """""
"""""""""""""""
" Use the quickfix window, not the location window
let g:ale_fixers = {
      \ '*': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'bash': ['shellcheck'],
      \ 'go': ['gofmt'],
      \ 'json': ['jq', 'prettier'],
      \ 'python': ['autopep8', 'black', 'add_blank_lines_for_python_control_statements'],
      \ 'terraform': ['terraform'],
      \ 'yml': ['ymllint']
      \}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" Open the window when there are errors
let g:ale_open_list = 1
" Only save on write, otherwise the cursor jumping fucks with my chi
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" Fix on save
let g:ale_fix_on_save = 1

""""""""""""""""
""" NERDTree """
""""""""""""""""

let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
nnoremap <leader>n :NERDTreeToggle<enter>

""""""""""""""""
"""" Tagbar """"
""""""""""""""""
nnoremap <leader>t :TagbarToggle<CR>

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
"""" FZF + RG """"
""""""""""""""""""
nnoremap <leader>f :Files<enter>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

""""""""""""""""""
""" Neosnippet """
""""""""""""""""""
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
