vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false
vim.wo.relativenumber = true

vim.opt.wrap = false
vim.opt.cursorline = true

vim.api.nvim_create_autocmd("InsertLeave", { command = "silent! wall" })

vim.opt.autochdir = true

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

vim.keymap.set('n', '<leader>w', function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = not vim.wo.linebreak
end, { desc = 'Toggle wrap and linebreak' })
