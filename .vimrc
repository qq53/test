set nocompatible
set fenc=utf-8
set fencs=usc-bom,utf-8,euc-jp,gb18030,gbk,gb2312,cp936,latin1
set encoding=utf-8
set history=100
set clipboard+=unnamed

filetype on
filetype plugin on
filetype plugin indent on
filetype indent on

set iskeyword+=_,$,@,%,#,-

highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
match OverLength '\%101v.*'

setlocal noswapfile
set bufhidden=hide

set linespace=0
set wildmenu

set backspace=2

set whichwrap+=<,>,h,l
set mouse=a
set selection=exclusive
set selectmode=mouse,key

set report=0

set fillchars=vert:\ ,stl:\ ,stlnc:\

set showmatch
set showcmd

set matchtime=5

set ignorecase

set nohlsearch

set incsearch

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

set scrolloff=3

set novisualbell

set laststatus=0

set formatoptions=tcrqn

set autoindent
      
" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent
 
" 制表符为4
set tabstop=4
 
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
 
" 不要用空格代替制表符
set noexpandtab
 
" 不要换行
set nowrap
 
" 在行和段开始处使用制表符
set smarttab

set number

set autoread
set autowriteall

syntax enable
syntax on

if version >= 603
	set helplang=cn
endif

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=0
let Tlist_Auto_Update=1

let g:winManagerWindowLayout='TagList|FileExplorer'
map wm :WMToggle<CR>

map <C-w> :wq<CR>
map <C-c> :q!<CR>
map <F4>  :call AddTitle()<cr>
map <F6>  :call SCAddTitle()<cr>
set pastetoggle=<F5>
map <C-F12> :!ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q *<CR>

set tags=tags;
set autochdir

"mnicppcomplete setting --
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1
let OmniCpp_DefaultNamespaces=["std"]

let complcache_enable_at_startup = 1

function AddTitle()
    call append(0,"/// \\file ".expand("%:t"))
    call append(1,"/*")
    call append(2,"  ------------------------------------")
    call append(3,"  Create date : ".strftime("%Y-%m-%d %H:%M"))
    call append(4,"  Modified date : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"  Author : Sen1993")
    call append(6,"  Email : 1730806439@qq.com")
    call append(7,"  ------------------------------------")
    call append(8,"*/")
    call append(9,"")
endf

function UpdateTitle()
    call setline(1,"/// \\file ".expand("%:t"))
	call setline(5,"  Modified date: ".strftime("%Y-%m-%d %H:%M"))
endf

au BufNewFile *.hpp,*.cpp,*.c,*.h exec ":call AddTitle()"
au InsertLeave *.cpp,*.hpp,*.h,*.c exec ":call UpdateTitle()"

function SCAddTitle()
	call append(0,"#  File : ".expand("%:t"))
    call append(1,"#  ------------------------------------")
    call append(2,"#  Create date : ".strftime("%Y-%m-%d %H:%M"))
    call append(3,"#  Modified date : ".strftime("%Y-%m-%d %H:%M"))
    call append(4,"#  Author : Sen1993")
    call append(5,"#  Email : 1730806439@qq.com")
    call append(6,"#  ------------------------------------")
    call append(7," ")
    call append(8,"#!/bin/bash")
    call append(9,"PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin")
    call append(10,"export PATH")
    call append(11,"")
endf

function SCUpdateTitle()
	call setline(1,"#  File : ".expand("%:t"))
	call setline(4,"#  Modified date: ".strftime("%Y-%m-%d %H:%M"))
endf

au BufNewFile *.sh exec ":call SCAddTitle()"
au InsertLeave *.sh exec ":call SCUpdateTitle()"
