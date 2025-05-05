function! s:Select_tag()
  let s:word = expand("<cword>")
  if s:word == ''
    echomsg "No word under cursor"
    return
  endif
  echomsg s:word

  let tags = taglist('^'.s:word.'$')

  if empty(tags)
    echomsg "No tags found for: ".s:word
    return
  endif
  " try | silent exe 'tselect '.s:word | catch /.*/ | endtry
  exe 'tselect '.s:word
endfunction

function! s:Jump_to_tag()
  let s:current_word = expand("<cword>")
  " echomsg "Word: ".current_word
  if s:current_word == ''
    echomsg "No word under cursor"
    return
  endif

  let tags = taglist('^'.s:current_word.'$')

  if empty(tags)
    echomsg "No tags found for: ".s:current_word
    return
  endif

  let s:line_chosen = v:null
  for s:line_chosen in tags
    let s:selected_tags = s:line_chosen
    " Prioritize C function prototype tags
    if s:line_chosen.kind == 'p'
      break
    endif
  endfor

  if !exists("s:selected_tags")
    " echomsg "selected_tags was null"
    let s:selected_tags = tags[0]
  else
    if s:selected_tags is v:null
      silent exe 'tag '.s:current_word
    endif
  endif

  exe 'tag ' .s:selected_tags.name

  let s:selected_tags = v:null
endfunction

nnoremap <silent><c-]> :call <SID>Jump_to_tag()<cr>
nnoremap <silent><c-}> :call <SID>Select_tag()<cr>
