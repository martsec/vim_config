set nocompatible
filetype plugin on

"Mappings
"For spellcheck (go to next or previous)
nnoremap <space>s ]s 
nnoremap <space>S [s
"For spellcheck correction
nnoremap z0 z=
nnoremap <space>g zg
nnoremap <space>c z=

:command Pretty %!python -m json.tool
:command Adoc asciidoctor @%

"set backspace=indent,eol,start
set history=1000
set autoread
set hidden

" TMP file options
set directory=$HOME/.vim/swp// "Directory for swap files
set nobackup
set undofile "Mantain undo history between sessions
set undodir=$HOME/.vim/undodir

" User Interface Options
set laststatus=2 "Always display status bar
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set wildmenu
set number
"set mouse=a
set background=dark
set title

colorscheme desert

" Indentation options
"set autoindent
"filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Search options
set incsearch
set hlsearch

" Text rendering options
set encoding=utf-8
set linebreak
set scrolloff=3
syntax on

" Open files from the vim explorer
"let g:netrw_liststyle = 3
"let g:netrw_winsize = 20
"let g:netrw_banner = 0
"let g:netrw_browse_split = 1

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Multiple language packs
Plug 'sheerun/vim-polyglot'
" Editorconfig (to share the config of editors across multiple users!)
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'
" Spell check for vim
Plug 'reedes/vim-lexical'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Initialize plugin system
call plug#end()


" vim-lexical
" See https://linuxhint.com/vim_spell_check/
" and https://web.archive.org/web/20200313074256/https://linuxhint.com/vim_spell_check/
let g:lexical#spell = 1
augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType asciidoc call lexical#init()
    autocmd FileType html,html.tmpl call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spelllang = ['en_us',]
let g:lexical#thesaurus = ['~/.vim/thesaurus/moby_thesaurus.txt',]
let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add',]
