require("virt-column").setup({
  char = "╎",
  virtcolumn = "80",
  -- En markdown el texto ya está centrado en 80 columnas (config.markdown-center)
  exclude = { filetypes = { "markdown" } },
})
