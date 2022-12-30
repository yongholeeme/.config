set nu
syntax enable

"이전에 끝났던 라인에서 시작하기
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
