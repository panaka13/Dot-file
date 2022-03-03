function! g:CompileRun()
  if winwidth(0) > 120
    exec "vert term ++shell" s:CompileRunCmd()
  else
    exec "term ++shell" s:CompileRunCmd()
  endif
endfunction


function! s:CompileRunCmd() 
  let l:current_file = expand('%:p')
  let l:prompt = "echo 'Running ".l:current_file."';"
  if index(["cpp", "cxx"], expand("%:e")) != -1
    let l:executable = $HOME."/tmp/a.out"
    let l:cmd = "g++"." -o ".l:executable." ".l:current_file."; ".l:executable
    return l:prompt.l:cmd
  elseif expand("%:e") == "py"
    return l:prompt."python3 ".l:current_file
  elseif expand("%:e") == "go"
    return l:prompt."go run ".l:current_file." << in.txt"
  endif
endfunction
