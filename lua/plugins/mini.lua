return {
  { 'echasnovski/mini.ai',      version = '*', opts = {} },
  { 'echasnovski/mini.animate', version = '*', opts = {} },
  {
    'echasnovski/mini.bufremove',
    version = '*',
    opts = {},
    keys = {
      {
        "<leader>bd",
        function()
          require('mini.bufremove').delete()
        end,
        desc = "Cerrar buffer"
      }
    }
  },
  { 'echasnovski/mini.indentscope', version = '*', opts = {} },
  { 'echasnovski/mini.pairs',       version = '*', opts = {} },
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {
      mappings = {
        add = "gsa",            -- Add surrounding in Normal and Visual modes
        delete = "gsd",         -- Delete surrounding
        find = "gsf",           -- Find surrounding (to the right)
        find_left = "gsF",      -- Find surrounding (to the left)
        highlight = "gsh",      -- Highlight surrounding
        replace = "gsr",        -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  }
}
