call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree'
    Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'trayo/vim-ginkgo-snippets'
    Plug 'trayo/vim-gomega-snippets'
    Plug 'junegunn/fzf.vim' 
    Plug 'w0rp/ale'
    Plug 'tpope/vim-commentary' 
    Plug 'vmchale/dhall-vim'
    Plug 'neoclide/coc.nvim', {'branch':'release' }
    Plug 'jremmen/vim-ripgrep'
    Plug 'kaicataldo/material.vim'
    Plug 'christoomey/vim-system-copy'

call plug#end()


"----- GENERAL -----

let mapleader=","
set mouse=a                                                         "Enable mouse
"set ttymouse=sgr                                                    "Make the mouse work even in columns beyond 223
set backspace=indent,eol,start                                      "Make backspace normal
set encoding=utf8                                                   "Encoding
set ffs=unix,dos                                                    "File formats that will be tried (in order) when vim reads and writes to a file
set relativenumber
set number

"replace esc with jk and ;;
ino jk <esc>
ino ;; <esc>

vno ;; <esc>

"ctrl+c copies to clipboard
map <C-q> "+y<CR>

"Write on enter
map <CR> :write<CR>

set fillchars=""
"hi VertSplit cterm=NONE guibg=NONE ctermfg=Green

hi EndOfBuffer ctermfg=black ctermbg=NONE


"----- NERDTREE -----

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"----- ULTISNIPS -----

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"----- Schlepp -----

" Movement
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

"----- Go Programming -----

map , :GoAlternate<CR>
map {{ :GoDecls<CR>
map }} :GoDeclsDir<CR>
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
let g:go_fmt_command = "goimports"
"----- colorscheme
if (has('termguicolors'))
  set termguicolors
endif

colorscheme material

" Movement in pop up menu
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"


" --------------------------------- FZF  -------------------------------

" Fuzzy find files
nnoremap <silent> <leader>f :Files<CR>

" Fuzzy find buffers
nnoremap <silent> <leader>b :Buffers<CR>

" Search for a string in all files
nnoremap <silent> <leader>s :execute 'Rg ' . input('Search for --> ')<CR>

" Search the word under the cursor
nnoremap <silent> <leader>c :execute 'Rg' expand('<cword>')<CR>

" Layout config
let g:fzf_layout = { 'down': '~30%' }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Show preview when searching files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Use Rg for searching for contents and show preview
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!vendor/" '.shellescape(<q-args>), 1,
  \    fzf#vim#with_preview({'down': '60%', 'options': '--bind alt-down:preview-down --bind alt-up:preview-up'},'right:50%', '?'),
  \   <bang>0)

" Extra key bindings
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

" hide the statusline of the containing buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" --------------------------------------------------------------------------

echom '(>^.^<)'
