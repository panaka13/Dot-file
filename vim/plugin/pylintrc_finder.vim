function g:FindPylintrc()
  let cwd = getcwd().';'
  return findfile('.pylintrc', cwd)
endfunction
