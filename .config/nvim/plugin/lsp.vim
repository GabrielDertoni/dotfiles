" Config for nvim LSP
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
  local nvim_lsp = require('lspconfig')

  local on_attach = function(_, bufnr)
    require('completion').on_attach()
  end

  local servers = {'clangd', 'tsserver', 'pylsp', 'gopls', 'rust_analyzer'--[[,'rls'--]] }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end
EOF

" Nvim-lsp
nnoremap <silent> K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>gd <Cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gy <Cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>gp :lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>

" Restart the lua client.
nnoremap <silent> <leader>re :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:e<CR>


" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     lua vim.lsp.buf.hover()
"   endif
" endfunction



" Kill LSP
command KillLSP <Cmd>lua vim.lsp.get_client_by_id(1).stop()<CR>
