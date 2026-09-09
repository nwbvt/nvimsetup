-- lua/pack.lua
local pack = vim.pack

pack.add({ 'https://github.com/tpope/vim-projectionist' })
pack.add({ 'https://github.com/windwp/nvim-ts-autotag' })
pack.add({ 'https://github.com/tpope/vim-repeat' })
pack.add({ 'https://github.com/tpope/vim-surround' })
pack.add({ 'https://github.com/tpope/vim-dispatch' })
pack.add({ 'https://github.com/radenling/vim-dispatch-neovim' })
pack.add({ 'https://github.com/tpope/vim-fugitive' })
vim.keymap.set('n', "<leader>m", "", {desc = "Git"})
vim.keymap.set('n', "<leader>ms", "<cmd>G status<cr>", {desc = "Git status"})
vim.keymap.set('n', "<leader>mp", "<cmd>G add -up<cr>", {desc = "Git Add Patch"})
vim.keymap.set('n', "<leader>ma", "<cmd>G add<cr>", {desc = "Git Add"})
vim.keymap.set('n', "<leader>mc", "<cmd>G commit<cr>", {desc = "Git Commit"})

pack.add({ 'https://github.com/windwp/nvim-autopairs' })

require("nvim-autopairs").setup({})
