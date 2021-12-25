call plug#begin(stdpath('data') . '/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'github/copilot.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'zah/nim.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
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

inoremap <silent><expr> <TAB>
  \ copilot#GetDisplayedSuggestion().text != '' ? copilot#Accept() :
  \ "\<TAB>"

inoremap <silent><expr> <C-j> copilot#Accept()

exec 'luafile ' . stdpath('config') . '/lsconfig.lua'

autocmd BufRead,BufNewFile *.porth set filetype=porth

let g:copilot_filetypes = {
  \ 'porth': v:false,
  \ }

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

let mapleader = ','

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
