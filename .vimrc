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

set shell=zsh


" AUTOCOMMANDS"
"augroup MyYCMCustom
"  autocmd!
"  autocmd FileType c,cpp let b:ycm_hover = {
"    \ 'command': 'GetHover',
"    \ 'syntax': &filetype
"    \ }
"augroupEND


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
"	 \ endif


" SHORTCUTS "
let mapleader = " "
nnoremap <Space> <Nop>

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <C-p> :YcmCompleter GoTo<CR>
nnoremap <C-u> :YcmCompleter GoToAlternateFile<CR>
nnoremap <C-i> :tabn<CR>
nnoremap <Leader>t :below terminal ++rows=7<CR>
nnoremap <Leader>b <Esc>:call ToggleBraceComplete()<CR>i

nnoremap <Leader>c :set cursorline!<CR>
nmap <Leader>e <C-e>ee
nmap <Leader>w <C-w>
nmap <Leader>d <plug>(YCMHover)

inoremap fj <Esc>l
inoremap jf <Esc>l
inoremap { {<CR><BS>}<Esc>ko
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ] []
inoremap ) ()

let s:complete_enabled = 1
function! ToggleBraceComplete()
	if s:complete_enabled
		iunmap {
		iunmap (
   		iunmap [
		iunmap ]
		iunmap )
		let s:complete_enabled = 0
	else
		inoremap { {<CR><BS>}<Esc>ko
		inoremap ( ()<Esc>i
   		inoremap [ []<Esc>i
		inoremap ] []
		inoremap ) ()
		let s:complete_enabled = 1
	endif
endfunction


" PLUGINS "
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'romainl/vim-cool'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'simeji/winresizer'
Plug 'drzel/vim-scrolloff-fraction'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'

call plug#end()
call prop_type_add( 'YCM_HL_parameter', { 'highlight': 'Special'})
call prop_type_add( 'YCM_HL_variable', { 'highlight': 'Comment'})
call prop_type_add( 'YCM_HL_field', { 'highlight': 'Comment'})
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_enable_semantic_highlighting=1
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
