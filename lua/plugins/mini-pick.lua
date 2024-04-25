local map = vim.keymap.set

require("mini.pick").setup()

-- Keymaps
map("n", "<Leader><Leader>", "<cmd>Pick files<CR>", { desc = "[P]ick [F]iles" })
map("n", "<Leader>sf", "<cmd>Pick files<CR>", { desc = "[S]earch [F]iles" })
map("n", "<Leader>sk", "<cmd>Pick keymaps<CR>", { desc = "[P]ick [K]eymaps" })
map("n", "<Leader>sh", "<cmd>Pick help<CR>", { desc = "[S]earch [H]elp" })
map("n", "<Leader>sb", "<cmd>Pick buffers<CR>", { desc = "[S]earch [B]uffers" })
map("n", "<Leader>sc", "<cmd>Pick commands<CR>", { desc = "[S]earch [C]ommands" })
map("n", "<Leader>sm", "<cmd>Pick marks<CR>", { desc = "[S]earch [M]arks" })
map("n", "<Leader>so", "<cmd>Pick options<CR>", { desc = "[S]earch [O]ptions" })
map("n", "<Leader>s.", "<cmd>Pick oldfiles<CR>", { desc = "[S]earch [R]ecent files" })
map("n", "<Leader>sd", "<cmd>Pick diagnostic<CR>", { desc = "[S]earch [D]iagnostics" })
map("n", "<Leader>sr", "<cmd>Pick resume<CR>", { desc = "[S]earch [R]esume" })
map("n", "<Leader>sg", "<cmd>Pick grep_live<CR>", { desc = "[S]earch [G]rep" })
map("n", "z=", "<cmd>Pick spellsuggest<CR>", { desc = "Abre las sugerencias ortográficas" })
map("n", "<Leader>/", "<cmd>Pick buf_lines scope='current'<CR>", { desc = "[/] Fuzzily search in current buffer" })
map("n", "<Leader>s/", "<cmd>Pick buf_lines<CR>", { desc = "[S]earch [/] in Open Files" })
