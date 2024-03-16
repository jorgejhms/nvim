require('telescope').setup{
    pickers = {
        find_files = {
            find_command = {"rg", "-L", "--files"} --Include soft links
        }
    }
}
