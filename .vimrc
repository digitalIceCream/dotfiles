set nocompatible              " be iMproved, required
filetype off                  " required

" highlight column after 'textwidth'
 set colorcolumn=120
" enable syntax highlighting
syntax on

" enable line numbers
set nu

" enable relative line numbers
set relativenumber

" disable line wrapping
set nowrap
" enable automatic indentation
"set cindent

"set makeprg=gcc\ %\ -o\ %<

"let g:ycm_clangd_binary_path = '/usr/lib64/clang'

"map <F2> : call CompileRunGcc() <CR>
"map <F2> : call CompileRunJava() <CR>

func! CompileRunGcc()
	exec "w"
	exec "!gcc % -o %<"
	exec "! ./%<"
endfunc

func! CompileRunJava()
	exec "w"
	exec "!javac %"
	exec "!java %<"
endfunc

set hidden

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"-----------------------------------------------------------------------------"
" let Vundle manage Vundle, required
" Plugin vundle
Plugin 'VundleVim/Vundle.vim'

" Plugin airline
Plugin 'vim-airline/vim-airline'

" Plugin nerdtree
Plugin 'preservim/nerdtree'

" Plugin 'YouCompleteMe'
Plugin 'ycm-core/YouCompleteMe'

" Plugin indentLine
"Plugin 'Yggdroot/indentLine'

" Keep Plugin commands between vundle#begin/end.
"-----------------------------------------------------------------------------"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
" ** Plugin configs for those managed by vundle.vim ** "
":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

"*****************************************************************************"
" Airline
" Disable section z (Because Konsole causes character-jumble)
"let g:airline_section_z = 0
"*****************************************************************************"
"
"*****************************************************************************"
" NERDTree
let g:NERDTreeWinSize=40
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"*****************************************************************************"

"*****************************************************************************"
" YouCompleteMe
" Necessary for YCM
set encoding=utf-8
"*****************************************************************************"
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
" ** The following are vundle-unrelated configs for vim ** "

" create and use template for 
" '*.c', '*.h', '*.py','*.sh', '*.java'
" files
"
if has ("autocmd")
	augroup templates
		autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
		autocmd BufNewFile *.h 0r ~/.vim/templates/skeleton.h
		autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
		autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
		autocmd BufNewFile *.java 0r ~/.vim/templates/skeleton.java
	augroup END
endif

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
