" " Config for nvim LSP
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" 
" lua << EOF
"     local nvim_lsp = require('lspconfig')
" 
"     local on_attach = function(client, bufnr)
"         require('completion').on_attach(client)
"     end
" 
"     local servers = {'clangd', 'tsserver', 'pyls', 'gopls' --[[, 'rust_analyzer' --]]}
"     for _, lsp in ipairs(servers) do
"         nvim_lsp[lsp].setup {
"             on_attach = on_attach,
"         }
"     end
"     --[[
"     nvim_lsp.rust_analyzer.setup({
"         on_attach=on_attach,
"         settings = {
"             ["rust-analyzer"] = {
"                 procMacro = {
"                     enable = true,
"                 }
"             }
"         },
"         diagnostics = {
"             enable = true,
"             disabled = { "unresolved-proc-macro", "proc-macro" },
"             enableExperimental = true,
"         }
"     })
"     --]]
" 
"     nvim_lsp.rls.setup {
"         cmd = {"rustup", "run", "nightly", "rls"},
"         settings = {
"             rust = {
"                 unstable_features = true,
"                 build_on_save = false,
"                 all_features = true,
"             },
"         },
"     }
" EOF
" 
" " Nvim-lsp
" nnoremap <silent> <leader>gd :lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <leader>gy :lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <silent> <leader>gp :lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <leader>gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <leader>gr :lua vim.lsp.buf.references()<CR>
" nnoremap <silent> <leader>rr :lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> <leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
" 
" " Restart the lua client.
" nnoremap <leader>re :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>:e<CR>
" 
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     lua vim.lsp.buf.hover()
"   endif
" endfunction
