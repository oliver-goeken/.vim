set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

set number

set scrolloff=10

set shiftwidth=4

set tabstop=4

set expandtab

set linebreak

set incsearch

set hlsearch

set ignorecase

set smartcase

set showcmd

set showmode

set showmatch

set history=1000

set whichwrap+=<,>,[,]

set title


" SHORTCUTS "
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeFocus<CR>


" PLUGINS "
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'romainl/vim-cool'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'

call plug#end()


" STATUS LINE "
function! Current_git_branch()
    let l:branch = split(fugitive#statusline(),'[()]')
    if len(l:branch) > 1
        return join([" ", remove(l:branch, 1), ""])
    endif
    return ""
endfunction

set laststatus=2

set statusline=%#StatusLineTermNC#
set statusline+=%{Current_git_branch()}
set statusline+=%#Visual#
set statusline+=\ %f
set statusline+=\ %m

set statusline+=%=
set statusline+=%y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=[%{&fileformat}]\ 
set statusline+=%#PmenuSbar#
set statusline+=\ %p%%\ 
set statusline+=%#StatusLineNC#
set statusline+=\ %3l:%-2v\ 
set statusline+=%0*
