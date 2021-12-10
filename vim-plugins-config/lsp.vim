" Config for nvim LSP
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua << EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require('lspconfig')

local servers = {'clangd', 'tsserver', 'pylsp', 'gopls', 'rust_analyzer'--[[,'rls'--]] }
for _, lsp in ipairs(servers) do
nvim_lsp[lsp].setup {
  capabilities = capabilities,
}
end

vim.o.completeopt = 'menuone,noselect'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
  },
}
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

" Kill LSP
command KillLSP <Cmd>lua vim.lsp.get_client_by_id(1).stop()<CR>
