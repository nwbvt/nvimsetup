-- Extra keymaps for this LSP setup, kept separate from the global LSP
-- keymaps defined in init.lua's LSP section.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Documentation
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Smart rename
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
  end,
})

-- Contributes `basedpyright`/`ruff` to the shared `neovim/nvim-lspconfig`
-- plugin declared in init.lua. lazy.nvim deep-merges `opts` across every
-- spec fragment for the same plugin, so the servers below get combined with
-- `lua_ls` there, and both get picked up by the same mason-tool-installer /
-- lspconfig.setup() loop (which also injects default capabilities).
return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = 'basic',
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      ruff = {},
    },
  },
}
