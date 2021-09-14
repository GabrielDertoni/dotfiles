" Config for nvim LSP
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
  local nvim_lsp = require('lspconfig')

  local on_attach = function(_, bufnr)
    require('completion').on_attach()
  end

  local servers = {'clangd', --[[ 'tsserver', 'pyls', --]]'pyright', 'gopls', 'rust_analyzer'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end
EOF

" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }

" Nvim-lsp
nnoremap <silent> <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gy :lua vim.lsp.buf.type_definition()<CR>
" nnoremap <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <leader>gp :lua vim.lsp.diagnostic.goto_prev()<CR>
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
