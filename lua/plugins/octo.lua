local map = vim.keymap.set

require("octo").setup({
  enable_builtin = true,
  suppress_missing_scope = {
    projects_v2 = true,
  },
})

map("n", "<Leader>oil", "<cmd>Octo issue list assignee=jorgejhms<CR>", { desc = "Open issues assigned to me" })
