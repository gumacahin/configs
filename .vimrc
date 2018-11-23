" --------------------------------------------------------------------
"
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
  set encoding=utf-8
  "set shell=/bin/bash\ --login " for RVM
  syntax on                    " syntax highlighting
  set incsearch                " incremental search
  set nohls                    " don't highlight search matches
  set ignorecase
  set smartcase
  set expandtab                " use spaces instead of tabs
  set shiftwidth=4             " number of spaces/tab
  set smarttab                 " smart backspacing on tabs
  set cindent                  " see KEY BINDINGS below
  set number                   " show line numbers
  set directory=~/.vim/tmp,.   " where to save swap files
  filetype plugin indent on
  set wildmenu
  set nofileignorecase         " very difficult feature to get used to
  set showcmd                  " echo the keys typed in normal mode
  "set spell
  set virtualedit=block
  " side-scrolling
  set nowrap
  set sidescroll=1
  set listchars=
  set sidescrolloff=10
  set noerrorbells visualbell t_vb= " no beeping please!
  autocmd GUIEnter * set visualbell t_vb=
  let mapleader="\\"
" }


" GUI OPTIONS {
  if has('gui_running')
    " remove menu bar, tool bar & scroll bar... but leave the icon as is
    set guioptions=i




    set guifont=Roboto\ Mono:h14
  endif

  " au GUIEnter * simalt ~x  " start maximized, windows only
  set mousemodel=popup_setpos
" }


" APPEARANCE {
  " see .gvimrc
  "colorscheme onedark
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

" KEY BINDINGS {
  " now using an HHKB :)
  imap jj <Esc>
  " cindent fix for '#' comments
  inoremap # X#
  " Pg Up/Down
"  nmap <BS> 
"  nmap <Space> 

  " window movement
  " nmap <A-h> h
  " nmap <A-l> l
  " nmap <A-k> k
  " nmap <A-j> j
  nmap <up> k
  nmap <left> h
  nmap <right> l
  nmap <down> j

  " resize current window
  nmap <A-Up> +
  nmap <A-Down> -
  nmap <A-Left> <
  nmap <A-Right> >

  map <C-n> :NERDTreeToggle<CR>

" }

" PLUGINS {
  call pathogen#infect()        " https://github.com/tpope/vim-pathogen
  " vim-airline
  let g:airline_powerline_fonts = 1

" }

" TEMPLATES {
  augroup Templates
    au!
    au BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
  augroup END
" }

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType phtml setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" ETC
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif
