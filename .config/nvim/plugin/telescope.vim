nnoremap <leader>ps <Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf <Cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent> <C-p> <Cmd>Telescope git_files<CR>
nnoremap <silent> <leader><C-p> <Cmd>Telescope live_grep<CR>

nnoremap <leader>pw <Cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb <Cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh <Cmd>lua require('telescope.builtin').help_tags()<CR>
