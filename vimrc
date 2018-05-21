""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       用户信息                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:username = 'Changxu' "你的名字
let g:email = 'changxu.mail@gmail.com' "你的邮箱
let g:homepage = 'http://changxu.wang' "你的主页


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       基本设置                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置Shell
set shell=/bin/bash

"TAB为4个空格
set shiftwidth=4
set tabstop=4
set softtabstop=4
"用空格代替TAB
set expandtab
set smarttab
"对HTML设置缩进为2个空格
autocmd FileType html set tabstop=2
autocmd FileType html set softtabstop=2

"自动缩进
set cindent "C风格缩进
set smartindent "智能缩进

"断行相关
set lbr "不要在单词中间断行
set fo+=mB "允许两个汉字间断行
set iskeyword+=_,$,@,%,#,- "不要分割带有如下符号的单词

"退格键相关
set backspace=2 "使退格键正常处理缩进等
set whichwrap+=<,>,h,l "允许退格键和光标跨行

"显示相关
syntax enable "语法高亮
set t_Co=256 "设置256色显示，更漂亮
set background=dark "dark
set cursorline "高亮光标所在行
set shortmess=atI "不显示援助乌干达儿童的慈善提示
set guioptions= "去掉菜单和工具栏
set guifont=Monaco\ for\ Powerline
set number "显示行号
set ruler "显示标尺
set showcmd "输入的命令显示出来
set showmatch "高亮显示匹配的括号
set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行距离
set laststatus=2 "启动显示状态行(1),总是显示状态行(2)  
set cmdheight=2 "命令行高度
set nocompatible "去掉对vi的兼容性
set fillchars=vert:\ ,stl:\ ,stlnc:\  "被分割的窗口间显示空格，便于阅读
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} "状态行显示的内容  

"中文编码
set encoding=utf-8 "UTF-8编码
set fileencodings=utf8,ucs-bom,gbk,gb2312,gb18030 "同时支持GBK和UTF-8
set fileencoding=utf8 "同时支持GBK和UTF-8

"中文显示
set langmenu=zh_CN.UTF-8 "菜单语言
set helplang=cn "设定帮助语言

"历史记录数
set history=1000

"搜索相关
set hlsearch "搜索高亮
set incsearch "增量搜索

"IO
set autoread "被改动时自动重载
set autowrite "自动保存
set confirm "弹出确认

"不要临时文件
set nobackup
set noswapfile

"共享剪贴板
set clipboard+=unnamed


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       文件相关                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建文件后自动定位到文件末尾
autocmd BufNewFile * normal G

"文件类型相关
filetype on "打开文件类型检测
filetype plugin on "打开文件类型相关插件
filetype indent on "打开文件类型相关缩进

"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"特殊文件类型
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd BufRead,BufNewFile *.{js} set filetype=javascript

"自动插入文件头
autocmd BufNewFile *.sh exec ":call SetTitle_Shell()"

function SetTitle_Shell()
    call append(0,"#!/usr/bin/env bash")
    call append(1, "")
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     插件无关键盘命令                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"配置<leader>
let mapleader = ','
"搜索完成后结束高亮
nmap <leader>h :nohl<CR>
"保存文件
nnoremap <leader>s <Esc>:w<CR>
"退出
nnoremap <leader>q <Esc>:qa<CR>
"横分屏
nnoremap <leader>D :sp<CR><C-W>w
"竖分屏
nnoremap <leader>d :vsp<CR><C-W>w
"切换窗口
nmap <leader>w <C-W>w
"全选
map <C-A> ggVG
"Shift+Tab缩进
map <S-Tab> <<
"自动格式化缩进
map <F12> gg=G 
"复制到剪贴板
vmap <C-c> "+y
"粘贴
imap <C-v> <Esc>"*pa
"比较文件
nnoremap <leader>df :vert diffsplit
"使用CTags生成tag
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       插件配置                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vundle配置
set nocompatible "关闭向vi的兼容，Vundle必须要！
filetype off "Vundle必须要！
set rtp+=~/.vim/bundle/Vundle.vim "设置运行时路径包含Vundle
    
"使用Vundle管理所有插件
call vundle#begin() "开始Vundle

"""""""""""""""""""""""""""Vundle"""""""""""""""""""""""""""
Plugin 'gmarik/Vundle.vim' "Vundle必须要！
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""Solarized""""""""""""""""""""""""""
"Plugin 'altercation/vim-colors-solarized'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""不需配置的插件"""""""""""""""""""""""
"Plugin 'L9' "L9
"Plugin 'FuzzyFinder' "FuzzyFinder
"Plugin 'jiangmiao/auto-pairs' "auto-pairs
Plugin 'tpope/vim-fugitive.git'
"Plugin 'tpope/vim-haml'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""NERDTree""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'

"<F3>打开NERDTree
map <leader>e :NERDTreeToggle<CR>

"没有打开文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif 
"只剩NERDTree时自动关闭之
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""Airline"""""""""""""""""""""""""""
Plugin 'bling/vim-airline'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""TagList""""""""""""""""""""""""""""
Plugin 'taglist.vim'

"<F2>打开/关闭TagList
map <F2> :Tlist<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""ctrlp"""""""""""""""""""""""""""""
Plugin 'kien/ctrlp.vim'

set runtimepath^=~/.vim/bundle/ctrlp.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""Emmet"""""""""""""""""""""""""""""
Plugin 'mattn/emmet-vim'

"换掉leader键
"let g:user_emmet_leader_key = '<leader>z'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""syntastic"""""""""""""""""""""""""
Plugin 'scrooloose/syntastic.git'

"自动更新location list
let g:syntastic_auto_loc_list = 1
"python检查
let g:syntastic_python_checkers = ['pylint']
"php补全
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call vundle#end()
filetype plugin indent on "Vundle要求 
"结束Vundle
