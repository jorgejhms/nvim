require("mini.bufremove").setup({
  keys = {
    {
      "<leader>bd",
      function()
        require("mini.bufremove").delete(0)
      end,
      desc = "Cerrar buffer",
    },
  },
})
