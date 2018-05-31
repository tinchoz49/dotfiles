call plug#begin('~/.vim/plugged')

" prev: sudo pacman -S fzf fd
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
map <C-p> :Files<CR>
map <Leader>p :Commands<CR>
map <Leader>f :BLines<CR>
map <Leader>b :Buffers<CR>

" Better way to work with copy and paste in vim
Plug 'svermeulen/vim-easyclip'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
map <Leader>n :NERDTreeFind<CR>
let g:NERDTreeMouseMode = 2
let g:NERDTreeMapMenu='M'

" Git support for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git support in vim
Plug 'tpope/vim-fugitive'
" fugitive options: Gdiff split in vertical mode by default
set diffopt+=vertical

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

" Devicons in the files
Plug 'ryanoasis/vim-devicons'
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" ALE: Fucking great lint plugin
Plug 'w0rp/ale', { 'do': 'npm install -g eslint_d prettier-standard' }
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_statusline_format = ['✕ %d', '⚠ %d', '✔ ok']
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_linters = {
  \ 'javascript': ['eslint', 'standard']
\}
let g:ale_dockerfile_hadolint_use_docker = 'yes'
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier-standard'],
  \ 'json': ['prettier'],
  \ 'ruby': ['rubocop'],
  \ 'rust': ['rustfmt']
\}
nnoremap <C-f> :ALEFix<CR>

function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '✓' : ''
endfunction

" Lightline
Plug 'itchyny/lightline.vim'
" Status line with bufferline support
Plug 'taohex/lightline-buffer'

let g:lightline = {
            \ 'colorscheme': 'Dracula',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'filename', 'linter_warnings', 'linter_errors', 'linter_ok', 'gtm', 'modified', 'cap', 'gutentags' ] ]
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
            \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
            \   'cap': '%{vimcaps#statusline(-3)}',
            \   'gutentags': '%{exists("*gutentags#statusline")?gutentags#statusline("ctags..."):""}',
            \   'separator': '',
            \   'buffers': 'buffers'
            \ },
            \ 'component_function': {
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \   'bufferinfo': 'lightline#buffer#bufferinfo'
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
            \   'gutentags': '(exists("*gutentags#statusline") && (gutentags#statusline("show") == "show"))'
            \ },
            \ 'component_expand': {
            \   'buffercurrent': 'lightline#buffer#buffercurrent',
            \   'bufferbefore': 'lightline#buffer#bufferbefore',
            \   'bufferafter': 'lightline#buffer#bufferafter',
            \   'linter_warnings': 'LightlineLinterWarnings',
            \   'linter_errors': 'LightlineLinterErrors',
            \   'linter_ok': 'LightlineLinterOK'
            \ },
            \ 'component_type': {
            \   'buffercurrent': 'tabsel',
            \   'bufferbefore': 'raw',
            \   'bufferafter': 'raw',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error'
            \ },
            \ 'tabline': {
            \   'left': [ [ 'bufferinfo' ],
            \             [ 'separator' ],
            \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
            \   'right': [ [ 'buffers' ], ],
            \ },
            \ 'tabline_separator': { 'left': '' }
        \ }

autocmd User ALELint call lightline#update()

" Emmet suport, remember: <c-z,>,
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#file#enable_buffer_path = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect
set shortmess+=c
set pumheight=15

Plug 'Shougo/echodoc.vim'
set noshowmode
let g:echodoc#enable_at_startup = 1

" Create jsdoc
Plug 'heavenshell/vim-jsdoc'
nmap <silent> <C-l> <Plug>(jsdoc)
" jnmap <silent> <C-l> <Plug>(jsdoc)lent> <C-l> <Plug>(jsdoc)sdoc autocomplete
let g:jsdoc_enable_es6 = 1

" Show whitespaces in your code and you can strip them
Plug 'ntpeters/vim-better-whitespace'
" whitestrip on save
autocmd BufWritePre * StripWhitespace

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
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Amazing search and replace plugin, the command is: CtrlSF <search_value>
Plug 'dyng/ctrlsf.vim'

" Livepreview to markdown
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }

" mappings for ex commands
" ]q is :cnext. [q is :cprevious. ]a is :next. [b is :bprevious
Plug 'tpope/vim-unimpaired'

" Wipe a file from the buffer and keep the window/split intact
Plug 'qpkorr/vim-bufkill'
let g:BufKillCreateMappings = 0
nnoremap <C-k> :BW<CR>

" Vim sugar for the UNIX shell commands that need it the most
Plug 'tpope/vim-eunuch'

" Never be bothered by caps lock
Plug 'suxpert/vimcaps'

Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.js'

" syntax language

" javascript / typescript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
let g:javascript_plugin_jsdoc = 1
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
let g:vim_jsx_pretty_colorful_config = 1
Plug 'leafgarland/typescript-vim'
Plug 'mhartington/nvim-typescript', {
  \'branch': 'next-node',
  \'do': ':UpdateRemotePlugins && cd rplugin/node/nvim_typescript && npm install --no-package-lock'
  \}
let g:nvim_typescript#javascript_support = 1
""Plug 'styled-components/vim-styled-components', { 'branch': 'rewrite' }

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'

Plug 'dag/vim-fish'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-haml'
Plug 'cespare/vim-toml'
Plug 'jparise/vim-graphql'

" themes
Plug 'dracula/vim'

call plug#end()
