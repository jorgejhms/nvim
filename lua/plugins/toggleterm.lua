local Terminal = require("toggleterm.terminal").Terminal

-- Configura Lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  -- display_name = "Lazygit",
  hidden = true,
  direction = "float",
  --TODO: Definir highlights
  float_opts = {
    border = "solid",
    title_pos = "center",
    width = function() return math.floor(vim.o.columns * 0.9) end,
    height = function() return math.floor(vim.o.lines * 0.9) end,
  },
})

function LazygitToggle() lazygit:toggle() end

vim.api.nvim_set_keymap(
  "n",
  "<leader>gg",
  "<cmd>lua LazygitToggle()<CR>",
  { desc = "Open Lazygit", noremap = true, silent = true }
)
