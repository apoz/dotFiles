set nocompatible              " be iMproved, required
filetype off                  " required

" Set true colors
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

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
Plugin 'sts10/vim-mustard'
Plugin 'junegunn/seoul256.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" vim-fugitive git wrapper
Plugin 'tpope/vim-fugitive' 
Plugin 'airblade/vim-gitgutter'

"ghlight current line
set cursorline
" Plugin airline
Plugin 'bling/vim-airline'

" Indent lines
Plugin 'Yggdroot/indentLine'

"Tab autocompletion
Plugin 'ervandew/supertab'

" Syntastic linter
Plugin 'vim-syntastic/syntastic'

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

" map leader to , 
let mapleader = ","

" Highlight searches
set hlsearch
nnoremap <Leader><Space> :nohlsearch<CR>
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


" Color scheme set
filetype on
syntax enable
set background=dark
colorscheme gruvbox

" Basic configuration
" line numbers
set relativenumber
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
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:stkd_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

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
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" GitGutter enable
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
set updatetime=250

" Indentline configuration
" " set indentline style
let g:indentLine_char = '│'


" Syntastic recommended config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

nnoremap <Leader>c :SyntasticCheck<CR>:lopen<CR>
nnoremap <Leader>x :lclose<CR>:SyntasticReset<CR>
let g:syntastic_error_symbol = "💀"
let g:syntastic_warning_symbol = "🐞"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode="passive"
let g:syntastic_enable_signs=1

" Shell Linter -> Shellcheck  (brew install shellcheck)
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_python_flake8_args='--ignore E501,E302,E231,E261,E201,W402,W293'
