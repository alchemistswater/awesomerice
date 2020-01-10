call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()
let g:airline_powerline_fonts = 1
colorscheme nord
