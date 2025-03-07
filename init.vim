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
Plug 'supermaven-inc/supermaven-nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'luk400/vim-jukit', { 'on': [] }

" Latex and org
Plug 'lervag/vimtex'
Plug 'nvim-orgmode/orgmode'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
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
autocmd FileType java nnoremap <f5> :term javac % && java %:r && rm %:r.class<cr>i

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !doas tee > /dev/null %

let g:vimtex_view_general_viewer = 'evince'

let g:AutoPairsMultilineClose = 0

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
lua require('ts')
