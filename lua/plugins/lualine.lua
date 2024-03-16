return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    --      local navic = require("nvim-navic")
    --     local git_blame = require("gitblame")

    --    local function active_lsp()
    --     local msg = 'No Active Lsp'
    --    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    --   local clients = vim.lsp.get_active_clients()
    --  if next(clients) == nil then
    --   return msg
    --end
    --for _, client in ipairs(clients) do
    -- local filetypes = client.config.filetypes
    --if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
    -- return client.name
    --          end
    --       end
    --      return msg
    --   end

    require 'lualine'.setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = '' },
        -- component_separators = { left = '>', right = '<' },
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        -- lualine_c = {'filename',navic.get_location, cond = navic.is_available},
        -- lualine_c = { 'filename' },
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = {
          'encoding',
          'fileformat',
          'filesize',
          'progress',
        },
        lualine_y = {
          'filetype',
          --      {active_lsp,   icon = ' LSP:'}
          -- {active_lsp,   icon = ' LSP:', color = { fg = '#ffffff', gui = 'bold' }}
        },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filesize' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' },
      },
      -- winbar = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {{navic.get_location, cond = navic.is_available}},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {}
      --   },

      -- inactive_winbar = {
      --     lualine_a = {},
      --     lualine_b = {},
      --     lualine_c = {},
      --     lualine_x = {},
      --     lualine_y = {},
      --     lualine_z = {}
      --   },
      extensions = {}
    }
  end

}
