if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Defx
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': 'sudo pacman -S --noconfirm fzf ripgrep' }
Plug 'junegunn/fzf.vim'
nmap <C-p> :Files<CR>
nmap <Leader>p :Commands<CR>
nmap <Leader>f :BLines<CR>
nmap <Leader>b :Buffers<CR>

" Amazing search and replace plugin, the command is: CtrlSF <search_value>
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'rg'
"let g:ctrlsf_extra_backend_args = { 'rg': '--hidden' }

" Livepreview to markdown
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }

" Better way to work with copy and paste in vim
Plug 'svermeulen/vim-easyclip'

" Status line with bufferline support
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git support in vim
Plug 'tpope/vim-fugitive'
" fugitive options: Gdiff split in vertical mode by default
set diffopt+=vertical

" Is all about surroundings: parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-surround'

" Use the dot key to repeat the last command
Plug 'tpope/vim-repeat'

" Editorconfig support for vim
Plug 'editorconfig/editorconfig-vim'

" Comment your code lines
Plug 'scrooloose/nerdcommenter'

" Devicons in the files
Plug 'ryanoasis/vim-devicons'
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" ALE: Great lint plugin
Plug 'w0rp/ale', { 'do': 'npm install -g eslint_d write-good' }

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
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

syntax on
colorscheme dracula
set background=dark

source ~/.vim/plugins/ale.vim
source ~/.vim/plugins/airline.vim
source ~/.vim/plugins/coc.vim
source ~/.vim/plugins/defx.vim
