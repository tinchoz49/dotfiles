let mapleader=","
set shell=/bin/bash

source ~/.vim/plug.vim

if (has("termguicolors"))
    set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

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
hi Search ctermfg=17 ctermbg=228 cterm=NONE guifg=#282a36 guibg=#f1fa8c gui=NONE

" custom keymaps
nnoremap <C-s> :update<CR>
inoremap <C-s> <ESC>:update<CR>

" buffer config
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-b><C-w> :bw<CR>

" whitestrip on save
autocmd BufWritePre * StripWhitespace

" use hjs extension with haskell syntax
au BufNewFile,BufRead *.hjs setlocal ft=haskell


