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

-- Menú de acciones al estilo del dashboard de LazyVim: icono a la izquierda y tecla a la derecha
local actions = {
  { key = "f", icon = "\u{f002}", name = "Buscar archivos", run = function() vim.cmd("Pick files") end },
  { key = "n", icon = "\u{f15b}", name = "Archivo nuevo", run = function() vim.cmd("enew") end },
  { key = "g", icon = "\u{f031}", name = "Buscar texto", run = function() vim.cmd("Pick grep_live") end },
  { key = "r", icon = "\u{f017}", name = "Archivos recientes", run = function() vim.cmd("Pick oldfiles") end },
  { key = "c", icon = "\u{f013}", name = "Configuración", run = function() MiniFiles.open(vim.fn.stdpath("config")) end },
  { key = "u", icon = "\u{f03d7}", name = "Actualizar plugins", run = function() vim.cmd("DepsUpdate") end },
  { key = "q", icon = "\u{f011}", name = "Salir", run = function() vim.cmd("qa") end },
}

local action_items = vim.tbl_map(
  function(a) return { name = a.name, action = a.run, section = "Acciones", icon = a.icon, key = a.key } end,
  actions
)

-- Las teclas de las acciones dejan de filtrar la lista; el resto de letras y los números siguen igual
local reserved = table.concat(vim.tbl_map(function(a) return a.key end, actions))
local query_updaters = ("abcdefghijklmnopqrstuvwxyz0123456789_-."):gsub("[" .. reserved .. "]", "")

-- Centra cada bloque de contenido por separado (banner, acciones, recientes, pie) en vez de
-- todo junto: el hook `aligning` centra respecto a la línea más ancha (el banner) y deja el
-- resto pegado a su borde izquierdo en ventanas anchas.
local function center_blocks(content, buf_id)
  local win_id = vim.fn.bufwinid(buf_id)
  if win_id < 0 then return end

  local function line_width(line)
    local w = 0
    for _, unit in ipairs(line) do w = w + vim.fn.strdisplaywidth(unit.string) end
    return w
  end

  -- Un bloque es cada corrida de líneas contiguas no vacías; las vacías separan bloques
  local blocks, current = {}, nil
  for i, line in ipairs(content) do
    if line_width(line) == 0 then
      current = nil
    else
      if not current then current = { from = i, to = i } blocks[#blocks + 1] = current end
      current.to = i
    end
  end

  local win_width = vim.api.nvim_win_get_width(win_id)
  for _, block in ipairs(blocks) do
    local block_width = 0
    for i = block.from, block.to do block_width = math.max(block_width, line_width(content[i])) end
    for i = block.from, block.to do
      local pad = math.max(math.floor((win_width - block_width) / 2), 0)
      table.insert(content[i], 1, { type = "empty", string = string.rep(" ", pad) })
    end
  end

  -- Una línea vacía extra entre bloques para que el conjunto respire (de abajo hacia arriba
  -- para no invalidar los índices de los bloques aún no procesados)
  for i = #blocks, 2, -1 do table.insert(content, blocks[i].from, { { type = "empty", string = "" } }) end

  -- Centrado vertical, igual que `gen_hook.aligning`
  local bottom_space = vim.api.nvim_win_get_height(win_id) - #content
  local top_pad = math.max(math.floor(bottom_space / 2), 0)
  local top_lines = {}
  for _ = 1, top_pad do top_lines[#top_lines + 1] = { { type = "empty", string = "" } } end
  return vim.list_extend(top_lines, content)
end

-- Icono en lugar de la viñeta, tecla alineada a la derecha y sin el título de la sección de acciones
local function doom_style(content)
  local width = 0
  for _, line in ipairs(content) do
    for _, unit in ipairs(line) do
      if unit.type == "item" and unit.item.key then width = math.max(width, vim.fn.strdisplaywidth(unit.string)) end
    end
  end

  local result = {}
  for _, line in ipairs(content) do
    local is_actions_title = false
    for i, unit in ipairs(line) do
      if unit.type == "section" and unit.string == "Acciones" then is_actions_title = true end
      if unit.type == "item" and unit.item.key then
        local icon = { type = "item_bullet", string = unit.item.icon .. "   ", hl = "MiniStarterItemBullet" }
        if line[i - 1] and line[i - 1].type == "item_bullet" then line[i - 1] = icon else table.insert(line, i, icon) end
        -- Tecla en una columna fija, con aire entre el texto y la tecla
        local padding = string.rep(" ", width - vim.fn.strdisplaywidth(unit.string) + 10)
        table.insert(line, { type = "item_bullet", string = padding .. unit.item.key, hl = "Comment" })
        break
      end
    end
    if not is_actions_title then table.insert(result, line) end
  end
  return result
end

starter.setup({
  header = banner,
  items = {
    action_items,
    localized(starter.sections.recent_files(6, true, false), "Archivos recientes (carpeta actual)", "No hay archivos recientes aquí"),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet("» "),
    starter.gen_hook.indexing("all", { "Acciones" }),
    doom_style,
    center_blocks,
  },
  query_updaters = query_updaters,
  footer = function() return "Neovim " .. tostring(vim.version()) end,
})

-- Las teclas de las acciones se mapean en el buffer del inicio
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniStarterOpened",
  group = vim.api.nvim_create_augroup("jorgejhms_starter_atajos", { clear = true }),
  desc = "Atajos de una tecla en el inicio",
  callback = function(args)
    for _, a in ipairs(actions) do
      vim.keymap.set("n", a.key, a.run, { buffer = args.buf, nowait = true, desc = a.name })
    end
  end,
})

-- Sin barra de estado mientras el inicio está en pantalla (se restaura al salir del buffer)
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniStarterOpened",
  group = vim.api.nvim_create_augroup("jorgejhms_starter_sin_statusline", { clear = true }),
  desc = "Oculta la barra de estado en el inicio",
  callback = function(args)
    local buf = args.buf
    local saved = vim.o.laststatus
    vim.o.laststatus = 0
    starter.refresh(buf) -- recentra con la altura nueva

    local group = vim.api.nvim_create_augroup("jorgejhms_starter_laststatus_" .. buf, { clear = true })
    vim.api.nvim_create_autocmd("BufLeave", {
      group = group,
      buffer = buf,
      callback = function() vim.o.laststatus = saved end,
    })
    vim.api.nvim_create_autocmd("BufEnter", {
      group = group,
      buffer = buf,
      callback = function() vim.o.laststatus = 0 end,
    })
  end,
})
