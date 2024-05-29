local add = MiniDeps.add

add("R-nvim/R.nvim")

require("r").setup({
  R_app = "radian",
  R_cmd = "R",
})
