syntax on

"Matches search strings with U.C. exactly, L.C. ignors case.
set smartcase
set ignorecase

" Highlight things that we find with the search
set hlsearch

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

"Line Numbering"
set number

"Display curser position in lower right corner
set ruler

"Replace tabs with spaces
set expandtab

"Number of spaces used for indentation
set shiftwidth=4

"Number of spaces for tab
set tabstop=4

"Number of blank spaces per backspase
set softtabstop=4

"When I close a tab, remove the buffer
set nohidden

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Who doesn't like autoindent?
set autoindent

imap jj <Esc>

set ruler

" create temp files in ~/.vim-tmp and ~/.vim-swap (directories must exist)
set backup
set backupdir=~/.vim-tmp//
set directory=~/.vim-swap//
