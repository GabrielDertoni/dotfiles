" General configuration
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
set undodir=~/.cache/nvim/undodir
set undofile
set incsearch
set mouse=a
set signcolumn=yes
" set termguicolors
set colorcolumn=80,120
set nohlsearch
set spelllang=pt_br,en_us,de
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
set list

" Text wrapping
" NOTE: Use gq<move> to wrap words
set textwidth=80

highlight Cursor guifg=white guibg=white
highlight iCursor guifg=white guibg=white
