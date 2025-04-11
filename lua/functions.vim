function! Check_build_file()
    let file_list = glob("*.bat", 0, 1)
    if !empty(file_list)
      let file = file_list[0]
      if !empty(file)
        compiler! msvc
        let &makeprg=file
      endif
    endif
endfunction

autocmd DirChanged * call Check_build_file()

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
