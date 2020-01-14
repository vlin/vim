set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"Plugin 'jQuery'
Plugin 'othree/html5.vim'
Plugin 'yggdroot/indentline'
Plugin 'posva/vim-vue'

call vundle#end()            " required
filetype plugin indent on    " required

" settings
syntax enable
syntax on

let mapleader=','
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
"colorscheme molokai

set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set cul

set mouse=a

set laststatus=2
set number
set relativenumber
set noshowmode
set scrolloff=3

set tabstop=2
set shiftwidth=2
set softtabstop=2

set expandtab
set smarttab
set autoindent
set smartindent
set ruler
set ignorecase
set hls
set foldmethod=syntax
set showcmd

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" backup
set nobackup
set nowb
set noswapfile

" search
set hlsearch
set incsearch

" backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set clipboard=unnamed

" javascript settings
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

au BufNewFile,BufRead *.html,*.js,*.vue set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue set fileformat=unix

" html5 settings
let g:html5_event_handler_attributes_complete = 0

" vue settings
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" nerdtree settings
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <silent> <F3> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let NERDTreeShowBookmarks=1
" let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
" let NERDTreeChDirMode=0
" let NERDTreeQuitOnOpen=1
" let NERDTreeMouseMode=2
" let NERDTreeShowHidden=1
" let NERDTreeKeepTreeInNewTab=1

" nerd git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ctags settings
let Tlist_Ctags_Cmd ='/usr/local/Cellar/ctags/5.8/bin/ctags'  "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个，Centos下配置注销这行即可。

" taglist settings
let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1 "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File = 1 "只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type ='name' "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1 "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32 "设置窗体宽度为32，可以根据自己喜好设置
map <silent> <F9> :TlistToggle <CR>

" emment settings
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:emmet_html5 = 0

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" let g:user_emmet_leader_key='<C-Z>'
 let g:user_emmet_expandabbr_key='<Tab>'

" neocompletecache settings
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()


inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
" set wildignore+=*/tmp/*,*/.git/*,*.so,*.swp,*.zip,*/node_modules/*    " Linux/MacOSX

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|log\|tmp$\|node_modules\|vendor',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call setline(1, "\#!/bin/bash")
  endif

  "如果文件类型为python
  if &filetype == 'python'
    call setline(1, "\#!/usr/bin/env python")
    call append(1, "\# encoding: utf-8")
  endif

  normal G
  normal o
  normal o
endfunc

" 保存python等多种类型文件时删除多余空格
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,html,css,json,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

