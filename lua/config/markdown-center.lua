-- Centra el texto markdown con un ancho máximo usando ventanas vacías a los lados
-- (como no-neck-pain). La ventana markdown sigue siendo una ventana normal.
-- Solo actúa cuando es la única ventana normal de la pestaña y hay espacio para los laterales.
local M = {}

local WIDTH = 80 -- columnas editables
local MIN_SIDE = 4 -- ancho mínimo de cada lateral; si no cabe, no se centra
local SEPARATORS = 2 -- una columna de separador por cada lateral

local updating = false

local function is_centerable(win)
  local buf = vim.api.nvim_win_get_buf(win)
  return vim.bo[buf].filetype == "markdown" and vim.bo[buf].buftype == ""
end

-- Ventanas normales de la pestaña: la principal(es) y los laterales (sin flotantes)
local function tab_windows(tab)
  local normal, sides = {}, {}
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
    if vim.api.nvim_win_get_config(win).relative == "" then
      table.insert(vim.w[win].markdown_center_side and sides or normal, win)
    end
  end
  return normal, sides
end

local function close_sides(sides)
  for _, side in ipairs(sides) do
    local main = vim.w[side].markdown_center_main
    -- El separador derecho de la principal es de ella: se restaura lo que tenía
    if main and vim.api.nvim_win_is_valid(main) and vim.w[main].markdown_center_fillchars ~= nil then
      vim.wo[main].fillchars = vim.w[main].markdown_center_fillchars
      vim.w[main].markdown_center_fillchars = nil
    end
    pcall(vim.api.nvim_win_close, side, true)
  end
end

local function new_side(position, main)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype = "markdown-center"
  local win = vim.api.nvim_open_win(buf, false, { split = position, win = -1, width = MIN_SIDE, noautocmd = true })
  vim.w[win].markdown_center_side = true
  vim.w[win].markdown_center_main = main
  local wo = vim.wo[win]
  wo.winfixwidth = true
  wo.number, wo.relativenumber, wo.cursorline, wo.list = false, false, false, false
  wo.signcolumn, wo.foldcolumn, wo.colorcolumn = "no", "0", ""
  wo.fillchars = "eob: ,vert: "
  return win
end

local function resize_sides(main, left, right)
  local text_width = WIDTH + vim.fn.getwininfo(main)[1].textoff
  local sides_total = vim.o.columns - text_width - SEPARATORS
  local left_width = math.floor(sides_total / 2)
  vim.api.nvim_win_set_width(left, left_width)
  vim.api.nvim_win_set_width(right, sides_total - left_width)
end

local function update_tab()
  local tab = vim.api.nvim_get_current_tabpage()
  local normal, sides = tab_windows(tab)
  local main = normal[1]

  local fits = false
  if #normal == 1 and is_centerable(main) then
    local text_width = WIDTH + vim.fn.getwininfo(main)[1].textoff
    fits = vim.o.columns - text_width - SEPARATORS >= 2 * MIN_SIDE
  end

  if not fits then
    if #sides > 0 then close_sides(sides) end
    return
  end

  if #sides ~= 2 or vim.w[sides[1]].markdown_center_main ~= main then
    close_sides(sides)
    if vim.w[main].markdown_center_fillchars == nil then
      vim.w[main].markdown_center_fillchars = vim.api.nvim_get_option_value("fillchars", { win = main, scope = "local" })
    end
    vim.wo[main].fillchars = vim.go.fillchars .. ",vert: "
    local left = new_side("left", main)
    local right = new_side("right", main)
    sides = { left, right }
  end
  resize_sides(main, sides[1], sides[2])
end

function M.update()
  if updating then return end
  updating = true
  local ok, err = pcall(update_tab)
  updating = false
  if not ok then vim.notify("markdown-center: " .. tostring(err), vim.log.levels.ERROR) end
end

-- Quita los laterales de todas las pestañas (p. ej. antes de guardar una sesión)
function M.close_all()
  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    local _, sides = tab_windows(tab)
    close_sides(sides)
  end
end

local attached = false

-- Se llama desde after/ftplugin/markdown.lua; los autocmds son globales porque la
-- decisión depende de todas las ventanas de la pestaña
function M.attach()
  if not attached then
    attached = true
    local group = vim.api.nvim_create_augroup("jorgejhms_markdown_center", { clear = true })
    local schedule_update = function() vim.schedule(M.update) end

    vim.api.nvim_create_autocmd(
      { "WinEnter", "WinClosed", "BufWinEnter", "TabEnter", "VimResized", "FileType" },
      { group = group, callback = schedule_update, desc = "Centra el texto markdown" }
    )

    -- Los laterales no son para editar: si se entra a uno se vuelve a la ventana principal
    vim.api.nvim_create_autocmd("WinEnter", {
      group = group,
      callback = function()
        local main = vim.w.markdown_center_side and vim.w.markdown_center_main
        if main and vim.api.nvim_win_is_valid(main) then vim.api.nvim_set_current_win(main) end
      end,
      desc = "Evita quedarse en un lateral del centrado markdown",
    })

    -- Con :q en la ventana principal los laterales impedirían salir de Neovim
    vim.api.nvim_create_autocmd("QuitPre", {
      group = group,
      callback = function()
        local normal, sides = tab_windows(vim.api.nvim_get_current_tabpage())
        if #normal == 1 then close_sides(sides) end
      end,
      desc = "Cierra los laterales del centrado markdown al salir",
    })
  end
  M.update()
end

return M
