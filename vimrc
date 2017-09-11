
set nocompatible     " 关闭 vi 兼容模式        
set backspace=indent,eol,start

" 状态栏信息
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r\%<[POS=%l,%v][%p%%]\%-16{strftime(\"%Y-%m-%d\ %H:%M\")}\%Y
" %F 缓冲区的文件完整路径
" %m 如果缓冲区已修改则表示为 [+]
" %r 如果缓冲区为只读则表示为 [RO]
" %< 状态栏过长时从那里换行，默认从行首
" %l 行号
" %v 列号
" %p 光标所在行的百分比
" %Y 缓冲区的文件类型

set laststatus=2         " 倒数第二行
highlight statusline ctermbg=black ctermfg=white


set fencs=utf-8,gb2312,gbk    
set number
set hlsearch
" 逐步搜索
set incsearch

" 语法高亮
syntax on

au BufNewFile,BufRead *
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |
\ set list listchars=tab:>-

" 选择显示第 80 列竖线的文件类型
au BufNewFile,BufRead *.c,*.py
\ set colorcolumn=80
" 标尺列背景色和文字颜色(这里也可以使用数字)
highlight ColorColumn ctermbg=green ctermfg=black
" 0     1   2   3   4   5   6   7   8   ...       
" 黑    红  绿  黄  蓝  粉  青  白  灰  ...

set splitbelow
" 水平分屏新窗口在下面
set splitright
" 竖直分屏新窗口在右面

" 忽略编译文件
set wildignore=*.o,*~,*.pyc

set term=xterm-256color
set background=light "浅色
"set background=dark "深色

set cursorline  " 光标横线
set cursorcolumn  " 光标竖线
highlight cursorcolumn ctermfg=6

"<cr> 相当于按回车键
map <F2> :vertical resize +5 <cr>
map <F3> :vertical resize -5 <cr>
map <F4> :resize +5 <cr>
map <F5> :resize -5 <cr>


set noignorecase "不忽略大小写的查找
"set ignorecase

" 搜索的单词太长，可以在普通模式下光标移动到单词上，然后按 * 或 # 即可进行全局搜索

" 保存并退出的快捷键 ZZ
" !ls 不用退出 vim 执行 shell 命令
" 3,5s/^/#/g 3-5 行行首加 # 号

au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2

普通模式：o 在光标所在行的下一行进入插入模式

cesh
