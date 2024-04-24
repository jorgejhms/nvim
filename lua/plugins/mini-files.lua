require("mini.files").setup({
  mappings = {
    show_help = "?", -- Maping original parece que tiene conflicto
  },
})
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Abre MiniFiles" })
vim.keymap.set(
  "n",
  "<leader>E",
  "<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
  { desc = "Abre MiniFiles (muestra archivo actual)" }
)
