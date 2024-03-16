require('tabline').setup {
    enable = false,
    options = {
        show_tabs_always = false,
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = false, -- this appends [bufnr] to buffer section,
        show_filename_only = true, -- shows base filename only instead of relative path in filename
        modified_icon = "+ ", -- change the default modified icon
        modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
        show_tabs_only = false -- this shows only tabs instead of tabs + buffers
    }
}
vim.cmd [[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]
