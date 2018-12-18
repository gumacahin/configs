" Makes hitting Cmd-S Save the buffer and enter normal mode if it's in insert
" mode

" Disable MacVim save shortcut
macmenu File.Save key=<nop>
macmenu File.Save\ All key=<nop>
macmenu File.Save\ As\.\.\. key=<nop>
" Exit to Normal mode upon [Cmd+S]
inoremap <D-s> <Esc>:w<CR><Right>
vnoremap <D-s> <Esc>:w<CR>

" Save in Normal mode (block Substitute)
nnoremap <D-s> :w<CR>
