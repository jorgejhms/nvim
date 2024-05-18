local M = {}

local hi = require("mini.hipatterns")

M.setup = function()
  hi.setup({
    highlighters = {
      -- Hex color highlight (#rrggbb)
      hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
      shorthand = {
        -- taked from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/util/mini-hipatterns.lua
        pattern = "()#%x%x%x()%f[^%x%w]",
        group = function(_, _, data)
          ---@type string
          local match = data.full_match
          local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
          local hex_color = "#" .. r .. r .. g .. g .. b .. b

          return hi.compute_hex_color_group(hex_color, "bg")
        end,
        extmark_opts = { priority = 2000 },
      },
    },
  })
end

return M
