local map = vim.keymap.set

require("venv-selector").setup({
  auto_refresh = true,
  search_venv_managers = false,
  name = { "venv", ".venv" },
})

map("n", "<Leader>vs", "<Cmd>VenvSelect<CR>", { desc = "Select Python venv" })
map("n", "<Leader>vc", "<cmd>VenvSelectCached", { desc = "Select Python venv cached" })
