


lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
    error_sign = '>',
    warn_sign = '>',
    hint_sign = '>',
    infor_sign = '>',
    border_style = "round",
}
EOF


nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <leader>e <Cmd>Lspsaga show_line_diagnostics<CR>
nnoremap <leader>rr <Cmd>Lspsaga rename<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
inoremap <silent><C-s> <Cmd>Lspsaga signature_help<CR>
nnoremap <leader>gr <Cmd>Lspsaga lsp_finder<CR>
nnoremap <leader>gn <Cmd>Lspsaga diagnostics_jump_next<CR>
nnoremap <leader>gp <Cmd>Lspsaga disgnostics_jump_prev<CR>
