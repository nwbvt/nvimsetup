return {
  { 'tpope/vim-projectionist' },
  -- NOTE: nvim-ts-autotag currently requires Neovim >= 0.9.5 and has no
  -- tagged release to pin to an older, Neovim-0.8-compatible commit, so it's
  -- dropped from the 0.8 baseline. Uncomment if you don't need Neovim 0.8.
  -- { 'windwp/nvim-ts-autotag', config = function() require('nvim-ts-autotag').setup() end },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-dispatch' },
  { 'radenling/vim-dispatch-neovim' },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>m', '', { desc = 'Git' })
      vim.keymap.set('n', '<leader>ms', '<cmd>G status<cr>', { desc = 'Git status' })
      vim.keymap.set('n', '<leader>mp', '<cmd>G add -up<cr>', { desc = 'Git Add Patch' })
      vim.keymap.set('n', '<leader>ma', '<cmd>G add<cr>', { desc = 'Git Add' })
      vim.keymap.set('n', '<leader>mc', '<cmd>G commit<cr>', { desc = 'Git Commit' })
    end,
  },
  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end,
  },
}
