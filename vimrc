

" ----------------------------------------ui-----------------------------------------" syntax on " color scheme
" color solarized

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkred guifg=white
" search
set hlsearch
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

" ----------------------------------------ui-----------------------------------------"



" ------------------------------------editor-----------------------------------------"
set cc=88
set history=10000
set ruler
set nocompatible
set nofoldenable                    " disable folding"
set confirm                         " prompt when existing from an unsaved file
set backspace=indent,eol,start      " More powerful backspacing
set t_Co=256                        " Explicitly tell vim that the terminal has 256 colors "
" set mouse=a                         " use mouse in all modes
set report=0                        " always report number of lines changed                "
set nowrap                          " dont wrap lines
set scrolloff=5                     " 5 lines above/below cursor when scrolling
set number                          " show line numbers
set showmatch                       " show matching bracket (briefly jump)
set showcmd                         " show typed command in status bar
set title                           " show file in titlebar
set laststatus=2                    " use 2 lines for the status bar
set matchtime=2                     " show matching bracket for 0.2 seconds
set matchpairs+=<:>                 " specially for html
" set relativenumber
set hidden


set shell=/bin/sh
" ------------------------------------editor-----------------------------------------"


" ------------------------------------code-----------------------------------------"
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
" ------------------------------------code-----------------------------------------"

" ------------------------------------indent-----------------------------------------"
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
set textwidth=79
set smarttab
set ts=4
"set expandtab       " expand tab to space


" nmap <F3> :GundoToggle<CR>
map <F2> :vertical resize +5 <CR>
map <F3> :vertical resize -5 <CR>
map <F4> :resize -5 <CR>
map <F5> :resize +5 <CR>
map <F6> :Vexplore <CR>
" paste plain test 
set pastetoggle=<F7>
"nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
nnoremap <leader>a :Ack
nnoremap <leader>v V`]
"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>


" C-* 在可是模式下查找当前选中的文本, e而不是光标所在位置的单词. pratical vim Page203
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '//n', 'g')
	let @s = temp
endfunction
" -----------------------------------plugins-----------------------------------------"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" 括号补全
Plug 'Raimondi/delimitMate'


" coc.nvim
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}


" ui
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" tag
Plug 'majutsushi/tagbar'

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'tomlion/vim-solidity'

" Initialize plugin system
call plug#end()

" -----------------------------------plugins-----------------------------------------"
"
"
"
"
"
" Nerd Tree
"autocmd vimenter * NERDTree 
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "left"
let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0           " 不显示隐藏文件
let NERDTreeMinimalUI = 1
nmap <F6> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif



" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_ctags_bin='/usr/bin/ctags'
nmap <F8> :TagbarToggle<cr>

