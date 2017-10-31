let mapleader=","
set shell=/bin/bash

source ~/.vim/plug.vim

set termguicolors
set mouse=a  " enable mouse
set mousehide  " hide when characters are typed
set showtabline=2

syntax on
set background=dark
colorscheme dracula
set nocursorline
set lazyredraw
set nobackup
set nowritebackup
set noswapfile
set ignorecase " Case sensitive search
set smartcase " Case sensitive when uc present
set nowrap " Do not wrap long lines
set number " Line numbers on
set relativenumber " Relative numbers on
set hidden " Allow buffer switching without saving
au BufEnter,FocusGained * checktime
set clipboard=unnamed,unnamedplus
set expandtab " Tabs are spaces, not tabs
set shiftwidth=4 " how many columns text is indented with the reindent operations (<< and >>)
set softtabstop=4 " number of spaces to use for autoindenting

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

" use hjs extension with haskell syntax
au BufNewFile,BufRead *.hjs setlocal ft=haskell
