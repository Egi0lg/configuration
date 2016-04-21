"set autoindent      "自动缩排
set showmode         "左下角那一行的状态
"set bg=dark         "显示不同的底色色调
"syntax on            "进行语法校验，颜色显示
set paste            "设备粘贴模式

set listchars=tab:>-,trail:- "显示tab键
set list
syntax enable                "语法校验
set nu
"set t_Co=256
"set background=dark         "背景:黑色
"文件类型
filetype on 

"vim使用自动对起，也就是把当前行的对起格式应用到下一行；
set autoindent

"依据上面的对起格式，智能的选择对起方式，对于类似C语言编写上很有用
set smartindent

"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"在编辑过程中，在右下角显示光标位置的状态行
set ruler
autocmd InsertEnter * se cul
"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示
set nohls

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词时，别忘记回车
set incsearch

set so=7
" 列
" set cursorcolumn
" 行控制
set nocompatible
set textwidth=80
set wrap
"命令行与状态行
set ch=2
set ls=2
set wildmenu
"搜索选择
set hlsearch  " Highlight search things
set magic     " Set magic on, for regular expressions
set showmatch " Show matching bracets when text indicator is over them
set mat=2     " How many tenths of a second to blink
set incsearch " 即时搜索
"制表符
set expandtab
set smarttab
set softtabstop=4

"状态栏显示目前所执行的指令
set showcmd
" 自动重新读入
set autoread
" 插入模式下使用 <BS>、<Del> <C-W> <C-U>
set backspace=indent,eol,start
" 设定在任何模式下鼠标都可用
"set mouse=a
" 自动改变当前目录
set autochdir
" 共享外部剪贴板
set clipboard+=unnamed
" 定义 <Leader> 为逗号
let mapleader = ","
let maplocalleader = ","
"设置快速编辑.vimrc文件 ,e 编辑.vimrc
" 快速修改 vimrc 文件
if has("win32")
    map <silent> <leader>e :e $VIM/_vimrc<cr>
else
    map <silent> <leader>e :e $VIM/.vimrc<cr>
endif
"保存.vimrc文件后会自动调用新的.vimrc
autocmd! bufwritepost _vimrc source $VIM/_vimrc

"F2 删除尾部空格
nnoremap <F2> :%s/ $//g<CR>

" Python 文件的一般设置，比如不要 tab 等  
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab  
"自动补全配置  
autocmd FileType python set omnifunc=pythoncomplete#Complete

""================================================================== 
"新建.sh文件，自动插入文件头
autocmd BufNewFile *.sh exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash")
        call append(line("."), "") 
        call append(line(".")+1, "\#Author: Egi0lg") 
        call append(line(".")+2, "\#mail: @gmail.com") 
        call append(line(".")+3, "\#Created Time: ".strftime("%c")) 
        call append(line(".")+4, "") 
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F1> :g/^\s*$/d<CR> 
"F2 打开或关闭行号,便于复制
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>  
"列出当前目录文件  
"map <F3> :tabnew .<CR>  

" 快速移动文本
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"http://blog.csdn.net/wklken/article/details/8044678

" tagbar
nmap <F3> :TagbarToggle<CR>
let g:SuperTabDefaultCompletionType="context"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
