let mapleader=","
set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic', { 'do': 'npm install -g resolve-eslint' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'ervandew/supertab'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'shawncplus/phpcomplete.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'heavenshell/vim-jsdoc'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Chiel92/vim-autoformat', { 'do': 'npm install -g js-beautify' }
Plug 'Valloric/MatchTagAlways'
Plug 'matze/vim-move'
Plug 'mileszs/ack.vim', { 'do': 'sudo pacman -S --noconfirm ack' }
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
Plug 'git-time-metric/gtm-vim-plugin'
Plug 'tpope/vim-unimpaired'

" extra syntax
Plug 'pangloss/vim-javascript'
Plug 'jwalton512/vim-blade'
Plug 'othree/html5.vim'
Plug 'keith/tmux.vim'
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'neovimhaskell/haskell-vim'

" themes
Plug 'dracula/vim'

call plug#end()

if (has("termguicolors"))
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme dracula

let g:indentLine_enabled = 0
syntax on
set nobackup
set nowritebackup
set noswapfile
set incsearch
set ignorecase
set smartcase
set nowrap
set number
set relativenumber
set hidden
set autoread
au CursorHold,CursorHoldI * checktime
set clipboard=unnamed,unnamedplus
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set copyindent

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_eslint_exe = 'eslint --quiet'
let g:syntastic_javascript_checkers = ['eslint']

nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <C-s> :update<CR>
inoremap <C-s> <ESC>:update<CR>
nnoremap <Leader>ff :NERDTreeToggle<CR>
nnoremap <Leader>f<Space> :NERDTreeFind<CR>
nnoremap <C-b><C-b> :CtrlPBuffer<CR>
nnoremap <C-b><C-n> :bn<CR>
nnoremap <C-b><C-w> :bw<CR>
nnoremap <C-f> :Autoformat<CR>
inoremap <C-b> <b>
inoremap <C-l> <right>
nmap <silent> <C-l> <Plug>(jsdoc)
nnoremap <Leader>v :SyntasticCheck<CR>

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'gtm', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'gtm': '%{exists("*GTMStatusline")?GTMStatusline():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
      \   'gtm': '(exists("GTMStatusline") && ""!=GTMStatusline())'
      \ }
      \ }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" jnmap <silent> <C-l> <Plug>(jsdoc)lent> <C-l> <Plug>(jsdoc)sdoc autocomplete
let g:jsdoc_enable_es6 = 1

" autocomplete stuff
set completeopt=longest,menuone
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup omnifunc
    autocmd!
    autocmd Filetype *
            \   if &omnifunc == "" |
            \       setlocal omnifunc=syntaxcomplete#Complete |
            \   endif
    autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \ endif
augroup END
let g:SuperTabLongestHighlight = 1
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ['&omnifunc:<c-x><c-o>', '&completefunc:<c-x><c-u>']

" whitestrip on save
autocmd BufWritePre * StripWhitespace

" match tags
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'blade' : 1
    \}

" fugitive options
set diffopt+=vertical

let delimitMate_expand_cr = 1

" gtm time spend
let g:gtm_plugin_status_enabled = 1

" use hjs extension with haskell syntax
au BufNewFile,BufRead *.hjs setlocal ft=haskell
