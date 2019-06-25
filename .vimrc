let mapleader=','
set shell=/bin/bash

source ~/.vim/plug.vim

syntax on
colorscheme dracula
set background=dark

set termguicolors
set mouse=a  " enable mouse
set mousehide  " hide when characters are typed
set showtabline=2
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " don't give ins-completion-menu messages.
set signcolumn=yes " always show signcolumns
set completeopt=menuone,noinsert,noselect
set noshowmode
set cmdheight=2 " Better display for messages
set lazyredraw
set nocursorline
set lazyredraw
set nobackup
set nowritebackup
set backupcopy=yes
set noswapfile
set ignorecase " Case sensitive search
set smartcase " Case sensitive when uc present
set nowrap " No wrap long lines
set number " Line numbers on
set relativenumber " Relative numbers on
set hidden " Allow buffer switching without saving
set clipboard=unnamed,unnamedplus
set expandtab " Tabs are spaces, not tabs
set shiftwidth=4 " how many columns text is indented with the reindent operations (<< and >>)
set softtabstop=4 " number of spaces to use for autoindenting
set laststatus=2 " for airline

" search on visual selector text
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>

" custom keymaps
nnoremap <C-s> :update<CR>
inoremap <C-s> <ESC>:update<CR>

" buffer config
nnoremap <C-right> :bnext<CR>
nnoremap <C-left> :bprevious<CR>

" fuck you :suspend
nnoremap <C-z> <nop>

augroup myconfig
  autocmd!

  " Update the editor from remote changes
  au BufEnter,FocusGained * checktime

  " use hjs extension with haskell syntax
  au BufNewFile,BufRead *.hjs setlocal ft=haskell

  " Use a VimLeave autocommand to set the cursor style when Nvim exits
  au VimLeave * set guicursor=a:block-blinkon0
augroup end

if exists('veonim')

" built-in plugin manager
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

" extensions for web dev
let g:vscode_extensions = [
  \'vscode.typescript-language-features',
  \'vscode.css-language-features',
  \'vscode.html-language-features',
\]

" multiple nvim instances
nno <silent> <c-t>c :Veonim vim-create<cr>
nno <silent> <c-g> :Veonim vim-switch<cr>
nno <silent> <c-t>, :Veonim vim-rename<cr>

" workspace functions
nno <silent> ,f :Veonim files<cr>
nno <silent> ,e :Veonim explorer<cr>
nno <silent> ,b :Veonim buffers<cr>
nno <silent> ,d :Veonim change-dir<cr>
"or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

" searching text
nno <silent> <space>fw :Veonim grep-word<cr>
vno <silent> <space>fw :Veonim grep-selection<cr>
nno <silent> <space>fa :Veonim grep<cr>
nno <silent> <space>ff :Veonim grep-resume<cr>
nno <silent> <space>fb :Veonim buffer-search<cr>

" language features
nno <silent> sr :Veonim rename<cr>
nno <silent> sd :Veonim definition<cr>
nno <silent> si :Veonim implementation<cr>
nno <silent> st :Veonim type-definition<cr>
nno <silent> sf :Veonim references<cr>
nno <silent> sh :Veonim hover<cr>
nno <silent> sl :Veonim symbols<cr>
nno <silent> so :Veonim workspace-symbols<cr>
nno <silent> sq :Veonim code-action<cr>
nno <silent> sk :Veonim highlight<cr>
nno <silent> sK :Veonim highlight-clear<cr>
nno <silent> ,n :Veonim next-usage<cr>
nno <silent> ,p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
nno <silent> <c-n> :Veonim next-problem<cr>
nno <silent> <c-p> :Veonim prev-problem<cr>

endif
