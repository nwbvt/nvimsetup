local pack = vim.pack

pack.add( {'https://github.com/coder/claudecode.nvim'} )
pack.add( {'https://github.com/mr55p-dev/claude-tmux.nvim'})

local tmux_provider = require("claude-tmux").setup({
  toggle_key = "<C-j>",  -- Key to return to neovim (default: "<C-j>")
  split_size = 30,       -- Split size as percentage (default: 30)
  split_side = "bottom", -- "bottom" or "right" (default: "bottom")
})

require("claudecode").setup({
    ---@diagnostic disable-next-line: missing-fields
    terminal = {
        provider=tmux_provider,
    },
})

local mappings =  {
    { key = "<leader>a", cmd = "", desc = "AI/Claude Code" },
    { key = "<leader>ac", cmd = "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { key = "<leader>af", cmd = "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { key = "<leader>ar", cmd = "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { key = "<leader>aC", cmd = "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { key = "<leader>am", cmd = "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { key = "<leader>ab", cmd = "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { key = "<leader>as", cmd = "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    -- Diff management
    { key = "<leader>aa", cmd = "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { key = "<leader>ad", cmd = "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
}

for _, map in ipairs(mappings) do
    local opts = {desc = map.desc}
    vim.keymap.set(map.mode or 'n', map.key, map.cmd, opts)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
    callback = function()
        vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", { buffer = true, desc = "Add File" })
    end,
})
