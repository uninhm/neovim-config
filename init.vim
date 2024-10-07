call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zah/nim.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
