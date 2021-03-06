let mapleader=','
" set shell=/bin/bash

source ~/.vim/plug.vim

set termguicolors
set mouse=a  " enable mouse
set mousehide  " hide when characters are typed
set showtabline=2
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " don't give ins-completion-menu messages.
set signcolumn=yes " always show signcolumns
set completeopt=menuone,noinsert,noselect
set noshowmode
set cmdheight=1 " Better display for messages
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
set nofoldenable " disable folding

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

nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

augroup myconfig
  autocmd!

  " Update the editor from remote changes
  au BufEnter,FocusGained * checktime

  " use hjs extension with haskell syntax
  au BufNewFile,BufRead *.hjs setlocal ft=haskell

  " Use a VimLeave autocommand to set the cursor style when Nvim exits
  au VimLeave * set guicursor=a:block-blinkon0
augroup end
