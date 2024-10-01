local MiniDiff = require("mini.diff")
MiniDiff.setup({
  view = {
    style = "sign",
    signs = {
      add = "+",
      change = "~",
      delete = "-",
    },
  },
})

vim.keymap.set("n", "<Leader>ghp", function() MiniDiff.toggle_overlay(0) end, { desc = "Muestra diferencias en Git" })
