call plug#begin('~/.vim/plugged')

" Fuzzy finder to filter the `fd` result
Plug 'junegunn/fzf', { 'do': 'sudo pacman -S --noconfirm fzf fd' }
Plug 'junegunn/fzf.vim'
map <C-p> :Files<CR>
map <Leader>p :Commands<CR>
map <Leader>f :BLines<CR>
map <Leader>b :Buffers<CR>

" Search plugins
Plug 'mileszs/ack.vim', { 'do': 'sudo pacman -S --noconfirm ripgrep' }
let g:ackprg = 'rg -n --vimgrep'

" Amazing search and replace plugin, the command is: CtrlSF <search_value>
Plug 'dyng/ctrlsf.vim', { 'do': 'sudo pacman -S --noconfirm ripgrep' }
let g:ctrlsf_ackprg = 'rg'
"let g:ctrlsf_extra_backend_args = { 'rg': '--hidden' }

" Livepreview to markdown
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }

" Better way to work with copy and paste in vim
Plug 'svermeulen/vim-easyclip'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
map <Leader>n :call OpenNerdTreeOnLastBuffer()<CR>
let g:NERDTreeMouseMode = 2
let g:NERDTreeMapMenu='M'
function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction
function! OpenNerdTreeOnLastBuffer()
  let bufferPath = expand('%:p')
  :NERDTreeToggle
  if (IsNerdTreeEnabled())
    :execute ':NERDTreeFind ' . bufferPath
  endif
endfunction

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

" ALE: Great lint plugin
Plug 'w0rp/ale', { 'do': 'npm install -g eslint_d' }
let g:ale_lint_on_text_changed = 'never'
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_linters = {
  \ 'javascript': ['eslint']
\}
let g:ale_dockerfile_hadolint_use_docker = 'yes'
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'json': ['prettier'],
  \ 'ruby': ['rubocop'],
  \ 'rust': ['rustfmt']
\}
nnoremap <C-f> :ALEFix<CR>

" Lightline
Plug 'itchyny/lightline.vim'

" Lightline ALE
Plug 'maximbaz/lightline-ale'

" Status line with bufferline support
Plug 'taohexxx/lightline-buffer'
" Show full path of filename
function! FilenameForLightline()
    return fnamemodify(expand('%'), ":.")
endfunction
let g:lightline = {
            \ 'colorscheme': 'Dracula',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'modified', 'filename' ] ],
            \   'right': [ [ 'lineinfo' ],
		        \              [ 'percent' ],
		        \              [ 'fileformat', 'fileencoding', 'filetype' ],
            \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
            \ },
            \ 'component': {
            \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
            \   'cap': '%{vimcaps#statusline(-3)}',
            \   'separator': '',
            \   'buffers': 'buffers'
            \ },
            \ 'component_function': {
            \   'filename': 'FilenameForLightline',
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \   'bufferinfo': 'lightline#buffer#bufferinfo'
            \ },
            \ 'component_visible_condition': {
            \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
            \ },
            \ 'component_expand': {
            \   'buffercurrent': 'lightline#buffer#buffercurrent',
            \   'bufferbefore': 'lightline#buffer#bufferbefore',
            \   'bufferafter': 'lightline#buffer#bufferafter',
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok'
            \ },
            \ 'component_type': {
            \   'buffercurrent': 'tabsel',
            \   'bufferbefore': 'raw',
            \   'bufferafter': 'raw',
            \   'linter_checking': 'left',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'left'
            \ },
            \ 'tabline': {
            \   'left': [ [ 'bufferinfo' ],
            \             [ 'separator' ],
            \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
            \   'right': [ [ 'buffers' ], ],
            \ },
            \ 'tabline_separator': { 'left': '' }
        \ }

" Emmet suport, remember: <c-z,>,
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'

" autocomplete
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
let g:LanguageClient_serverCommands = {
\ 'rust': ['rustup', 'run', 'stable', 'rls'],
\ 'javascript.jsx': ['typescript-language-server', '--stdio']
\ }
let g:LanguageClient_diagnosticsEnable = 0

"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

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
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1 }

" Move your code lines in a cool way
Plug 'matze/vim-move'

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
Plug 'sheerun/vim-polyglot'
Plug 'Quramy/vim-js-pretty-template'

" themes
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()
