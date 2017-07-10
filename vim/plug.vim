call plug#begin('~/.vim/plugged')

" A command-line fuzzy finder written in Go
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <nowait><Leader>b :Buffers<CR>
nnoremap <Leader>p :History<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>

" tagbar
Plug 'majutsushi/tagbar'
nnoremap <F8> :TagbarToggle<CR>

" automatic ctags
Plug 'ludovicchabant/vim-gutentags'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
map <Leader>n :NERDTreeFind<CR>
let g:NERDTreeMouseMode = 2
" Git support for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git support in vim
Plug 'tpope/vim-fugitive'
" fugitive options: Gdiff split in vertical mode by default
set diffopt+=vertical

" Fucking great lint plugin
Plug 'w0rp/ale', { 'do': 'npm install -g eslint_d' }
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_change_sign_column_color = 1
let g:ale_statusline_format = ['✕ %d', '⚠ %d', '✔ ok']
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_linters = {
            \   'javascript': ['eslint', 'flow'],
            \}

" Is all about surroundings: parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-surround'

" Use the dot key to repeat the last command
Plug 'tpope/vim-repeat'

" Provides insert mode auto-completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

" Editorconfig support for vim
Plug 'editorconfig/editorconfig-vim'

" Comment your code lines
Plug 'scrooloose/nerdcommenter'

" Status line with bufferline support
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
let g:lightline = {
            \ 'colorscheme': 'PaperColor',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'filename', 'ale', 'gtm', 'modified', 'cap', 'gutentags' ] ]
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
            \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
            \   'ale': '%{ALEGetStatusLine()}',
            \   'gtm': '%{exists("*GTMStatusline")?GTMStatusline():""}',
            \   'cap': '%{vimcaps#statusline(-3)}',
            \   'gutentags': '%{gutentags#statusline("ctags...")}'
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
            \   'gtm': '(exists("GTMStatusline") && ""!=GTMStatusline())',
            \   'gutentags': '(gutentags#statusline("show") == "show")'
            \ },
            \ 'tabline': {'left': [['buffers']]},
            \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
            \ 'component_type': {'buffers': 'tabsel'}
            \ }

" Emmet suport, remember: <C-Z>,
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'

" Simple autocomplete but works nice with ternjs
Plug 'ajh17/VimCompletesMe'
set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect
set shortmess+=c
set pumheight=15

" Ternjs for vim
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
"let g:tern_show_signature_in_pum = 1
"let g:tern_show_argument_hints = 'on_hold'

" Create jsdoc
Plug 'heavenshell/vim-jsdoc'
nmap <silent> <C-l> <Plug>(jsdoc)
" jnmap <silent> <C-l> <Plug>(jsdoc)lent> <C-l> <Plug>(jsdoc)sdoc autocomplete
let g:jsdoc_enable_es6 = 1

" Show whitespaces in your code and you can strip them
Plug 'ntpeters/vim-better-whitespace'
" whitestrip on save
autocmd BufWritePre * StripWhitespace

" Format your code
Plug 'sbdchd/neoformat'
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_javascript = ['eslint_d']
nnoremap <C-f> :Neoformat<CR>

" Match html tags
Plug 'Valloric/MatchTagAlways'
let g:mta_filetypes = {
            \ 'html' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'jinja' : 1,
            \ 'blade' : 1
            \}

" Move your code lines in a cool way
Plug 'matze/vim-move'

" Search plugins
Plug 'mileszs/ack.vim', { 'do': 'sudo pacman -S --noconfirm the_silver_searcher' }
let g:ackprg = 'ag --nogroup --nocolor --column'

" Amazing search and replace plugin, the command is: CtrlSF <search_value>
Plug 'dyng/ctrlsf.vim'

" Livepreview to markdown
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }

" Simple, seamless, lightweight time tracking for Git
Plug 'git-time-metric/gtm-vim-plugin'
" gtm time spend
let g:gtm_plugin_status_enabled = 0

" mappings for ex commands
" ]q is :cnext. [q is :cprevious. ]a is :next. [b is :bprevious
Plug 'tpope/vim-unimpaired'

" Better way to work with copy and paste in vim
Plug 'svermeulen/vim-easyclip'
let g:EasyClipUseCutDefaults = 0
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug

" Wipe a file from the buffer and keep the window/split intact
Plug 'qpkorr/vim-bufkill'
let g:BufKillCreateMappings = 0
nnoremap <C-k> :BW<CR>

" Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-eunuch'

" Never be bothered by caps lock
Plug 'suxpert/vimcaps'

" extra syntax

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
let g:vim_jsx_pretty_colorful_config = 1

Plug 'fleischie/vim-styled-components'
Plug 'jwalton512/vim-blade'
Plug 'othree/html5.vim'
Plug 'keith/tmux.vim'
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'neovimhaskell/haskell-vim'

" themes
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()
