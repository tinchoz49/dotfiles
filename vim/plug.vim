call plug#begin('~/.vim/plugged')

" Fuzzy finder to filter the `fd` result
Plug 'junegunn/fzf', { 'do': 'sudo pacman -S --noconfirm fzf fd' }
Plug 'junegunn/fzf.vim'
nmap <C-p> :Files<CR>
nmap <Leader>p :Commands<CR>
nmap <Leader>f :BLines<CR>
nmap <Leader>b :Buffers<CR>

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

" Status line with bufferline support
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'dracula'
let g:airline_left_sep = '   '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_extensions = ['tabline', 'branch', 'ale']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'c'  : 'C',
  \ 'i'  : 'I',
  \ 'ic' : 'I',
  \ 'ix' : 'I',
  \ 'n'  : 'N',
  \ 'ni' : 'N',
  \ 'no' : 'N',
  \ 'R'  : 'R',
  \ 'Rv' : 'R',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ 't'  : 'T',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ }

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
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" ALE: Great lint plugin
Plug 'w0rp/ale', { 'do': 'npm install -g eslint_d write-good' }
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

" Emmet suport, remember: <c-z,>,
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'

" Create jsdoc
Plug 'heavenshell/vim-jsdoc'
nmap <silent> <C-l> <Plug>(jsdoc)
" jnmap <silent> <C-l> <Plug>(jsdoc)lent> <C-l> <Plug>(jsdoc)sdoc autocomplete
let g:jsdoc_enable_es6 = 1

" Show whitespaces in your code and you can strip them
Plug 'ntpeters/vim-better-whitespace'
" whitestrip on save
augroup whitespace
  autocmd!
  autocmd BufWritePre * StripWhitespace
augroup end

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
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.js'

" syntax language
Plug 'sheerun/vim-polyglot'
Plug 'Quramy/vim-js-pretty-template'
let g:javascript_plugin_jsdoc = 1

" themes
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'

" Start - Intellisense autocomplete
Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype ==# 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup autocomplete
  autocmd!

  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" End - Intellisense autocomplete

call plug#end()
