require("virt-column").setup({
  char = "╎",
  virtcolumn = "80",
  -- En markdown el texto ya está centrado en 80 columnas (config.markdown-center)
  -- El inicio (mini.starter) centra bloques de relleno: una guía de columna no aplica ahí
  exclude = { filetypes = { "markdown", "ministarter" } },
})
