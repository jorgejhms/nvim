return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    pickers = {
      find_files = {
        find_command = {"rg", "-L", "--files"} --Include soft links
      }
    }
  }
}
