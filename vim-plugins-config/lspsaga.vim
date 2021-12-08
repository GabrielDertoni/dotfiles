


lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
    error_sign = '▶',
    warn_sign = '▶',
    hint_sign = '▶',
    infor_sign = '▶',
    -- dianostic_header_icon = '❌ ',
    code_action_icon = '💡',
    -- finder_definition_icon = '🎨',
    finder_action_keys = {
        open = "<Enter>",
        vsplit = "<C-t>"
    },
    -- finder_reference_icon = '📑',
    -- definition_preview_icon = '',
    border_style = "round",
}
EOF


" nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <leader>e <Cmd>Lspsaga show_line_diagnostics<CR>
nnoremap <silent> <leader>rr <Cmd>Lspsaga rename<CR>
nnoremap <silent> <leader>gr <Cmd>Lspsaga lsp_finder<CR>
inoremap <silent> <silent><C-s> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> <leader>gr <Cmd>Lspsaga lsp_finder<CR>
" nnoremap <silent> <leader>gn <Cmd>Lspsaga diagnostics_jump_next<CR>
" nnoremap <silent> <leader>gp <Cmd>Lspsaga disgnostics_jump_prev<CR>
nnoremap <silent> <leader>sd <Cmd>Lspsaga preview_definition<CR>
" nnoremap <silent> <leader>sa <Cmd>Lspsaga code_action<CR>

