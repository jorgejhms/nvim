return { 
  'echasnovski/mini.bufremove',
  version = '*',
  config = function()
    require('mini.bufremove').setup()
  end,
  keys = {
    {
      "<leader>bd",
      function()
        require('mini.bufremove').delete()
      end,
      desc = "Cerrar buffer"
    }
  }
}
