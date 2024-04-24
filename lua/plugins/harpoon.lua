local harpoon = require("harpoon")
harpoon:setup()

-- keymap
vim.keymap.set("n", "<leader>H", function()
  harpoon:list():add()
end, { desc = "Agregar archivo (Harpoon)" })
vim.keymap.set("n", "<leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle quick menu (Harpoon)" })

-- loop 1 to 5 to set leader numberr to select file
for i = 1, 5 do
  vim.keymap.set("n", "<leader>" .. i, function()
    harpoon:list():select(i)
  end, { desc = "Abrir archivo " .. i .. " (Harpoon)" })
end
