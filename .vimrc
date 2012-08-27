" --------------------------------------------------------------------
" mvalviar's .vimrc
"
" A little QQ...
"
" I had to completely rewrite my vimrc since I lost the one I've been
" using. I reinstalled by system and neglected to backup my vimrc 
" believing it had it backed up in github. Turns out I deleted the
" repo it was in for some reason.
"
" So after learning going through a brief period of grief I rewrote my
" vimrc -- cleaner, clearer and better.
"
"                                                          -- mvalviar
"                                         Sat Aug 25 19:53:11 PHT 2012
" --------------------------------------------------------------------

" BASICS {
  set nocompatible
  syntax on             " syntax highlighting
  set incsearch         " incremental search
  set nohls             " don't highlight search matches
  set expandtab         " use spaces instead of tabs
  set shiftwidth=2      " number of spaces/tab
  set smarttab          " smart backspacing on tabs
  set autoindent        " see :help C-indent
  set smartindent
  set number            " show line numbers
  set directory=~/.vim/tmp,. "where to save swap files
  filetype plugin indent on
  set splitright
  set splitbelow
  set nowrap
  set wildmenu
" }


" GUI OPTIONS {
  if has('gui_running')
    set guioptions=    " remove menu bar, tool bar & scroll bar
    set guifont=Liberation\ Mono\ 10
  endif

  " au GUIEnter * simalt ~x  " start maximized, windows only
" }


" APPEARANCE {
  colorscheme desert
  " highlight current line for the active window
  augroup CursorLine                                            
    au!                                                         
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END

  " add column 80 marker
  set colorcolumn=81
  highlight ColorColumn ctermbg=lightgrey guibg=grey30

  " always center currentline when possible
  set scrolloff=999

  " the status line
  set laststatus=2                                " always show SL
  set statusline=
  set statusline+=%F                              " the filename
  set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
  set statusline+=%{&ff}]                         " file format
  set statusline+=%h                              " help file flag
  set statusline+=%m                              " modified flag
  set statusline+=%r                              " read only flag
  set statusline+=%y                              " filetype
  set statusline+=%=                              " left/right separator
  set statusline+=[ASCII\ %3.3b]
  set statusline+=\ [HEX\ \%02.2B] 
  set statusline+=\ %c,                           " cursor column
  set statusline+=%l/%L                           " cursor line/total lines
  set statusline+=\ %P                            " percent through file
" }

" KEY BINDINGS {
  " Pg Up/Down
  nmap <BS> 
  nmap <Space> 

  " window movement
  nmap <A-h> h
  nmap <A-l> l
  nmap <A-k> k
  nmap <A-j> j

  " resize current window
  nmap <A-Up> +
  nmap <A-Down> -
  nmap <A-Left> <
  nmap <A-Right> >

  " ctrl-s saves
  nmap <C-s> :w<CR>
  imap <C-s> <Esc>:w<CR>

  " tab movement
  nmap <A-,> :tabp<CR>
  imap <A-,> <Esc>:tabp<CR>
  nmap <A-.> :tabn<CR>
  imap <A-.> <Esc>:tabn<CR>

" }

" PLUGINS {
  call pathogen#infect()        " https://github.com/tpope/vim-pathogen

  " https://github.com/scrooloose/nerdtree
  map <silent> <left> <Esc>:NERDTreeToggle<CR>
  let g:nerdtree_tabs_open_on_gui_startup=0

  let Tlist_Use_Right_Window = 1
  map <silent> <right> <Esc>:TlistToggle<CR>
" }
