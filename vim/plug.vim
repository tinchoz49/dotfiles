call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    nnoremap <Leader>bb :Buffers<CR>
    nnoremap <Leader>p :History<CR>
    nnoremap <Leader>t :Files<CR>

Plug 'scrooloose/nerdtree'
    nnoremap <Leader>ff :NERDTreeFind<CR>

Plug 'tpope/vim-fugitive'
    " fugitive options
    set diffopt+=vertical

Plug 'w0rp/ale'
    let g:ale_lint_on_enter = 0
    let g:ale_lint_delay = 2000
    let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    let g:ale_javascript_eslint_use_global = 1
    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \}

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 1

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdcommenter'

Plug 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'fugitive', 'readonly', 'filename', 'ale', 'gtm', 'modified' ] ]
          \ },
          \ 'component': {
          \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
          \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
          \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
          \   'ale': '%{ALEGetStatusLine()}',
          \   'gtm': '%{exists("*GTMStatusline")?GTMStatusline():""}'
          \ },
          \ 'component_visible_condition': {
          \   'readonly': '(&filetype!="help"&& &readonly)',
          \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
          \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
          \   'gtm': '(exists("GTMStatusline") && ""!=GTMStatusline())'
          \ }
          \ }

Plug 'mattn/emmet-vim'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    let g:ycm_complete_in_comments_and_strings=1
    let g:ycm_use_ultisnips_completer = 1
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_always_populate_location_list = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    set completeopt-=preview
    set completeopt+=menu,menuone,noinsert,noselect
    set shortmess+=c

Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
    let g:tern_show_signature_in_pum = 1
    let g:tern_show_argument_hints = 'on_hold'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'heavenshell/vim-jsdoc'
    nmap <silent> <C-l> <Plug>(jsdoc)
    " jnmap <silent> <C-l> <Plug>(jsdoc)lent> <C-l> <Plug>(jsdoc)sdoc autocomplete
    let g:jsdoc_enable_es6 = 1

Plug 'ntpeters/vim-better-whitespace'

Plug 'Chiel92/vim-autoformat', { 'do': 'npm install -g js-beautify' }
    let g:formatdef_jsbeautify_javascript = '"js-beautify -a -X -p -f - -".(&expandtab ? "s ".shiftwidth() : "t").(&textwidth ? " -w ".&textwidth : "")'
    nnoremap <C-f> :Autoformat<CR>

Plug 'Valloric/MatchTagAlways'
    let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \ 'blade' : 1
        \}

Plug 'matze/vim-move'

Plug 'mileszs/ack.vim', { 'do': 'sudo pacman -S --noconfirm the_silver_searcher' }
    let g:ackprg = 'ag --nogroup --nocolor --column'

Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }

Plug 'git-time-metric/gtm-vim-plugin'
    " gtm time spend
    let g:gtm_plugin_status_enabled = 1

Plug 'tpope/vim-unimpaired'

Plug 'svermeulen/vim-easyclip'
    let g:EasyClipUseCutDefaults = 0
    nmap x <Plug>MoveMotionPlug
    xmap x <Plug>MoveMotionXPlug
    nmap xx <Plug>MoveMotionLinePlug

Plug 'qpkorr/vim-bufkill'
    nnoremap <C-b><C-w> :BW<CR>

" extra syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
    let g:jsx_ext_required = 0

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

colorscheme dracula
