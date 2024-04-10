require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enable = false },
})
require("copilot_cmp").setup({
  fix_pairs = true,
})
require("CopilotChat").setup({
  show_help = "yes",         -- Show help text for CopilotChatInPlace, default: yes
  debug = false,             -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
  disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
  language = "Spanish",      -- Copilot answer language settings when using default prompts. Default language is English.
})

-- Keymaps
vim.keymap.set("n", "<leader>cct", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilotchat window" })
vim.keymap.set("n", "<leader>cce", "<cmd>CopilotChatExplain<CR>", { desc = "Explain selected code" })
vim.keymap.set("n", "<leader>ccT", "<cmd>CopilotChatTests<CR>", { desc = "Generate tests for selected code" })
vim.keymap.set("n", "<leader>ccf", "<cmd>CopilotChatFix<CR>", { desc = "Fix selected code" })
vim.keymap.set("n", "<leader>ccF", "<cmd>CopilotChatFixDiagnostic<CR>", { desc = "Assist with current diagnostic" })
vim.keymap.set("n", "<leader>cco", "<cmd>CopilotChatOptimize<CR>", { desc = "Optimize selected code" })
vim.keymap.set("n", "<leader>ccd", "<cmd>CopilotChatDocs<CR>", { desc = "Document selected code" })
vim.keymap.set("n", "<leader>ccc", "<cmd>CopilotChatCommit<CR>", { desc = "Write commit message" })
