"
" .vimrc - Thomas Loockx
" 
" * Use alternate plugin to switch between header files and implemention files.
" * Use taglist plugin to show tags on a page.
" * Use snippets plugin for snippets
"

syntax enable
filetype plugin on

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
" no need to escape magic tokens in regexp
set magic
" enable the mouse in vim
set mouse=a
" set background / does this do anything for me?
"set background=light
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
" Save my marks in the viminfo file
set viminfo='100,f1
" more undo
set undolevels=100
" more cmd/search history
set history=100
" prevent swap files & backup, never use them and they're only annoying.
set nobackup
set noswapfile
" Set the height of the preview windo
set previewheight=20
" Set the update time for tags      
set updatetime=500
" resource the this file
map <F12> :source ~/.vimrc<CR>
" clear highlighting after search
map <silent> ,/ :nohlsearch<CR>
" Toggle tag list
map ,t :TlistToggle<CR>
" use the ruler
set ruler
" Use pathogen to manage vim plugins
call pathogen#infect()
