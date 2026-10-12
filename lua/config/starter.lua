-- Pantalla de inicio (mini.starter). El banner es el de la cabecera de init.lua.
local starter = require("mini.starter")

local banner = [[
     ██╗ ██████╗ ██████╗  ██████╗ ███████╗     ██╗██╗  ██╗███╗   ███╗███████╗
     ██║██╔═══██╗██╔══██╗██╔════╝ ██╔════╝     ██║██║  ██║████╗ ████║██╔════╝
     ██║██║   ██║██████╔╝██║  ███╗█████╗       ██║███████║██╔████╔██║███████╗
██   ██║██║   ██║██╔══██╗██║   ██║██╔══╝  ██   ██║██╔══██║██║╚██╔╝██║╚════██║
╚█████╔╝╚██████╔╝██║  ██║╚██████╔╝███████╗╚█████╔╝██║  ██║██║ ╚═╝ ██║███████║
 ╚════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
]]

local function banner_width()
  local width = 0
  for line in banner:gmatch("[^\n]+") do width = math.max(width, vim.fn.strdisplaywidth(line)) end
  return width
end

-- Centra un texto bajo el banner (el bloque completo lo centra el hook `aligning`)
local function under_banner(text)
  return string.rep(" ", math.floor((banner_width() - vim.fn.strdisplaywidth(text)) / 2)) .. text
end

-- Traduce el título de la sección y el mensaje de "sin elementos" de una sección de mini.starter
local function localized(section, title, empty_text)
  return function()
    local items = section()
    for _, item in ipairs(items) do
      item.section = title
      if item.action == "" then item.name = empty_text end
    end
    return items
  end
end

local function action(name, fn) return { name = name, action = fn, section = "Acciones" } end

starter.setup({
  header = banner,
  items = {
    localized(starter.sections.recent_files(6, true, false), "Archivos recientes", "No hay archivos recientes aquí"),
    localized(starter.sections.sessions(5, true), "Sesiones", "No hay sesiones guardadas"),
    action("Buscar archivos", function() vim.cmd("Pick files") end),
    action("Buscar texto", function() vim.cmd("Pick grep_live") end),
    action("Editar la configuración", function() MiniFiles.open(vim.fn.stdpath("config")) end),
    action("Actualizar plugins", function() vim.cmd("DepsUpdate") end),
    action("Nuevo buffer", function() vim.cmd("enew") end),
    action("Salir de Neovim", function() vim.cmd("qa") end),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet("» "),
    starter.gen_hook.indexing("all", { "Acciones" }),
    starter.gen_hook.aligning("center", "center"),
  },
  footer = function() return under_banner("Neovim " .. tostring(vim.version())) end,
})
