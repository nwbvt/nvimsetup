return {
  'shuber/vim-promiscuous',
  dependencies = { 'junegunn/fzf' },
  config = function()
    vim.keymap.set('n', '<leader>p', '', { desc = 'Context Switching' })
    vim.keymap.set('n', '<leader>pb', '<cmd>Promiscuous<cr>')
    vim.keymap.set('n', '<leader>pp', '<cmd>Promiscuous -<cr>')
  end,
}
