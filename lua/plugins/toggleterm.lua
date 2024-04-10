local Terminal = require("toggleterm.terminal").Terminal

-- Configura Lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "curved",
    title_pos = "center",
  },
})

function LazygitToggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>gg",
  "<cmd>lua LazygitToggle()<CR>",
  { desc = "Open Lazygit", noremap = true, silent = true }
)
