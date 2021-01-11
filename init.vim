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
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

let g:deoplete#enable_at_startup = 1

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


" vim multiple cursors
nnoremap <C-C> <ESC>

nnoremap <leader>gc :GCheckout<CR>
nnoremap <C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
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

" Faster pasting
nnoremap , "0p
vnoremap , "0p

" Paste at the end of the line
nnoremap P $"0p

" Buffer navigation
nnoremap <leader><leader> <C-^>

" Terminal key mapping
tnoremap <C-N> <C-\><C-N>
nnoremap <expr> q &buftype == "terminal" ? ':q<CR>' : 'q'

" C compilation inside vim.
autocmd FileType c nnoremap <F5> :sp +term\ make
autocmd FileType c command! -nargs=* Make :15sp +term\ make\ <args>

" Highlighting
nnoremap <leader>h :set hlsearch!<CR>

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

" Close all floating windows (sometimes floating windows dont close properly)
nnoremap <leader>wo <C-w>o

" Open term
nnoremap <M-l> :vs +term<CR>
nnoremap <M-j> :sp +term<CR>
nnoremap <M-t> :tabe +term<CR>

" Compilation
nnoremap <leader>ru :execute "10sp +" . fnameescape(expand("term " . expand(compile_cmd)))<CR>

augroup MY_GROUP
    autocmd!
    " Use auocmd to force lightline update.
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

    " Compilation
    autocmd FileType julia let compile_cmd="julia %"
augroup END

