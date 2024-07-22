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

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BASICS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%% APPEARANCE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set guifont=Iosevka:h16

"Turn off everything except the app icon.
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
"inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>

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
nnoremap <silent> <leader>= <c-w>=
" Window movement.
nnoremap <c-k> k
nnoremap <c-h> h
nnoremap <c-l> l
nnoremap <c-j> j

" Resize current window.
nnoremap <M-Up> <c-w>+
nnoremap <M-Down> <c-w>- 
nnoremap <M-Left> <c-w><
nnoremap <M-Right> <c-w>>


" Bindings for FZF. 
" Open FZF and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" Open FZF (search buffers) and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader>b (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
" Open FZF (Rg search) and prevent FZF from opening a file in the nerdtree window.
nnoremap <silent> <expr> <Leader>r (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"

"%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLUGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

Plug 'https://github.com/sbdchd/neoformat'

Plug 'https://github.com/arcticicestudio/nord-vim'
 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

Plug 'https://github.com/itchyny/lightline.vim'

Plug 'https://github.com/scrooloose/nerdtree'

Plug 'https://github.com/dense-analysis/ale'

Plug 'https://github.com/airblade/vim-gitgutter'

Plug 'https://github.com/editorconfig/editorconfig-vim'

" Plug 'https://github.com/ludovicchabant/vim-gutentags'

Plug 'https://github.com/tpope/vim-commentary'

Plug 'pangloss/vim-javascript'    " JavaScript support

Plug 'leafgarland/typescript-vim' " TypeScript syntax

Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

Plug 'jparise/vim-graphql'        " GraphQL syntax

Plug 'Shougo/vinarise.vim'

Plug 'https://github.com/ctrlpvim/ctrlp.vim'

"Plug 'https://github.com/sheerun/vim-polyglot'

" Plug 'https://github.com/mxw/vim-jsx'

" Plug 'https://github.com/vim-vdebug/vdebug'


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


"%%%%%%%%%%%%%%%%%%%%%%%%% AUTOCOMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" autocmd FileType javascript,javascript.jsx setlocal tabstop=2
" autocmd FileType json setlocal tabstop=2
" autocmd FileType phtml setlocal tabstop=2
" autocmd FileType html setlocal tabstop=2
" autocmd FileType css,scss setlocal tabstop=2
" autocmd FileType vim setlocal tabstop=2
" " autocmd BufWritePre *.js Neoformat
" autocmd BufWritePre,TextChanged,InsertLeave *.js Neoformat

runtime macros/matchit.vim

colorscheme nord

"#%%%%%%%%%%%%%%%%%%%%% FIXES ?? %%%%%%%%%%%%%%%%%%
"#set statusline+=%{gutentags#statusline()}
"#let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]
"#%%%%%%%%%%%%%%%%%%%%% FIXES ?? %%%%%%%%%%%%%%%%%%
