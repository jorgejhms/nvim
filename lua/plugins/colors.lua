local add = MiniDeps.add

-- Opciones adicionales dracula
require("dracula").setup({
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    sidebars = "dark",
  },
  floats = "transparent",
})

-- cyberdream
require("cyberdream").setup({
  -- Recommended - see "Configuring" below for more config options
  transparent = true,
  italic_comments = true,
  hide_fillchars = true,
  borderless_telescope = true,
  terminal_colors = true,
})

-- catppuccin
require("catppuccin").setup({
  transparent_background = false, -- disables setting the background color.
  integrations = {
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
})

-- El esquema sigue a 'background': Neovim lo actualiza según el tema de la terminal
-- (y lo cambia <Leader>ub), igual que Zed con Dracula / Catppuccin Latte.
local scheme_by_background = { dark = "dracula", light = "catppuccin-latte" }

local function apply_scheme()
  local scheme = scheme_by_background[vim.o.background]
  if vim.g.colors_name ~= scheme then vim.cmd.colorscheme(scheme) end
end

vim.api.nvim_create_autocmd("OptionSet", {
  group = vim.api.nvim_create_augroup("jorgejhms_scheme_by_background", { clear = true }),
  pattern = "background",
  callback = apply_scheme,
  desc = "Cambia de esquema al cambiar 'background'",
})

apply_scheme()
