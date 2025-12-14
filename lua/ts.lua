require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('orgmode').setup({
  org_agenda_files = {'~/Programming/Org-mode/**'},
  org_default_notes_file = '~/Programming/Org-mode/notes.org',
})
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
