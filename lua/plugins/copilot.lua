local map = vim.keymap.set

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enable = false },
})
require("copilot_cmp").setup({
  fix_pairs = true,
})
require("CopilotChat").setup({
  show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
  debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
  disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
  language = "Spanish", -- Copilot answer language settings when using default prompts. Default language is English.
})

-- Keymaps
map({ "n", "x" }, "<leader>cct", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilotchat window" })
map({ "n", "x" }, "<leader>cce", "<cmd>CopilotChatExplain<CR>", { desc = "Explain selected code" })
map({ "n", "x" }, "<leader>ccT", "<cmd>CopilotChatTests<CR>", { desc = "Generate tests for selected code" })
map({ "n", "x" }, "<leader>ccf", "<cmd>CopilotChatFix<CR>", { desc = "Fix selected code" })
map({ "n", "x" }, "<leader>ccF", "<cmd>CopilotChatFixDiagnostic<CR>", { desc = "Assist with current diagnostic" })
map({ "n", "x" }, "<leader>cco", "<cmd>CopilotChatOptimize<CR>", { desc = "Optimize selected code" })
map({ "n", "x" }, "<leader>ccd", "<cmd>CopilotChatDocs<CR>", { desc = "Document selected code" })
map({ "n", "x" }, "<leader>ccc", "<cmd>CopilotChatCommit<CR>", { desc = "Write commit message" })
