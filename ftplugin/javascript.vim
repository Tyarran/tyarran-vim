setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal shiftround
setlocal colorcolumn=120

function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:syntastic_javascript_checkers = ['eslint']
let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))
