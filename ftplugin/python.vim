setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal shiftround
setlocal colorcolumn=80

let $PATH=$PATH . ':' . $HOME . '/Library/Python/3.5/bin'

"Linter
let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_args= '--max-line-length=119'
"let g:flake8_max_line_length=119

"PyMode
let g:pymode_folding = 0
let g:pymode_virtualenv = 0
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
