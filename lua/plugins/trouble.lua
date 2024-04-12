require("trouble").setup({
  use_diagnostic_signs = true,
})

-- Keymaps
vim.keymap.set(
  "n",
  "<leader>xx",
  "<cmd>TroubleToggle document_diagnostics<CR>",
  { desc = "Document Diagnostics (Trouble)" }
)
vim.keymap.set(
  "n",
  "<leader>xX",
  "<cmd>TroubleToggle workspace_diagnostics<CR>",
  { desc = "Workspace Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>TroubleToggle loclist<CR>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix List (Trouble)" })
vim.keymap.set("n", "[q", function()
  if require("trouble").is_open() then
    require("trouble").previous({ skip_groups = true, jump = true })
  else
    local ok, err = pcall(vim.cmd.cprev)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end
end, { desc = "Previous trouble/quickfix item" })
vim.keymap.set("n", "]q", function()
  if require("trouble").is_open() then
    require("trouble").next({ skip_groups = true, jump = true })
  else
    local ok, err = pcall(vim.cmd.cnext)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end
end, { desc = "Next trouble/quickfix item" })
