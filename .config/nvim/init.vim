call plug#begin('~/.vim/plugged')

" GUI enhancements
Plug 'itchyny/lightline.vim'

" TMUX integration
Plug 'christoomey/vim-tmux-navigator'

" VIM enhancements
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'

" Utils
Plug 'paretje/nvim-man'

" GIT integration
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'TimUntersberger/neogit'

" Others
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-dispatch'
Plug 'machakann/vim-highlightedyank'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug 'Iron-E/nvim-highlite'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'tami5/lspsaga.nvim'

" Auto Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Syntactic language support
Plug 'sheerun/vim-polyglot'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'Rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'plasticboy/vim-markdown'
Plug 'fatih/vim-go'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'pest-parser/pest.vim'
Plug 'PontusPersson/pddl.vim'
Plug 'yalesov/vim-ember-script'

" Sourounding
Plug 'tpope/vim-surround'

" Beta
Plug 'lewis6991/spellsitter.nvim'
Plug 'sunjon/shade.nvim'

call plug#end()

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

let g:deoplete#enable_at_startup = 1

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v

let base16colorspace=256

set termguicolors

" Colors
" colorscheme gruvbox
colorscheme base16-gruvbox-dark-hard
" colorscheme ayu
" let ayucolor = "dark"

" disable transparent background
set background=dark

syntax on

" Highlighting
highlight ColorColumn ctermbg=18 guibg=#403a37
highlight Normal ctermbg=18 ctermfg=7 guibg=#1d2022


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
" nnoremap <C-p> :GFiles --cached --others --exclude-standard<CR>
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
nnoremap X "_x
" Search highlighted text
vnoremap * "ay/\<<C-r>a\><CR>

" Tabularize
nnoremap <leader>t :Tabularize /

inoremap <C-c> <esc>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" Faster pasting
nnoremap , "0p
vnoremap , "0p

" Resize window
nnoremap <C-Right> <C-W>>
nnoremap <C-Left> <C-W><

" Buffer navigation
nnoremap <leader><leader> <C-^>

" Terminal key mapping
tnoremap <C-N> <C-\><C-N>
nnoremap <silent><expr> q &buftype == "terminal" ? ':q<CR>' : 'q'

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

" Already have yy for yanking the entire line, so Y yank to the end of the line
nnoremap <silent>Y y$

let g:highlightedyank_highlight_duration = 200

" Close all floating windows (sometimes floating windows dont close properly)
nnoremap <leader>wo <C-w>o

" Open term
nnoremap <M-l> :vs +term<CR>
nnoremap <M-j> :sp +term<CR>
nnoremap <M-t> :tabe +term<CR>

" Compilation
let g:compile_cmd = ""
nnoremap <leader>ru :execute "10sp +" . fnameescape(expand("term " . expand(compile_cmd)))<CR>i
nnoremap <leader>cc :let compile_cmd = input("Compile command > ", compile_cmd)<CR>
nnoremap <leader>rc :execute "tabe +" . fnameescape(expand("term " . expand(input("Run command > "))))<CR>

augroup RUST
    autocmd!
    autocmd FileType rust let g:compile_cmd = "cargo r"
    autocmd FileType rust vnoremap <leader>fmt :!rustfmt<CR>
augroup END

augroup PYTHON
    autocmd!
    autocmd FileType python let g:compile_cmd = "python3 %:p"
augroup END

augroup C
    autocmd!
    autocmd FileType c let g:compile_cmd = "make %:r && %:p"
augroup END

augroup JS
    autocmd!
    autocmd FileType javascript set shiftwidth=2 tabstop=2
augroup END


augroup MY_GROUP
    autocmd!
    " Use auocmd to force lightline update.
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

    " Compilation
    autocmd FileType julia let compile_cmd="julia %"
augroup END

" In ~/.personalrc use the same highlighting as in zsh files.
augroup PERSONALRC
    autocmd!
    autocmd BufNewFile,BufRead **/.personalrc set filetype=zsh
augroup END

" Syntax highligting for tapelang
augroup TAPELANG
    autocmd!
    autocmd BufNewFile,BufRead **/*.tape set syntax=tape
augroup END

augroup WSL_YANK
    autocmd!
    autocmd TextYankPost * call system("clip.exe", @")
augroup END

" Spellchecking
nnoremap <leader>ss :set spell!<CR>

" Formatting, format inside paragraph
nnoremap <leader>Q gqip

" Moving between tabs
nnoremap <silent> <C-S-Right> gt
nnoremap <silent> <C-S-Left> gT

" Open vimrc (init.vim)
nnoremap <leader>vrc :tabe ~/.config/nvim/init.vim<CR>

let g:surround_116 = "t\rt"
vnoremap <leader>S :call PromptSurround()<CR>

function PromptSurround()
    let readable = substitute(g:surround_116, "\r", "\\\\r", "gg")
    let g:surround_116 = substitute(input("Surround by: ", readable), "\\\\r", "\r", "gg")
    execute "normal gvSt"
endfunction

nnoremap <leader>i :call PromptProg()<CR>
vnoremap <leader>i :<C-U>call VPromptProg()<CR>

let g:interpreter = ""
function PromptProg()
    let g:interpreter = input("Interpreter: ", expand(g:interpreter))
    put = execute('w !' . expand(g:interpreter))
endfunction

let g:interpreter = ""
function VPromptProg()
    let g:interpreter = input("Interpreter: ", expand(g:interpreter))
    '>put = execute('''<,''>w !' . expand(g:interpreter))
endfunction


lua <<EOF
require('spellsitter').setup {
    enable = true,
    spellchecker = 'vimfn',
}

require('shade').setup {
    overlay_opacity = 50,
    opacity_step = 1,
    keys = {
        brightness_up    = '<C-Up>',
        brightness_down  = '<C-Down>',
        toggle           = '<leader>s',
    }
}
EOF
