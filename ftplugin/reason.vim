let g:ale_fixers = {'reason': ['refmt']}
let g:ale_linters = {'reason': ['reason-language-server']}
let g:ale_reason_ls_executable = 'reason-language-server'
let g:ale_fix_on_save = 1
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal smarttab
set makeprg=yarn\ run\ build
