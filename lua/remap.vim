" ESC to normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" Firefox open msdn
nmap <F1> :silent !firefox.exe "https://www.google.com/search?q=<cword>&btnI"<CR>

" Open output in buffer
nnoremap <silent><leader>r :lua Scratch()<CR>

" Build the mapping is in toggle_term.lua
" nnoremap <silent><C-F5> :lua MakeCommand()<CR>
nnoremap <silent><leader>cm :lua show_file_lines(vim.g.makeFile)<CR>
nnoremap <silent><leader>cc :lua show_file_lines(vim.g.cmdFile)<CR>
nnoremap <silent><C-/> :lua SendCommandToggleTerm()<CR>

" Telescope
" nnoremap <silent><leader>te :Telescope<CR>
nnoremap <silent><leader>f :Telescope find_files<CR>
nnoremap <silent><leader>b :Telescope buffers<CR>
" nnoremap <silent><leader>gl :Telescope live_grep<CR>
nnoremap <silent><leader>gl :lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>
nnoremap <silent><leader>gs :Telescope grep_string<CR>
nnoremap <silent><leader>gt :Telescope tags<CR>
nnoremap <silent><leader>kk :Telescope jumplist<CR>

"Terminal
nnoremap <silent><leader>t <cmd>lua _Wincmd1x_toggle()<CR>
" nnoremap <silent><leader>ti <cmd>lua _Wincmd2x_toggle()<CR>

nnoremap <silent><ESC> :noh<CR>

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

" Cd in current buffer directory
nnoremap <silent><leader>kc :lua Mycd("cd")<CR>
nnoremap <silent><leader>kt :lua Mycd("tcd")<CR>
nnoremap <silent><leader>kl :lua Mycd("lcd")<CR>

" Resize
nnoremap <C-S-Up> :resize +1<CR>
nnoremap <C-S-Down> :resize -1<CR>
nnoremap <C-S-Right> :vertical resize +1<CR>
nnoremap <C-S-Left> :vertical resize -1<CR>

" Split windows
nnoremap <silent><leader>vs :vs<CR>
nnoremap <silent><leader>vh :sp<CR>

" Center screen and set jump after scroll
nnoremap <C-d> m'<C-d>zz
nnoremap <C-u> m'<C-u>zz
vnoremap <C-d> m'<C-d>zz
vnoremap <C-u> m'<C-u>zz
" nnoremap { {zz
" nnoremap } }zz

" Navigate / Delete buffer
nnoremap <silent><leader>o :bn<bar>bd #<CR>
nnoremap <silent>]b :bn<CR>
nnoremap <silent>[b :bp<CR>

" Next/Previous qflist
nnoremap <silent>]q :cnext<CR>
nnoremap <silent>[q :cprevious<CR>
nnoremap <silent><leader>co :Copen<CR>

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
