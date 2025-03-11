function! Check_build_file()
    let file = (expand(glob("*.bat")))
    if !empty(file)
	compiler! msvc
	let &makeprg=file
    endif
endfunction

autocmd DirChanged * call Check_build_file()
