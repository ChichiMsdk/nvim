let s:check_build_path = g:myvimrc . '/lua/check_build.vim'
execute "source " . s:check_build_path
" source C:\Users\chiha\Appdata\Local\nvim\lua\check_build.vim
filetype plugin on

set cmdheight=1
set pumheight=5
set laststatus=2
set signcolumn=no

set nu
set rnu
set spr
set more
set nuw=1
set ruler
set title
set hidden
set nowrap
set cindent
set mouse=a
set undofile
set hlsearch
set tabstop=8
set incsearch
set autoindent
set scrolloff=4
set nocursorline
set shiftwidth=4
set termguicolors
set softtabstop=4
set ssop+=options
set noequalalways
set foldlevel=1100
set updatetime=500
set colorcolumn=""
set fillchars=fold:\ 
set undolevels=10000
set foldmethod=marker
set wildoptions=tagfile
set clipboard=unnamedplus
set undodir=/mnt/a/nvim/undodir
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

"set complete+=i,d
set complete-=t
set formatoptions+=p
set completeopt=menuone,preview,popup

autocmd CompleteDone * pclose
autocmd FileType *c* set formatoptions-=o
autocmd FileType *lua set formatoptions-=o

autocmd InsertLeave * :lua nbrLeave()
autocmd InsertEnter * :lua nbrEnter()

let &shada  ="!,'100,<50,s10,h,rA:,rB:"

let &guicursor	='n-sm:block,'
let &guicursor	.='i-c-ci-v-ve:ver15,'
let &guicursor	.='r-cr-o:hor10,'
let &guicursor	.='a:blinkwait400-blinkoff500-blinkon500-Cursor/lCursor'

let &tags .=',' . $VULKAN_SDK . '\vulkan_tags'
let &tags .=',C:\vc_env\um_tags'
let &tags .=',C:\vc_env\ucrt_tags'

set grepprg=C:\Users\chiha\Desktop\git\ripgrep\target\debug\rg.exe\ --vimgrep\ -uu

" let &path=$INCLUDE
let $VC='C:\vc_env\msvc\'
let $WINKITS='Windows\ Kits\10\Include\' . $SDK_VERSION

let &path   .='.,;,'
let &path   .=',C:/Lib/Everything/include'
let &path   .=',' . $MSVC_ROOT . '\include'
let &path   .=',' . $VC . $WINKITS . '\um'
let &path   .=',' . $VC . $WINKITS . '\shared'
let &path   .=',' . $VC . $WINKITS . '\ucrt'
let &path   .=',' . $VC . $WINKITS . '\winrt'
let &path   .=',' . $VC . $WINKITS . '\cppwinrt'

set path+=C:\clang\lib\clang\19\include
set path+=C:\include

let &shell ="cmd.exe"
if &shell == "pwsh.exe"
    let &shellpipe	="2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    let &shellredir	="-RedirectStandardOutput %s -NoNewWindow -Wait"
    let &shellquote	=""
    let &shellxquote    =""

    let &shellcmdflag   ="-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
    let &shellcmdflag   .="[Console]::InputEncoding=[Console]"
    let &shellcmdflag   .="::OutputEncoding=[System.Text.Encoding]::UTF8;"
endif
