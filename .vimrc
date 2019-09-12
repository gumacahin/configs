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

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ BASICS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" The alpha and omega.
set nocompatible

set encoding=utf-8

" Turn syntax highlighting on.
syntax on

" Turn on incremental search.
" Don't highlight search matches.
set incsearch
set nohls

" Ignore case when searching but don't ignore case when there are upper case
" chars in search.
set ignorecase
set smartcase

" Let's use tabs!
set tabstop=4

" Use tabstop value. Should we ever decide to turn tabs into spaces again via
" expandtabs this setting will fallback to the tabstop setting above.
set expandtab
set shiftwidth=0

" Use smart backspacing on expanded tabs. Again, only if we ever go back to
" expandtabs.
set smarttab

" Show line numbers.
set number

" It turns on `detection', `plugin' and `indent' at once.
" See @{https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent}.
filetype plugin indent on

" Wildmenu settings. Too lengthy to explain.
set wildmenu
set wildignorecase

" Echo the keys typed in normal mode.
set showcmd

" Auto read file when file is changed outside.
set autoread

" Useful when block editing.
set virtualedit=block

" I still find wrapping difficult to get used to.
set nowrap

set sidescroll=1

" I'm not used to the weird symbols gets appended at the end of lines when
" they are too long.
set listchars=
set sidescrolloff=10

" No beeping please!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Set where to save swap files.
set directory=~/.vim/tmp
set nobackup
set noswapfile

set mousemodel=popup_setpos

set spelllang="en_us"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ APPEARANCE ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set guifont=Iosevka:h14

" Turn off everything except the app icon.
set guioptions=i

" Highlight the current row in the active window.
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

set colorcolumn=81

" Always center currentline when possible.
set scrolloff=999

" Using Lightline plugin as the status line.
	set laststatus=2
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ KEY BINDINGS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let mapleader=" "
nnoremap <leader>. :Tags<cr>

" Using a Mac. Cmd-S saves the file. See .gvimrc which has the ff:
" macmenu File.Save key=<nop>
" macmenu File.Save\ All key=<nop>
" macmenu File.Save\ As\.\.\. key=<nop>
" " Exit to Normal mode upon [Cmd+S]
" inoremap <D-s> <Esc>:w<cr><Right>
" vnoremap <D-s> <Esc>:w<cr>
" Save in Normal mode (block Substitute)
"nnoremap <D-s> :w<cr>

" Easy escape.
inoremap jk <esc>

" Uppercase word.
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Toogle NERDTree.
nnoremap <c-n> :NERDTreeToggle<cr>

" Edit/Source my .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Window related bindings.
" Close all other windows.
nnoremap <silent> <leader>o <c-w>o
" Window movement.
nnoremap <c-k> k
nnoremap <c-h> h
nnoremap <c-l> l
nnoremap <c-j> j
" Resize current window.
nnoremap <A-Up> +
nnoremap <A-Down> -
nnoremap <A-Left> <
nnoremap <A-Right> >

" Bindings for FZF. 
" Open FZF and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" Open FZF (search buffers) and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
" Open FZF (Rg search) and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~ PLUGINS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

Plug 'https://github.com/arcticicestudio/nord-vim'

Plug 'https://github.com/ludovicchabant/vim-gutentags'

Plug 'https://github.com/tpope/vim-commentary'

Plug 'https://github.com/sheerun/vim-polyglot'

Plug 'https://github.com/mxw/vim-jsx'

call plug#end()

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

let g:lightline = {
\    'colorscheme': 'nord',
\    'active': {
\      'right': [ [ 'lineinfo' ],
\                 [ 'percent' ],
\                 [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ],
\               ]
\    },
\    'component': {
\      'charvaluehex': '0x%02B',
\    },
\ }

"~~~~~~~~~~~~~~~~~~~~~~~~~ AUTOCOMMANDS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
autocmd FileType javascript,javascript.jsx setlocal tabstop=2
autocmd FileType phtml setlocal tabstop=2
autocmd FileType html setlocal tabstop=2
autocmd FileType css,scss setlocal tabstop=2
autocmd FileType vim setlocal tabstop=2

runtime macros/matchit.vim

colorscheme nord
