" .vimrc - Thomas Loockx

" syntax highlighting is always nicer
syntax enable
" configure the color scheme
set background=dark
" no vi compatibility
set nocompatible
" line numbers
set number
" highlight search
set hlsearch
" incremental search
set incsearch
" case-insensitive search
set ignorecase 
" 4 spaces shift
set shiftwidth=4
set ts=4
" set guifont for a nicer MacVim experience
set guifont=Menlo:h13
" no need to escape magic tokens in regexp
set magic
" enable the mouse in vim
set mouse=a
" always have a status line
set laststatus=2
" make backspace work as expected.
set backspace=indent,eol,start
" insert spaces instead of tabs
set expandtab
" 4 spaces in a tab
set tabstop=4
" use auto indentation 
set autoindent
" use c-style indentation
set cindent
" use C style comments
set comments=sl:/*,mb:*,elx:*/
" save my marks in the viminfo file
set viminfo='100,f1
" show a line at column 100
set colorcolumn=120
" more undo
set undolevels=100
" more cmd/search history
set history=100
" prevent swap files & backup. never use them as they're only annoying.
set nobackup
set noswapfile
" Set the height of the preview window
set previewheight=20
" Set the update time for tags      
set updatetime=500
" clear highlighting after search
map <silent> ,/ :nohlsearch<CR>
" use the ruler
set ruler
" insert my marker
map ,m i// DO_NOT_COMMIT(tloockx)<ESC>
" ignore some files in vim
set wildignore+=*.o,.svn,build/**
" make sure .md is recognized as Markdown and not Modula-2 syntax
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" error format for my quickfix lists
set errorformat+=%f:%l\ %m
" load the quickfix list
map <F5> :cfile ./build/debug_standalone/vim_quicklist.txt<CR>
" easy quickfix list navigation
map <F6> :cprev<CR>
map <F7> :cnext<CR>
" make the , key the leader
let mapleader=','

set rtp+=/usr/local/opt/fzf

" vim-plug configuration
filetype off
call plug#begin('~/.vim/plugged')
Plug '~/.fzf'
Plug 'VundleVim/Vundle.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'lifepillar/vim-solarized8'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'alok/notational-fzf-vim'
call plug#end()
filetype plugin on

let mapleader=','
nmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>n :NERDTreeToggle<CR>

" show my TODO list
map <F2> :split~/TODO.txt<CR>

" modify the settings for writing prose in the current buffer
function! WriteProse()
    echo "Prose"
    setlocal textwidth=80
    setlocal formatoptions=ant
    setlocal colorcolumn=80
    setlocal wrapmargin=0
    setlocal nocindent
    setlocal nosmartindent
    setlocal autoindent
endfunction
command! Prose call WriteProse()

let g:ale_linters = {
\   'python': ['flake8'],
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   'python': ['isort']
\}

colorscheme solarized

let g:nv_search_paths = ['~/notes']
