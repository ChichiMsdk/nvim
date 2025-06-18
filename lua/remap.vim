let mapleader = " "

" Terminal
nnoremap <silent><leader>t <cmd>lua _Wincmd1x_toggle()<CR>
" nnoremap <silent><leader>ti <cmd>lua _Wincmd2x_toggle()<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <silent><ESC> :noh<CR>

" Firefox open msdn
nmap <F1> :silent !firefox.exe "https://www.google.com/search?q=<cword>&btnI"<CR>

" Functions in base\commander\main.lua
" nnoremap <silent><leader>cm :lua show_file_lines(vim.g.makeFile)<CR>
" nnoremap <silent><leader>cc :lua show_file_lines(vim.g.cmdFile)<CR>

" Functions in base\remap.lua
nnoremap <silent><C-/> :lua SendCommandToggleTerm()<CR>

" Undotree
nnoremap <silent><leader>0 :UndotreeToggle<CR>:UndotreeFocus<CR>

" Telescope
nnoremap <silent><C-f> :Telescope find_files<CR>
nnoremap <silent><C-b> :Telescope buffers<CR>
nnoremap <silent><leader>l :lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>
command! -nargs=0 TS silent :Telescope grep_string
command! -nargs=0 TT silent :Telescope tags
command! -nargs=0 TJ silent :Telescope jumplist

" Oil / FileExplorer
nnoremap <silent><leader>vo :Oil<CR>
nnoremap <silent><leader>vv :Oil --float <CR>
nnoremap <silent><leader>vc :Oil . --float <CR>

" Comment line
nnoremap <silent><leader>/ :TComment<CR>
vnoremap <silent><leader>/ :TCommentBlock<CR>

" Registers
nnoremap <silent><leader>cl :Telescope registers<CR>
" nnoremap <silent><leader>z :<C-u>registers<CR>:normal! "p<Left>

"paste
nnoremap <silent><C-v> "+p
vnoremap <silent><C-v> "+p
cnoremap <C-v> <C-r>+
" cnoremap <silent><C-v> <C-v>
inoremap <silent><C-v> <C-r>+

"copy to os
nnoremap <silent><C-c> "+yy
vnoremap <silent><C-c> "+y
" nnoremap <silent>yy "+yy
" vnoremap <silent>y "+y

" Delete to blackhole buffer
nnoremap <S-del> "_dd
vnoremap <S-del> "_d

" Move between windows
nnoremap <silent><C-k> :wincmd k<CR>
nnoremap <silent><C-j> :wincmd j<CR>
nnoremap <silent><C-h> :wincmd h<CR>
nnoremap <silent><C-l> :wincmd l<CR>

" Resize
nnoremap <C-S-Up> :resize +1<CR>
nnoremap <C-S-Down> :resize -1<CR>
nnoremap <C-S-Right> :vertical resize +1<CR>
nnoremap <C-S-Left> :vertical resize -1<CR>
nnoremap <leader>= :vertical resize +25<CR>

" Split windows
nnoremap <silent><leader>vs :vs<CR>
nnoremap <silent><leader>vh :sp<CR>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-u> <C-u>zz

" Navigate / Delete buffer
nnoremap <silent>]b :bn<CR>
nnoremap <silent>[b :bp<CR>

" Next/Previous qflist
nnoremap <silent>]f :cnext<CR>
nnoremap <silent>[f :cprevious<CR>
nnoremap <silent>]c :Copen<CR>
nnoremap <silent>[c :cw<CR>

" Navigate tab
nnoremap gy gt
nnoremap gY gT

" Save / Quit
nnoremap <silent><leader>w :w<CR>
nnoremap <silent><leader>a :q<CR>

" Completion convenience
inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
" inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>
