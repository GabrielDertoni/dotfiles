call plug#begin('~/.vim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

" GUI enhancements
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'

" TMUX integration
Plug 'christoomey/vim-tmux-navigator'

" VIM enhancements
Plug 'mbbill/undotree'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'terryma/vim-multiple-cursors'

" Utils
Plug 'vim-utils/vim-man'

" GIT integration
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'

" Others
Plug 'tweekmonster/gofmt.vim'
Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'Iron-E/nvim-highlite'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Semantic language support
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'Rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'fatih/vim-go'
Plug 'JuliaEditorSupport/julia-vim'

" Cheat cheat
Plug 'dbeniamine/cheat.sh-vim'

" Sourounding
Plug 'tpope/vim-surround'

Plug 'racer-rust/vim-racer'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

let g:deoplete#enable_at_startup = 1

" General configuration
set guicursor=
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set scrolloff=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set mouse=a
set signcolumn=yes
" set termguicolors
set colorcolumn=80,120
set nohlsearch
set complete+=kspell
set completeopt=menuone,noinsert,noselect

" Sane splits
set splitright
set splitbelow

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v

let base16colorspace=256

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

set termguicolors

" Colors
set background=dark
" colorscheme gruvbox
colorscheme base16-gruvbox-dark-hard

syntax on

" Highlighting
highlight ColorColumn ctermbg=18 guibg=#403a37
" highlight Search ctermfg=White ctermbg=9 guifg=White guibg=9

" Config for nvim LSP
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
:lua << EOF
  local nvim_lsp = require('lspconfig')
  local on_attach = function(_, bufnr)
    require('completion').on_attach()
    --[[
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xd', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
    --]]
  end
  local servers = {'clangd', 'tsserver', 'pyls', 'gopls', 'rust_analyzer'}
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

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Lightline settings
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Tmux navigation
nnoremap <C-H> :TmuxNavigateLeft<CR>
nnoremap <C-J> :TmuxNavigateDown<CR>
nnoremap <C-K> :TmuxNavigateUp<CR>
nnoremap <C-L> :TmuxNavigateRight<CR>

" vim multiple cursors
nnoremap <C-C> <ESC>

nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

" Tabularize
nnoremap <leader>t :Tab /

inoremap <C-c> <esc>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.

" Coc-nvim
" nmap <leader>gd <Plug>(coc-definition)
" nmap <leader>gy <Plug>(coc-type-definition)
" nmap <leader>gi <Plug>(coc-implementation)
" nmap <leader>gr <Plug>(coc-references)
" nmap <leader>rr <Plug>(coc-rename)
" nmap <leader>g[ <Plug>(coc-diagnostic-prev)
" nmap <leader>g] <Plug>(coc-diagnostic-next)
" nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
" nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
" nnoremap <leader>cr :CocRestart

" Nvim-lsp
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gy :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>gp :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    lua vim.lsp.buf.hover()
  endif
endfunction

" Faster pasting
nnoremap , "0p
vnoremap , "0p

" Paste at the end of the line
nnoremap P $"0p

" Buffer navigation
nnoremap <leader><leader> <C-^>

" Terminal key mapping
tnoremap <C-N> <C-\><C-N>
tnoremap <C-H> <C-\><C-N>:TmuxNavigateLeft<CR>
tnoremap <C-J> <C-\><C-N>:TmuxNavigateDown<CR>
tnoremap <C-K> <C-\><C-N>:TmuxNavigateUp<CR>
tnoremap <C-L> <C-\><C-N>:TmuxNavigateRight<CR>
nnoremap <expr> q &buftype == "terminal" ? ':q<CR>' : 'q'

" C compilation inside vim.
autocmd FileType c nnoremap <F5> :sp +term\ make
autocmd FileType c command! -nargs=* Make :15sp +term\ make\ <args>

" Highlighting
nnoremap <leader>h :set hlsearch!<CR>

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" File templates
" autocmd BufNewFile  *.c 0r ~/.config/nvim/templates/skeleton.c
" autocmd BufNewFile  *.cpp 0r ~/.config/nvim/templates/skeleton.cpp


" Experimentally integrate YouCompleteMe with vim-multiple-cursors, otherwise    
" the numerous Cursor events cause great slowness                                
" (https://github.com/kristijanhusak/vim-multiple-cursors/issues/4)

" function Multiple_cursors_before()                                               
"   let s:old_ycm_whitelist = g:ycm_filetype_whitelist                           
"   let g:ycm_filetype_whitelist = {}                                            
" endfunction                                                                      
"                                                                                  
" function Multiple_cursors_after()                                                
"   let g:ycm_filetype_whitelist = s:old_ycm_whitelist                           
" endfunction      

" Vim Rooter configuration
let g:rooter_patterns = ['Makefile', '.git', '*.sln', 'build/env.sh']
let g:rooter_manual_only = 1


" Close all floating windows (sometimes floating windows dont close properly)
nnoremap <leader>wo <C-w>o

" Open term
nnoremap <M-l> :vs +term<CR>
nnoremap <M-j> :sp +term<CR>
nnoremap <M-t> :tabe +term<CR>

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


" Compilation
nnoremap <leader>ru :execute "10sp +" . fnameescape(expand("term " . expand(compile_cmd)))<CR>


augroup MY_GROUP
    autocmd!
    " Use auocmd to force lightline update.
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

    " Compilation
    autocmd FileType julia let compile_cmd="julia %"
augroup END

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
