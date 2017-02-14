call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
    " fugitive options
    set diffopt+=vertical

Plug 'vim-syntastic/syntastic', { 'do': 'npm install -g resolve-eslint' }
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
    nnoremap <Leader>v :SyntasticCheck<CR>

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'terryma/vim-multiple-cursors'
    let g:multi_cursor_next_key='<C-d>'

Plug 'Raimondi/delimitMate'
    let delimitMate_expand_cr = 1

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdcommenter'

Plug 'itchyny/lightline.vim'
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

Plug 'ervandew/supertab'
    " autocomplete stuff
    set completeopt=longest,menuone
    let g:SuperTabLongestHighlight = 1
    let g:SuperTabClosePreviewOnPopupClose = 1
    let g:SuperTabLongestEnhanced = 1
    let g:SuperTabDefaultCompletionType = 'context'
    autocmd FileType javascript setlocal omnifunc=tern#Complete
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    autocmd FileType *
        \ if &omnifunc != '' |
        \   call SuperTabChain(&omnifunc, "<c-p>") |
        \ endif

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

Plug 'shawncplus/phpcomplete.vim'

Plug 'ctrlpvim/ctrlp.vim'
    nnoremap <Leader>bb :CtrlPBuffer<CR>
    nnoremap <Leader>p :CtrlP<CR>
    let g:ctrlp_map = ''
    " Ignore files in .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plug 'scrooloose/nerdtree'
    nnoremap <Leader>ff :NERDTreeToggle<CR>
    nnoremap <Leader>f<Space> :NERDTreeFind<CR>

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

Plug 'mileszs/ack.vim', { 'do': 'sudo pacman -S --noconfirm ack' }

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

colorscheme dracula
