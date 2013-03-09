" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
finish
endif

set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup   " do not keep a backup file, use versions instead
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Only do this part when compiled with support for autocommands.
if has("autocmd")
filetype plugin indent on
augroup vimrcEx
au!
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
else
set autoindent   " always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
\ | wincmd p | diffthis
\ | wincmd p | diffthis

set guioptions-=T

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"设置字体
set guifont=Monaco\ :h12

"显示行号
set nu

"打开语法高亮
syntax on

set softtabstop=4
"Windows
set shiftwidth=4 "缩进的空格数
set tabstop=4	"制表符的宽度
"Linux/Unix
"set shiftwidth=4
"set tabstop=8

"自动缩进设置
set cindent "C预言缩进方式
set smartindent
set incsearch
set autoindent "自动缩进

"Show matching bracets
set showmatch

"Set to auto read when a file is changed from the outside
set autoread

"设置配色方案为torte
colo torte

"设置支持的文件编码类项，目前设置为utf-8和gbk两种类型
set fileencodings=utf-8,chinese

"设置搜索结果高亮显示
set hlsearch

"设置记录的历史操作列表
set history=50

"设置折叠
"set foldcolumn=2
"set foldmethod=indent
"set foldlevel=3

"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"绑定自动补全的快捷键<C-X><C-O>到<leader>;
imap <leader>; <C-X><C-O>
"设置tab操作的快捷键，绑定:tabnew到<leader>t，绑定:tabn, :tabp到<leader>n,
"<leader>p
map <leader>t :tabnew<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>

"使用<leader>e打开当前文件同目录中的文件
if has("unix")
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
endif
