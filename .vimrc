set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

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


" AUTOCOMMANDS"
augroup MyYCMCustom
  autocmd!
  autocmd FileType c,cpp let b:ycm_hover = {
    \ 'command': 'GetHover',
    \ 'syntax': &filetype
    \ }
augroup END


" CONDITIONAL RELATIVE LINE NUMBER "
set nu
hi LineNr ctermfg=30

function! RnuOn()
	set rnu
	hi LineNr ctermfg=30
endfunction
function! RnuOff()
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


" Return to last edit position when opening files (You want this!) "
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
	 \ endif


" SHORTCUTS "
let mapleader = " "
nnoremap <Space> <Nop>

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>t :NERDTreeFocus<CR>
nnoremap <C-p> :YcmCompleter GoTo<CR>
nnoremap <C-u> :YcmCompleter GoToAlternateFile<CR>
nnoremap <C-i> :tabn<CR>

nnoremap <Leader>c :set cursorline!<CR>
nmap <Leader>e <C-e>
nmap <leader>d <plug>(YCMHover)

inoremap fj <Esc>l
inoremap jf <Esc>l


" PLUGINS "
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'romainl/vim-cool'
Plug 'ycm-core/YouCompleteMe.git'
Plug 'tpope/vim-fugitive'
Plug 'simeji/winresizer'
Plug 'drzel/vim-scrolloff-fraction'
Plug 'vimwiki/vimwiki'

call plug#end()
let g:ycm_autoclose_preview_window_after_completion = 1
let g:scrolloff_fraction = 0.30
let g:vimwiki_list = [{'path': '~/.vim/wiki'}]
highlight vimwikiHeader1 ctermfg=1
highlight vimwikiHeader2 ctermfg=2
highlight vimwikiHeader3 ctermfg=3


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
