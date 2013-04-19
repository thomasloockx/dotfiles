"
" .vimrc - Thomas Loockx
" 
" * alternate plugin to switch between header files and implemention files.
" * taglist plugin to show tags on a page.
" * snippets plugin for snippets
" * CommandT for file navigation.
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
" resource the this file
map <F12> :source ~/.vimrc<CR>
" clear highlighting after search
map <silent> ,/ :nohlsearch<CR>
" use the ruler
set ruler
" insert my marker
map ,m i// DO_NOT_COMMIT(tloockx)<ESC>

" *** use idutils to grep ***
set grepprg='gid'
map <F5> :grep <cword><CR>:tabedit<CR>:cw<CR>
map <F6> :cprev<CR>
map <F7> :cnext<CR>

" *** Tabular configuration ***
map ,a= :Tabularize /=<CR>

" *** Pathogen configuration ***
" Use pathogen to manage vim plugins
call pathogen#infect()

" *** CommandT configuration ***
" shortcut for CommandT
map ,f :CommandT<CR>

" *** taglist.vim configuration ***
" map the toggle command
map ,t :TlistToggle<CR>
" only show tags for the current buffer
let Tlist_Show_One_File = 1
" highlight the current tag
let Tlist_Auto_Highlight_Tag = 1
" put the tags on the right
let Tlist_Use_Right_Window  = 1
" always update the tags
let Tlist_Auto_Update = 1
" make the window wider
let Tlist_WinWidth = 50

" show my TODO list
map <F2> :split~/TODO.txt<CR>

" Runs make in the appropriate build directory.
function! BuildOctane(buildDir)

    " See if the build directory is not bogus.
    let s:buildDirPath = finddir(a:buildDir)
    if strlen(s:buildDirPath) == 0
        echo "Invalid build directory: " . a:buildDir 
        return
    endif

    " Modify the make program.
    let &makeprg="make --directory=" . s:buildDirPath
    echo &makeprg

    " Run make
    make
endfunction
" Common build configs
command! Build       execute BuildOctane("build")
command! BuildMaster execute BuildOctane("build_master")
command! BuildSlave  execute BuildOctane("build_slave")
command! BuildSdk    execute BuildOctane("build_sdk")
