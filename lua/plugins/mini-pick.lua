require("mini.pick").setup()
-- Keymaps
vim.keymap.set("n", "<Leader><Leader>", "<cmd>Pick files<CR>", { desc = "[P]ick [F]iles" })
vim.keymap.set("n", "<Leader>sf", "<cmd>Pick files<CR>", { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<Leader>sk", "<cmd>Pick keymaps<CR>", { desc = "[P]ick [K]eymaps" })
vim.keymap.set("n", "<Leader>sh", "<cmd>Pick help<CR>", { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<Leader>sb", "<cmd>Pick buffers<CR>", { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<Leader>sc", "<cmd>Pick commands<CR>", { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "<Leader>sm", "<cmd>Pick marks<CR>", { desc = "[S]earch [M]arks" })
vim.keymap.set("n", "<Leader>so", "<cmd>Pick options<CR>", { desc = "[S]earch [O]ptions" })
vim.keymap.set("n", "<Leader>s.", "<cmd>Pick oldfiles<CR>", { desc = "[S]earch [R]ecent files" })
vim.keymap.set("n", "<Leader>sd", "<cmd>Pick diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<Leader>sr", "<cmd>Pick resume<CR>", { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<Leader>sg", "<cmd>Pick grep_live<CR>", { desc = "[S]earch [G]rep" })
vim.keymap.set("n", "z=", "<cmd>Pick spellsuggest<CR>", { desc = "Abre las sugerencias ortográficas" })
vim.keymap.set(
  "n",
  "<Leader>/",
  "<cmd>Pick buf_lines scope='current'<CR>",
  { desc = "[/] Fuzzily search in current buffer" }
)
vim.keymap.set("n", "<Leader>s/", "<cmd>Pick buf_lines<CR>", { desc = "[S]earch [/] in Open Files" })
