set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Some color-schemes
Plugin 'jpo/vim-railscasts-theme'
Plugin 'morhetz/gruvbox'
Plugin 'sickill/vim-monokai'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" vim-fugitive git wrapper
Plugin 'tpope/vim-fugitive' 
"ghlight current line
set cursorline
" Plugin airline
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Make Vim more useful
set nocompatible
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" Highlight current line
set cursorline

" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells

" Saving with sudo with :w!!
cmap w!! w !sudo tee >/dev/null %

" map leader to , 
let mapleader = ","

" Color scheme set
filetype on
syntax enable
set background=dark
colorscheme gruvbox

" Basic configuration
" line numbers
set number

" Indenting configuration
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Better search
set hlsearch
" show matching parenthesis
set showmatch

" Nerdtree configuration
" Start nerdtree if vim opened without arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Start nerdtree when opening a directory as argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" leader f for nerdtree start
nnoremap <Leader>f :NERDTreeToggle<Enter>
" Nerdtree show hidden files
let NERDTreeShowHidden=1

" Closing nerdtree when file is opened
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Airline configuration
set laststatus=2
