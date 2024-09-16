call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zah/nim.vim'

call plug#end()

colorscheme dracula
set termguicolors

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

set smartindent
set smartcase
set cursorline
set number relativenumber
set nowrap

highlight link ExtraWhitespace ErrorMsg
match ExtraWhitespace /\s\+$/

let mapleader = ','

" File running
autocmd FileType python nnoremap <f5> :term python %<cr>i
autocmd FileType haskell nnoremap <f5> :term runhaskell %<cr>i
autocmd FileType nim nnoremap <f5> :term nim r %<cr>i
autocmd FileType ruby nnoremap <f5> :term ruby %<cr>i
