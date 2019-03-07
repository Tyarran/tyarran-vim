setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal shiftround
"setlocal colorcolumn=80
setlocal colorcolumn=100

"let $PATH=$PATH . ':' . $HOME . '/Library/Python/3.5/bin'

"Linter
let b:ale_linters = {'python': ['flake8']}

"PyMode
let g:pymode_folding = 0
let g:pymode_virtualenv = 0
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
