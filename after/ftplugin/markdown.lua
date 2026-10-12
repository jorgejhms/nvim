-- Opciones específicas de markdown (se ejecuta cada vez que un buffer toma el filetype)

vim.opt_local.spell = true
vim.opt_local.spelllang = { "es", "en" }
vim.opt_local.conceallevel = 2 -- Oculta la sintaxis (**, [](), ...); alterna con <Leader>uo

-- Surround de enlaces: saiwL + enlace + <CR> agrega, sdL elimina, srLL + enlace + <CR> reemplaza
vim.b.minisurround_config = {
  custom_surroundings = {
    L = {
      input = { "%[().-()%]%(.-%)" },
      output = function()
        local link = require("mini.surround").user_input("Link: ")
        if link == nil then return nil end
        return { left = "[", right = "](" .. link .. ")" }
      end,
    },
  },
}

-- Texto centrado con un ancho máximo (ventana normal con laterales vacíos)
require("config.markdown-center").attach()
