let s:check_build_path = g:myvimrc . '/lua/functions.vim'
let s:undodir_path = g:myvimrc . 'undofile'
execute "source " . s:check_build_path
execute "set undodir=" . s:undodir_path

filetype on
filetype plugin on
filetype indent on
syntax enable

set cmdheight=1
set pumheight=5
set laststatus=2
set signcolumn=no
" set shortmess-=F

set nu
set rnu
set spr
set more
set nuw=1
set ffs=unix,dos
set ruler
set title
set hidden
set nowrap
set mouse=a
set undofile
set hlsearch
" set tabstop=8
set expandtab
set incsearch
set autoindent
set scrolloff=4
set nocursorline
set shiftwidth=8
set termguicolors
set softtabstop=0
set ssop+=options
set noequalalways
set foldlevel=1100
set updatetime=500
set colorcolumn=""
set fillchars=fold:\ 
set undolevels=10000
set foldmethod=indent
set wildoptions=tagfile
set clipboard=unnamedplus
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

"set complete+=i,d
set complete-=t
set formatoptions+=p
set completeopt=menuone,preview,popup

autocmd CompleteDone * pclose
autocmd FileType *c* set nolist
autocmd FileType *c* set cino+=t0
autocmd FileType *c* set listchars=tab:<->,trail:-,space:\\u00b7
autocmd FileType *c* set shiftwidth=2
autocmd FileType *c* set formatoptions-=o
autocmd FileType *lua set formatoptions-=o

" autocmd InsertLeave * set relativenumber
" autocmd InsertEnter * set norelativenumber

let &shada  ="!,'100,<50,s10,h,rA:,rB:"

let &guicursor	='n-sm:block,'
let &guicursor	.='i-c-ci-v-ve:ver15,'
let &guicursor	.='r-cr-o:hor10,'
let &guicursor	.='a:blinkwait400-blinkoff500-blinkon500-Cursor/lCursor'

" Os specific stuff
if has ('win32')
        " let &tags .=',' . $VULKAN_SDK . '\vulkan_tags'
        for f in glob('C:\vc_env\useful_tags\*tags', 1, 1)
                let &tags .= ','.f
        endfor
        set grepprg=C:\Users\chiha\Desktop\git\ripgrep\target\debug\rg.exe\ --vimgrep\ -uu

        " let &path=$INCLUDE
        let $VC='C:\vc_env\msvc\'
        let $WINKITS='Windows\ Kits\10\Include\' . $SDK_VERSION
        let s:vulkan_sdk = 'C:\vulkan'

        let &path   .='.,;,'
        let &path   .=',C:/Lib/Everything/include'
        let &path   .=',' . $MSVC_ROOT . '\include'
        let &path   .=',' . $VC . $WINKITS . '\um'
        let &path   .=',' . $VC . $WINKITS . '\shared'
        let &path   .=',' . $VC . $WINKITS . '\ucrt'
        let &path   .=',' . $VC . $WINKITS . '\winrt'
        let &path   .=',' . $VC . $WINKITS . '\cppwinrt'
        let &path   .=',' . s:vulkan_sdk . '\include'
        let &path   .=',' . s:vulkan_sdk . '\include\vulkan'

        set path+=C:\clang\lib\clang\19\include
        set path+=C:\include

        let &shell ="cmd.exe"

        let s:vulkan = 'C:/vulkan/include'
        let s:vc='C:/vc_env/msvc/'
        let s:msvc_root = s:vc . 'VC/Tools/MSVC/' . $MSVC_VERSION
        let s:winkits = 'Windows\ Kits/10/Include/' . $SDK_VERSION
        let s:msvcRoot_include = s:msvc_root . '/include/*'
        let s:vc_winkits_um = s:vc . s:winkits . '/um/*'
        let s:vc_winkits_shared = s:vc . s:winkits . '/shared/*'
        let s:vc_winkits_ucrt = s:vc . s:winkits . '/ucrt/*'
        let s:vc_winkits_winrt = s:vc . s:winkits . '/winrt/*'
        let s:vc_winkits_cppwinrt = s:vc . s:winkits . '/cppwinrt/*' 
        let s:clang_19_include = 'C:/clang/lib/clang/19/include/*'

        execute 'autocmd BufEnter ' . 'C:/Lib/Everything/include' . ' set readonly'
        execute 'autocmd BufEnter ' . s:msvcRoot_include . ' set readonly'
        execute 'autocmd BufEnter ' . s:vc_winkits_um . ' set readonly'
        execute 'autocmd BufEnter ' . s:vc_winkits_shared . ' set readonly'
        execute 'autocmd BufEnter ' . s:vc_winkits_ucrt . ' set readonly'
        execute 'autocmd BufEnter ' . s:vc_winkits_winrt . ' set readonly'
        execute 'autocmd BufEnter ' . s:vc_winkits_cppwinrt . ' set readonly'
        execute 'autocmd BufEnter ' . s:clang_19_include . ' set readonly'
        execute 'autocmd BufEnter ' . s:vulkan . '/*' . 'set readonly'
        execute 'autocmd BufEnter ' . s:vulkan . '/vulkan/*' . ' set readonly'
        execute 'autocmd BufEnter ' . 'C:\include\*' . ' set readonly'

endif

if &shell == "pwsh.exe"
        let &shellpipe	="2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
        let &shellredir	="-RedirectStandardOutput %s -NoNewWindow -Wait"
        let &shellquote	=""
        let &shellxquote    =""

        let &shellcmdflag   ="-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
        let &shellcmdflag   .="[Console]::InputEncoding=[Console]"
        let &shellcmdflag   .="::OutputEncoding=[System.Text.Encoding]::UTF8;"
endif
