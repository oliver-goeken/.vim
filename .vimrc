set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

set scrolloff=10

set shiftwidth=4

set tabstop=4

set linebreak

set wildmenu

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

" CONDITIONAL RELATIVE LINE NUMBER "
function RnuOn()
	set rnu
	hi LineNr ctermfg=30
endfunction
function RnuOff()
	set nornu
	hi LineNr ctermfg=179
endfunction

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | call RnuOn() | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | call RnuOff() | endif
augroup END

hi LineNrAbove ctermfg=179
hi LineNrBelow ctermfg=179


" SHORTCUTS "
let mapleader = " "
nnoremap <Space> <Nop>

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>t :NERDTreeFocus<CR>
nnoremap <C-p> :YcmCompleter GoTo<CR>
nnoremap <C-u> :YcmCompleter GoToAlternateFile<CR>


" PLUGINS "
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'romainl/vim-cool'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-fugitive'
Plug 'simeji/winresizer'

call plug#end()
let g:ycm_autoclose_preview_window_after_completion = 1


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
