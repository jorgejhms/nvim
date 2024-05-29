local add = MiniDeps.add

add("lukas-reineke/virt-column.nvim")

require("virt-column").setup({
  char = "╎",
  virtcolumn = "80",
})
