call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree'
    Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'trayo/vim-ginkgo-snippets'
    Plug 'trayo/vim-gomega-snippets'
    Plug 'zirrostig/vim-schlepp'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim' 
    Plug 'w0rp/ale'
    Plug 'scrooloose/nerdcommenter'
    Plug 'vmchale/dhall-vim'
    Plug 'neoclide/coc.nvim', {'branch':'release' }

call plug#end()


"----- GENERAL -----

set mouse=a                                                         "Enable mouse
set ttymouse=sgr                                                    "Make the mouse work even in columns beyond 223
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
map <C-q> "*y<CR>

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
