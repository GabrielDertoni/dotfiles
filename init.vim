call plug#begin('~/.vim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" GUI enhancements
Plug 'itchyny/lightline.vim'

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
" Plug 'tweekmonster/gofmt.vim'
Plug 'sheerun/vim-polyglot'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'machakann/vim-highlightedyank'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug 'Iron-E/nvim-highlite'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'glepnir/lspsaga.nvim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'Rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'fatih/vim-go'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'pest-parser/pest.vim'

" Cheat cheat
Plug 'dbeniamine/cheat.sh-vim'

" Sourounding
Plug 'tpope/vim-surround'

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
" colorscheme base16-gruvbox-dark-hard
colorscheme ayu
let ayucolor = "dark"

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
let g:compile_cmd = ""
nnoremap <leader>ru :execute "10sp +" . fnameescape(expand("term " . expand(compile_cmd)))<CR>i
nnoremap <leader>cc :let compile_cmd = input("Compile command > ", compile_cmd)<CR>
nnoremap <leader>rc :execute "tabe +" . fnameescape(expand("term " . expand(input("Run command > "))))<CR>

augroup RUST
    autocmd!
    autocmd FileType rust let g:compile_cmd = "cargo r"
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
nnoremap <leader>vrc :tabe ~/dotfiles/init.vim<CR>

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
