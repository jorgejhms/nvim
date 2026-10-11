local Terminal = require("toggleterm.terminal").Terminal
local map = vim.keymap.set

-- Config compartida para floats grandes
local float_opts = {
  border = "solid",
  title_pos = "center",
  width = function() return math.floor(vim.o.columns * 0.9) end,
  height = function() return math.floor(vim.o.lines * 0.9) end,
}

-- Lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  --TODO: Definir highlights
  float_opts = float_opts,
})

-- Vista de archivos delimitados (CSV/TSV/PSV) con csvlens
local csvlens = Terminal:new({
  cmd = "csvlens",
  hidden = true,
  direction = "float",
  float_opts = float_opts,
})

local function lazygit_toggle() lazygit:toggle() end

local function csvlens_toggle()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    vim.notify("El buffer actual no tiene archivo", vim.log.levels.WARN)
    return
  end
  if csvlens:is_open() then
    csvlens:toggle() -- solo cierra el float
  else
    -- Limpia el proceso/buffer anterior (ej. si saliste con q) y abre fresco
    -- con el archivo del buffer actual
    csvlens:shutdown()
    csvlens.cmd = "csvlens -d auto " .. vim.fn.shellescape(path)
    csvlens:toggle()
  end
end

map("n", "<leader>gg", lazygit_toggle, { desc = "Open Lazygit" })
map("n", "<leader>cv", csvlens_toggle, { desc = "Ver CSV con csvlens" })
