" Racer config
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> <leader>gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> <leader>gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> <leader>gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> <leader>gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END
