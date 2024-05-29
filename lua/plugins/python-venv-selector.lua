local add = MiniDeps.add
local map = vim.keymap.set

add({
  source = "linux-cultist/venv-selector.nvim",
  depends = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
  },
})

require("venv-selector").setup({
  auto_refresh = true,
  search_venv_managers = false,
  name = { "venv", ".venv" },
})

map("n", "<Leader>vs", "<Cmd>VenvSelect<CR>", { desc = "Select Python venv" })
map("n", "<Leader>vc", "<cmd>VenvSelectCached", { desc = "Select Python venv cached" })
