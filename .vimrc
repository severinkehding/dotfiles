set nocompatible                       " use vim settings, must be first line

" let pathogen autoinstall bundles
execute pathogen#infect()

" colors
set background=dark
colorscheme solarized

set backspace=indent,eol,start         " allow backspacing over everything in insert mode

set nobackup                           " do not keep a backup file
set nowritebackup                      " do not write a backup during actual write
set noswapfile                         " do not use a swap file
set history=500                        " entries in command line history
set ruler                              " show the cursor position all the time
set cursorline                         " highlight line where the cursor is
set showcmd                            " display incomplete commands

set number                             " display line numbers

" searching
set hlsearch                           " hightlight search results
set incsearch                          " incremental search
set ignorecase                         " ignore case when searching
set smartcase                          " search case sensitive if an upper case letter is used

" remove highlight of last search in normal mode
noremap <C-n> :nohl<CR>
" remove highlight of last search in visual mode 
vnoremap <C-n> :nohl<CR>

" Indent code blocks in visual mode without losing selection
vnoremap < <gv
vnoremap > >gv

filetype off                           " reset filetype settings
filetype plugin indent on              " enable file type detection
syntax on                              " enable syntax highlighting

" Don't use tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set encoding=utf-8                     " default file encoding
set fileformat=unix                    " default end of line format

set laststatus=2                       " always display status line for airplane
let g:airline_powerline_fonts = 1      " use fancy powerline fonts

set timeoutlen=300                     " timeout for using a leader key

" use Ctrl-p and Ctr-n to scroll thorugh history in command mode just like
" with cursor up and down
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

set wildmode=longest:list              " use command expansion like bash

" enable %% in command mode for current file's path extension
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

runtime macros/matchit.vim
