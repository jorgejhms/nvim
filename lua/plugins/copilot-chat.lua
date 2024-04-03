return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "canary",
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
      language = "Spanish", -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    keys = {
      { "<leader>cct", ":CopilotChatToggle<cr>", desc = "Toggle CopilotChat window" },
      { "<leader>cce", ":CopilotChatExplain<cr>", desc = "Explain selected code" },
      { "<leader>ccT", "<cmd>CopilotChatTests<cr>", desc = "Generate tests for selected code" },
      { "<leader>ccf", "<cmd>CopilotChatFix<cr>", desc = "Fix selected selected code" },
      { "<leader>ccF", "<cmd>CopilotChatFix<cr>", desc = "Assist with current diagnostic" },
      { "<leader>cco", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize selected code" },
      { "<leader>ccd", "<cmd>CopilotChatDocs<cr>", desc = "Document selected code" },
      { "<leader>ccc", "<cmd>CopilotChatCommit<cr>", desc = "Write commit message" },
    },
  },
}
