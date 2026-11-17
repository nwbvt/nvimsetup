vim.pack.add({
  'https://github.com/smart-splits-nvim/smart-splits.nvim',
  'https://github.com/smart-splits-nvim/backend-tmux',
})

local ss = require('smart-splits')
ss.setup({
  mux = { backend = 'smart-splits-backend-tmux' },
})

-- Overrides the plain <C-w> focus mappings in init.lua
vim.keymap.set('n', '<C-h>', ss.move_cursor_left, { desc = 'Move focus left' })
vim.keymap.set('n', '<C-j>', ss.move_cursor_down, { desc = 'Move focus down' })
vim.keymap.set('n', '<C-k>', ss.move_cursor_up, { desc = 'Move focus up' })
vim.keymap.set('n', '<C-l>', ss.move_cursor_right, { desc = 'Move focus right' })

vim.keymap.set('n', '<A-h>', ss.resize_left, { desc = 'Resize left' })
vim.keymap.set('n', '<A-j>', ss.resize_down, { desc = 'Resize down' })
vim.keymap.set('n', '<A-k>', ss.resize_up, { desc = 'Resize up' })
vim.keymap.set('n', '<A-l>', ss.resize_right, { desc = 'Resize right' })
