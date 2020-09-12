setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal smarttab
setlocal shiftround
syn on

let b:ale_linters = {'php': ['langserver']}
let g:ale_php_langserver_use_global = 1
let g:ale_php_langserver_executable = 'php-language-server'
