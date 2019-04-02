""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       基本设置                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置Shell
set shell=/bin/bash
set nocompatible

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

"键相关
set backspace=2 "使退格键正常处理缩进等
set whichwrap+=<,>,h,l "允许退格键和光标跨行
set ttimeout
if $TMUX != ''
    set ttimeoutlen=30
else
    set ttimeoutlen=80
endif

"显示相关
syntax enable "语法高亮
set t_Co=256 "设置256色显示
set t_ZH=[3m  "斜体字
set t_ZR=[23m "斜体字
set termguicolors  "开启真彩色
set background=dark "Light/Dark
set cursorline "高亮光标所在行
set shortmess=atI "不显示援助乌干达儿童的慈善提示
set guioptions= "去掉菜单和工具栏
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

"GUI 字体
if has('gui_running')
    set guifont=Fira\ Code
end

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

"粘贴模式
set pastetoggle=<F2>
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

"CUDA
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     插件无关键盘命令                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"配置<leader>
let mapleader = ' '
"搜索完成后结束高亮
noremap <silent> <leader>h :nohl<CR>
"保存文件
noremap <silent> <leader>s <Esc>:w<CR>
"关闭
noremap <silent> <C-x> <Esc>:qa<CR>
"横分屏
noremap <silent> <leader>D :sp<CR><C-W>w
"竖分屏
noremap <silent> <leader>d :vsp<CR><C-W>w
"切换窗口
nmap <M-h> <C-W>h
nmap <M-k> <C-W>k
nmap <M-j> <C-W>j
nmap <M-l> <C-W>l
"Shift+Tab缩进
"map <S-Tab> <<
"复制到剪贴板
vmap <C-c> "+y


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       插件配置                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"开始插件配置并设置安装路径
call plug#begin('~/.vim/bundle')

""""""""""""""""""""""""LocalVimrc""""""""""""""""""""""""""
Plug 'embear/vim-localvimrc'

"不必每次都询问是否载入
let g:localvimrc_ask = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""ColorSchemes"""""""""""""""""""""""""
Plug 'hzchirs/vim-material'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""VimCommentary""""""""""""""""""""""""
Plug 'tpope/vim-commentary'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""GitGutter""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""LeaderF"""""""""""""""""""""""""""
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

"Powerline Font
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
"快捷键
let g:Lf_ShortcutF = "<M-f>"
let g:Lf_ShortcutB = "<M-b>"
map <M-t> :LeaderfBufTag<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""VimEasyMotion"""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'

"官方给出的极简配置，后期可以自己调整
map <Leader> <Plug>(easymotion-prefix)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>s <Plug>(easymotion-overwin-f2)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""VimEasyAlign""""""""""""""""""""""""
Plug 'junegunn/vim-easy-align'

"在Visual Mode中开启交互式EasyAlign（如vipga）
xmap ga <Plug>(EasyAlign)
"对一个移动/文本对象开启交互式EasyAlign（如gaip）
nmap ga <Plug>(EasyAlign)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""MiniMap"""""""""""""""""""""""""""
Plug 'severin-lemaignan/vim-minimap'

let g:minimap_toggle='<C-n>'
let g:minimap_update='<nop>'
let g:minimap_open='<nop>'
let g:minimap_close='<nop>'

let g:minimap_highlight='Conceal'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""NERDTree""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTree', 'NERDTreeToggle' ] }

"<F3>打开NERDTree
map <F3> :NERDTreeToggle<CR>
"只剩NERDTree时自动关闭之
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""Airline"""""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme = 'material'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""CppEnhancedHighlight"""""""""""""""""""""
Plug 'octol/vim-cpp-enhanced-highlight'

"开启一些highlight配置
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_higlight = 1
let g:cpp_member_variable_highlight = 1
"let g:cpp_no_function_highlight = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""AutoPairs""""""""""""""""""""""""""
Plug 'jiangmiao/auto-pairs'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""AutoFormat"""""""""""""""""""""""""
Plug 'Chiel92/vim-autoformat'

noremap <F4> :Autoformat<CR>
"关闭Vim的Fallback
let g:autoformat_autoindent = 0
"CUDA format
let g:formatters_cuda = ['clangformat']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""gen_tags"""""""""""""""""""""""""""
Plug 'jsfaint/gen_tags.vim'

"ctags的参数
let g:gen_tags#ctags_opts = '--c++-kinds=+p --fields=+iaS --extra=+q'
"禁用gtags
let g:loaded_gentags#gtags = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""ALE""""""""""""""""""""""""""""""
Plug 'w0rp/ale'

"ALE配置
let g:ale_open_list = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
"快捷键
"nmap <silent> ˚ <Plug>(ale_previous_wrap)
"nmap <silent> ∆ <Plug>(ale_next_wrap)
"C/C++配置
let g:ale_linters = {
        \ 'cpp': ['clang'],
        \ 'python': ['flake8']
        \ }

let s:ale_cpp_options = '-Wall -O2 -std=c++14
        \ -I/usr/local/cuda/include'
let g:ale_cpp_clang_options = s:ale_cpp_options
let g:ale_cpp_gcc_options = s:ale_cpp_options
let g:ale_cuda_nvcc_options = '-x=cu -std=c++14'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""YouCompleteMe"""""""""""""""""""""""""
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

"快捷键 - 跳转至定义
autocmd filetype python,c,cpp,cuda,vim nnoremap <Leader>gd
        \ :YcmCompleter GoToDefinitionElseDeclaration<CR>
"关闭每次导入配置的提示
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf_global.py'
"配置YouCompleteMe的提示
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion = '<C-z>'
let g:ycm_python_binary_path = $HOME.'/.pyenv/shims/python'
let g:ycm_semantic_triggers =  {
        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
        \ 'cs,lua,javascript': ['re!\w{2}'],
        \ }
set completeopt=menu,menuone
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""AsyncRun""""""""""""""""""""""""""""
Plug 'skywind3000/asyncrun.vim'

"自动打开Quickfix窗口，高度为6
let g:asyncrun_open = 6
"任务结束时响铃提示
let g:asyncrun_bell = 1
"设置打开/关闭Quickfix窗口的快捷键
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"定义根目录标志，一般就是版本控制系统的目录
let g:asyncrcun_rootmarks = ['.svn', '.git', '.root', 'build.xml']
"TODO 设置编译快捷键
"nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()
"结束插件配置
"
"设置颜色方案
colorscheme vim-material
