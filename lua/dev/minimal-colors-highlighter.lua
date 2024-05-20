local M = {}

local hi = require("mini.hipatterns")
local mc = require("mini.colors")

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
      oklab = {
        pattern = "oklab%(%d+%.?%d*%%?%s%-?%d+%.?%d*%s%-?%d+%.?%d*%)",
        -- group = "Error",
        group = function(_, _, data)
          local match = data.full_match
          local pattern = "oklab%((%d+%.?%d*)%%?%s%-?(%d+%.?%d*)%s%-?(%d+%.?%d*)%)"
          local l, a, b = match:match(pattern)
          -- TODO: get conversion right
          l, a, b = tonumber(l * 100), tonumber(a), tonumber(b)
          print(l, a, b)
          local oklab_color = { l = l, a = a, b = b }
          local hex_color = mc.convert(oklab_color, "hex")
          print(hex_color)
          return hi.compute_hex_color_group(hex_color, "bg")
        end,
        extmark_opts = { priority = 2000 },
      },
    },
  })
end

return M
