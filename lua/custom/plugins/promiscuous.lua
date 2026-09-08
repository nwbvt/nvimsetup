local pack = vim.pack

pack.add({ 'https://github.com/shuber/vim-promiscuous' })
pack.add({ 'https://github.com/junegunn/fzf' })

vim.keymap.set('n', "<leader>p", "", {desc="Context Switching"})
vim.keymap.set('n', "<leader>pb", "<cmd>Promiscuous<cr>")
vim.keymap.set('n', "<leader>pp", "<cmd>Promiscuous -<cr>")
