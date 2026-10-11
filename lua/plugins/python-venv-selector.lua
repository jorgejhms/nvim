local map = vim.keymap.set

require("venv-selector").setup({
  options = { picker = "mini-pick" },
})

map("n", "<Leader>vs", "<Cmd>VenvSelect<CR>", { desc = "Select Python venv" })
map("n", "<Leader>vc", "<cmd>VenvSelectCached", { desc = "Select Python venv cached" })
