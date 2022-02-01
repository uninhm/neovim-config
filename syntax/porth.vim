" Vim syntax file
" Language: Porth
"
" Usage Instructions
" Put this file in .vim/syntax/porth.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.porth set filetype=porth
"
" https://gitlab.com/tsoding/porth
"
" Copyright 2021 Alexey Kutepov <reximkut@gmail.com> and Porth Contributors
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


if exists("b:current_syntax")
  finish
endif

syntax keyword porthTodos TODO XXX FIXME NOTE

" Language keywords
syntax keyword porthKeywords if else while do include memory proc const end offset reset assert in inline

" Comments
syntax region porthCommentLine start="//" end="$"   contains=porthTodos

" Strings
syntax region porthString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region porthString start=/\v'/ skip=/\v\\./ end=/\v'/

" Set highlights
highlight default link porthTodos Todo
highlight default link porthKeywords Keyword
highlight default link porthCommentLine Comment
highlight default link porthString String

let b:current_syntax = "porth"
