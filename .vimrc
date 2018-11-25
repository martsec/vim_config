set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

so ~/.vim/plugins.vim " For VundleVim
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

set backspace=indent,eol,start
set history=1000
set autoread
set hidden

" TMP file options
set directory=$HOME/.vim/swp// "Directory for swap files
set nobackup
set undofile "Mantain undo history between sessions
set undodir=$HOME/.vim/undodir

"User Interface Options
set laststatus=2 "Always display status bar
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set wildmenu
set number
set mouse=a
set background=dark
set title

colorscheme desert

" Indentation options
set tabstop=4
"set autoindent
set shiftwidth=2
set expandtab

" Search options
set incsearch
set hlsearch

" Text rendering options
set linebreak
set scrolloff=3
set encoding=utf8
set fileencoding=utf8
syntax on
