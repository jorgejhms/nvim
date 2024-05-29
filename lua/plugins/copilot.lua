local map = vim.keymap.set

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enable = false },
})
require("copilot_cmp").setup({
  fix_pairs = true,
})

local user = vim.env.USER or "Usuario"
user = user:sub(1, 1):upper() .. user:sub(2)
require("CopilotChat").setup({
  model = "gpt-4",
  auto_insert_mode = true,
  show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
  debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
  disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
  language = "Spanish", -- Copilot answer language settings when using default prompts. Default language is English.
  question_header = "  " .. user .. " ",
  answer_header = "  Copilot ",
  window = {
    width = 0.4,
  },
})

-- Keymaps
map({ "n", "x" }, "<leader>aa", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilotchat window" })
map({ "n", "x" }, "<leader>aq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input)
  end
end, { desc = "Quick chat" })
map({ "n", "x" }, "<leader>ae", "<cmd>CopilotChatExplain<CR>", { desc = "Explain selected code" })
map({ "n", "x" }, "<leader>aT", "<cmd>CopilotChatTests<CR>", { desc = "Generate tests for selected code" })
map({ "n", "x" }, "<leader>af", "<cmd>CopilotChatFix<CR>", { desc = "Fix selected code" })
map({ "n", "x" }, "<leader>aF", "<cmd>CopilotChatFixDiagnostic<CR>", { desc = "Assist with current diagnostic" })
map({ "n", "x" }, "<leader>ao", "<cmd>CopilotChatOptimize<CR>", { desc = "Optimize selected code" })
map({ "n", "x" }, "<leader>ad", "<cmd>CopilotChatDocs<CR>", { desc = "Document selected code" })
map({ "n", "x" }, "<leader>ac", "<cmd>CopilotChatCommit<CR>", { desc = "Write commit message" })
