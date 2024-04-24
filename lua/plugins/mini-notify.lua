require("mini.notify").setup()
vim.notify = MiniNotify.make_notify()

-- Keyvim.keymap.sets
vim.keymap.set("n", "<Leader>mnh", "<cmd>lua MiniNotify.show_history()<CR>", { desc = "Show notification history" })
vim.keymap.set("n", "<Leader>mna", "<cmd>lua MiniNotify.get_all()<CR>", { desc = "Show all notifications" })
vim.keymap.set("n", "<Leader>mnc", "<cmd>lua MiniNotify.clear()<CR>", { desc = "Clear all notifications" })
