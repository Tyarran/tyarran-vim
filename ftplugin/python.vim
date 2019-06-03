setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal shiftround
setlocal colorcolumn=100

"Linter
let b:ale_linters = {'python': ['pyls', 'flake8', 'remeove_trailing_lines', 'trim_whitespace']}
let g:ale_python_flake8_options = '--verbose --max-line-length 180 --ignore=_,W503 --import-order-style=edited --application-package-names=ma_apiclients,ma_flask_common,ma_models,ma_fs,ma_flask_auth --application-import-names=myproapi,mediaapi,pdfapi,barometre,carbon14,followup,geoapi,indiceapi,tests'

"PyMode
let g:pymode_folding = 0
let g:pymode_virtualenv = 0
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
" let ale_python_auto_pipenv = 1
 
"Black
let g:black_linelength = 100
