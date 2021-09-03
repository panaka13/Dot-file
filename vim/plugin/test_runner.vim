function! g:RunTest()
  if winwidth(0) > 120
    exec "vert term" s:GetCommand()
  else
    exec "term " s:GetCommand()
  endif
endfunction


function! s:GetCommand()
  let l:current_file = expand('%:')
  if expand('%:e') == 'py'
    return "python3 -m unittest ".l:current_file
  endif
endfunction
