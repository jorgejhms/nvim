return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
    keys = {
      { "<leader>o", ":Octo", desc = "Abrir octo" },
      { "<leader>p", ":Octo pr", desc = "Pull request" },
      { "<Leader>i", ":Octo issue", desc = "Issue" },
    },
  },
}
