call plug#begin("~/.vim/plugins/plugin.vim")

Plug 'scrooloose/nerdtree'
Plug 'romainl/vim-cool'
Plug 'valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'simeji/winresizer'
Plug 'drzel/vim-scrolloff-fraction'

call plug#end()
let g:ycm_autoclose_preview_window_after_completion = 1
let g:scrolloff_fraction = 0.30
