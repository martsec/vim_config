set nocompatible
filetype plugin on

let mapleader = ","

"Mappings
"For spellcheck (go to next or previous)
"nnoremap <spaces>s ]s 
"nnoremap <space>S [s
"For spellcheck correction
nnoremap z0 z=
"nnoremap <space>g zg
"nnoremap <space>c z=

"""""""""""""""""""""""
" Splits and tabs
"""""""""""""""""""""""
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>  " Down
nnoremap <C-K> <C-W><C-K>  " Up 
nnoremap <C-L> <C-W><C-L>  " Right
nnoremap <C-H> <C-W><C-H>  " Left


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
set wildmenu
set number
set mouse=a

set background=dark
set title
set colorcolumn=80


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
" Install plugins via vim +PlugInstall +q +q
" Clean via vim +PlugClean 
call plug#begin('~/.vim/plugged')

    " Multiple language packs
    Plug 'sheerun/vim-polyglot'
    " Editorconfig (to share the config of editors across multiple users!)
    " https://github.com/editorconfig/editorconfig-vim
    Plug 'editorconfig/editorconfig-vim'
    " Spell check for vim
    Plug 'reedes/vim-lexical'
	" Color scheme
	Plug 'joshdick/onedark.vim'
    Plug 'sonph/onehalf', { 'rtp': 'vim/' }

    " IDE like features
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-commentary' " gcc for line comment and gc in visual mode
    Plug 'dense-analysis/ale'
    Plug 'vim-airline/vim-airline' " Best status line
	Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive' " use :G to execute any git command
    Plug 'airblade/vim-gitgutter' " Which lines were modified in a file
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " vs code like completition
     " AI companion
    "Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

    Plug 'vim-ctrlspace/vim-ctrlspace' " workspace management
    Plug 'preservim/tagbar' " File structure (classes, functiuons, methods)
    Plug 'habamax/vim-asciidoctor'
    Plug 'rust-lang/rust.vim'

    Plug 'tpope/vim-dispatch' " Async background tasks (for tests for example)
" Initialize plugin system
call plug#end()

" Codeium AI companion
"set statusline+=%3{codeium#GetStatusString()}
let g:codeium_disable_bindings = 1
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>


let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0


"colorscheme onedark
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Better comments for dark env
highlight Comment ctermfg=252 ctermbg=236 guifg=#919baa guibg=#282c34
highlight CocInlayHint ctermfg=100 ctermbg=236 guifg=#958862 guibg=#282c34

" air-line
" let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"let g:airline_symbols.maxlinenr = ''


let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Set ctrlspace settings
"    needed for nvim
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
nnoremap <silent><C-p> :CtrlSpace O<CR>
" Remove it if it does not work for you
"if has('win32')
"    let s:vimfiles = '~/vimfiles'
"    let s:os   = 'windows'
"else
"    let s:vimfiles = '~/.vim'
"    if has('mac') || has('gui_macvim')
"        let s:os = 'darwin'
"    else
"    " elseif has('gui_gtk2') || has('gui_gtk3')
"        let s:os = 'linux'
"    endif
"endif
"
"let g:CtrlSpaceFileEngine = s:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . s:os . '_amd64'
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk



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

let g:lexical#spelllang = ['en_us']
let g:lexical#thesaurus = ['~/.vim/thesaurus/moby_thesaurus.txt',]
let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add',]


""""""""""""""""""""""""""
" Directory tree
""""""""""""""""""""""""""
" Focus via \n
nnoremap <leader>n :NERDTreeFocus<CR> 
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTreeFind | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowHidden=1

" From https://stackoverflow.com/questions/6624043/how-to-open-or-close-nerdtree-and-tagbar-with-leader
function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeToggle "NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTreeToggle "NERDTree
    else
        NERDTreeToggle "NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nnoremap <C-t> :call ToggleNERDTreeAndTagbar()<CR>
nnoremap <leader>t :call ToggleNERDTreeAndTagbar()<CR>

" To avoid issues when closing
" See https://github.com/preservim/tagbar/issues/869
"autocmd QuitPre * qall



""""""""""""""""""""""""""""
" Linting
""""""""""""""""""""""""""""
" See coc.vim 
"
""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""
" ,gd for git diff

function GitDiff()
    :silent write
    :silent execute '!git diff --color=always -- "' . expand('%:p') . '" | less --RAW-CONTROL-CHARS'
    :redraw!
endfunction

nnoremap <leader>gd :call GitDiff()<cr>



let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

:call tagbar#autoopen(0)


" Fold for long files
set foldmethod=indent
set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf


"""""""""""""""""""""""""""""""""""""""""
" Conquer of Completion plugin (IDE-like)
"""""""""""""""""""""""""""""""""""""""""
" Some servers have issues with backup files, see #649.
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

source ~/.vim/coc.vim

let g:my_coc_file_types = ['c', 'cpp', 'h', 'java', 'scala', 'vim', 'sh', 'py', 'rs']

"function! s:disable_coc_for_type()
"	if index(g:my_coc_file_types, &filetype) == -1
"        :silent! CocDisable
"    else
"        :silent! CocEnable
"	endif
"endfunction
"
"augroup CocGroup
"	autocmd!
"	autocmd BufNew,BufEnter * call s:disable_coc_for_type()
"augroup end


"""""""""""""""""""""""""""""""
" Asciidoctor
"""""""""""""""""""""""""""""""
"let g:asciidoctor_executable = 'asciidoctor'
let g:asciidoctor_extensions = ['asciidoctor-diagram']
"let g:asciidoctor_pdf_executable = 'asciidoctor-pdf'
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram']

" List of filetypes to highlight, default `[]`
let g:asciidoctor_fenced_languages = ['python', 'scala', 'javascript']
" Function to create buffer local mappings and add default compiler
fun! AsciidoctorMappings()
    "nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
    "nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    "nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    "nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    nnoremap <buffer> <leader>ch :Dispatch :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>cp :Dispatch :Asciidoctor2PDF<CR>
    "nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " :make will build pdfs
    compiler asciidoctor2pdf
    xnoremap <leader>b xi**<Esc>Pgv
    xnoremap <leader>i xi__<Esc>Pgv
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END

"augroup ON_ASCIIDOCTOR_SAVE | au!
"    au BufWritePost *.adoc :Dispatch :Asciidoctor2HTML
"augroup end
