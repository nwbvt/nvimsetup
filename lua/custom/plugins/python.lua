-- 1. Setup Mason to download the binaries automatically
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "basedpyright", "ruff" }
})

-- 2. Modern LSP Configuration (Using Neovim 0.11+ native APIs)
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Configure Basedpyright
vim.lsp.config("basedpyright", {
    capabilities = capabilities,
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})

-- Configure Ruff
vim.lsp.config("ruff", {
    capabilities = capabilities,
})

-- 3. Explicitly enable the servers so they start up for your files
vim.lsp.enable({ "basedpyright", "ruff" })

-- 4. Standard LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)      -- Go to definition
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)            -- Documentation
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)  -- Smart rename
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
    end,
})
