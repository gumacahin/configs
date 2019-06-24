" --------------------------------------------------------------------
"
" mvalviar's .vimrc
"
" A little QQ...
"
" I had to completely rewrite my .vimrc since I lost the one I've been
" using. I reinstalled my system and neglected to backup my .vimrc
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
set encoding=utf-8
syntax on                    " syntax highlighting
set incsearch                " incremental search
set nohls                    " don't highlight search matches
set ignorecase
set smartcase
set expandtab                " use spaces instead of tabs
set shiftwidth=4             " number of spaces/tab
set smarttab                 " smart backspacing on tabs
set cindent                  " see KEY_BINDINGS below
set number                   " show line numbers
set directory=~/.vim/tmp     " where to save swap files
filetype plugin indent on
set wildmenu
"set nofileignorecase         " very difficult feature to get used to
"set fileignorecase
set wildignorecase
set showcmd                  " echo the keys typed in normal mode
"set spell
set autoread                 " Auto read file when file is changed outside.
set virtualedit=block
" side-scrolling
set nowrap
set sidescroll=1
set listchars=
set sidescrolloff=10
set noerrorbells visualbell t_vb= " no beeping please!
autocmd GUIEnter * set visualbell t_vb=

let mapleader=" "
nnoremap <leader>. :Tags<CR>

set nobackup
set noswapfile

" Makes hitting Cmd-S Save the buffer and enter normal mode if it's in insert
" mode

" MacVim Cmd-S save shortcut disabled please see .gvimrc
" GUI_OPTIONS {
  "if has('gui_running')
    " remove menu bar, tool bar & scroll bar... but leave the icon as is
set guioptions=i
set guifont=Iosevka:h14
  "endif

  " au GUIEnter * simalt ~x  " start maximized, windows only
  set mousemodel=popup_setpos
" }

" APPEARANCE {
  " see .gvimrc
  "colorscheme onedark " see ETC below
  "set background=dark
  " highlight current line for the active window
  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END

  set colorcolumn=81
  "highlight ColorColumn ctermbg=lightgrey guibg=grey30

  " always center currentline when possible
  set scrolloff=999

  " the status line
  set laststatus=2                                " always show SL
  set statusline=[%f]
  set statusline+=%y                              " filetype
  set statusline+=%h                              " help file flag
  set statusline+=%m                              " modified flag
  set statusline+=%r                              " read only flag
  set statusline+=%=                              " left/right separator
  set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
  set statusline+=%{&ff}]                         " file format
  set statusline+=[ASCII\ %3.3b]
  set statusline+=\[HEX\ \%02.2B]
  set statusline+=\[POS\ %c,                      " cursor column
  set statusline+=%l/%L                           " cursor line/total lines
  set statusline+=\ %P]                           " percent through file
" }

" KEY_BINDINGS {
  " now using an HHKB :)
  inoremap jk <Esc>
  nnoremap <leader>t :NERDTreeToggle<CR>
  " cindent fix for '#' comments
  "inoremap # X#
  " Pg Up/Down
"  nmap <BS> 
"  nmap <Space> 

  " window movement
  " nmap <A-h> h
  " nmap <A-l> l
  " nmap <A-k> k
  " nmap <A-j> j
  nnoremap <C-k> k
  nnoremap <C-h> h
  nnoremap <C-l> l
  nnoremap <C-j> j

  " resize current window
  nnoremap <A-Up> +
  nnoremap <A-Down> -
  nnoremap <A-Left> <
  nnoremap <A-Right> >

inoremap <C-u> <Esc>viwUea
nnoremap <C-u> viwUe

" }

" PLUGINS {
  call plug#begin('~/.vim/plugged')


    Plug 'https://github.com/junegunn/fzf.vim'

    Plug '/usr/local/opt/fzf'

    Plug 'https://github.com/itchyny/lightline.vim'

    Plug 'https://github.com/tpope/vim-eunuch'

    Plug 'https://github.com/tpope/vim-surround'

    Plug 'https://github.com/scrooloose/nerdtree'

    Plug 'https://github.com/mattn/emmet-vim'

    Plug 'https://github.com/w0rp/ale'

    Plug 'https://github.com/airblade/vim-gitgutter'

    Plug 'https://github.com/editorconfig/editorconfig-vim'

    Plug 'https://github.com/godlygeek/tabular'

    Plug 'https://github.com/sheerun/vim-polyglot'

    Plug 'https://github.com/arcticicestudio/nord-vim'

    Plug 'https://github.com/ludovicchabant/vim-gutentags'



  call plug#end()
"}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}


" Open FZF and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

" close all other windows
nnoremap <silent> <leader>o <C-w>o

" Open FZF (search buffers) and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"

" Open FZF (Rg search) and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
"
"nnoremap <silent> <C-g>g :Ag<CR>
"nnoremap <silent> <C-g>c :Commands<CR>
"nnoremap <silent> <C-g>l :BLines<CR>


autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType phtml setlocal shiftwidth=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType css,scss setlocal shiftwidth=2
colorscheme nord





