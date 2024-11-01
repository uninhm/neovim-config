call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zah/nim.vim'
Plug 'norcalli/nvim-colorizer.lua'

" Telescope and dependencies
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'Exafunction/codeium.nvim'

Plug 'luk400/vim-jukit', { 'on': [] }

" Latex
Plug 'lervag/vimtex'

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

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Create a command JukitLoad to enable Jukit and reload the file
command! -nargs=0 JukitLoad call plug#load("vim-jukit") | e
nnoremap <leader>jl <cmd>JukitLoad<cr>

" File running
autocmd FileType python nnoremap <f5> :term python %<cr>i
autocmd FileType haskell nnoremap <f5> :term runhaskell %<cr>i
autocmd FileType nim nnoremap <f5> :term nim r %<cr>i
autocmd FileType ruby nnoremap <f5> :term ruby %<cr>i

let g:codeium_disable_bindings = 1

let g:vimtex_view_general_viewer = 'evince'

lua << EOF
require'colorizer'.setup(
  {
    '*';
  },
  {
    RRGGBBAA = true;
  }
)
EOF

lua require('lsconfig')
