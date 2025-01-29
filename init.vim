call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zah/nim.vim'

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

" File running
autocmd FileType python nnoremap <f5> :term python %<cr>i
autocmd FileType haskell nnoremap <f5> :term runhaskell %<cr>i
autocmd FileType nim nnoremap <f5> :term nim r %<cr>i
autocmd FileType ruby nnoremap <f5> :term ruby %<cr>i
autocmd FileType java nnoremap <f5> :term javac % && java %:r<cr>i

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ca  <Plug>(coc-codeaction-cursor)
