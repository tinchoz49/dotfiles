let mapleader=","
set shell=/bin/bash

source ~/.vim/plug.vim

set termguicolors
set mouse=a

syntax on
set background=light
colorscheme PaperColor
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

" custom keymaps
nnoremap <C-s> :update<CR>
inoremap <C-s> <ESC>:update<CR>

" buffer config
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" whitestrip on save
autocmd BufWritePre * StripWhitespace

" use hjs extension with haskell syntax
au BufNewFile,BufRead *.hjs setlocal ft=haskell
