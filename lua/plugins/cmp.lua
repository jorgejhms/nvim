-- Aditional sources cmp
return {
  "hrsh7th/nvim-cmp",
  dependencies = { "R-nvim/cmp-r" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, { name = "cmp-r" })
  end,
}
