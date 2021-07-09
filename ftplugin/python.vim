setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal shiftround
setlocal colorcolumn=88

"Linter
let b:ale_linters = {'python': ['pyls', 'flake8','mypy', 'remove_trailing_lines', 'trim_whitespace']}
let b:ale_fixers = {'python': ['isort', 'black']}
let g:ale_completion_autoimport = 1
