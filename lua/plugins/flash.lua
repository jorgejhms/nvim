-- Flash keymaps
vim.keymap.set({"n", "x", "o"}, "s", "<cmd>lua require('flash').jump() <CR>", {desc = "Flash"})
vim.keymap.set({"n", "x", "o"}, "S", "<cmd>lua require('flash').treesitter() <CR>", { desc = "Flash Treesitter"})
vim.keymap.set({"o"}, "r", "<cmd>lua require('flash').remote() <CR>", { desc = "Remote Flash"})
vim.keymap.set({"o", "x"}, "R", "<cmd>lua require('flash').treesitter_search() <CR>", { desc = "Treesitter Search"})
vim.keymap.set({"c"}, "<c-s>", "<cmd>lua require('flash').toggle() <CR>", { desc = "Toggle Flash Search"})


