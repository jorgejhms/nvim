return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"utilyre/barbecue.nvim",
			name = "barbecue",
			version = "*",
			dependencies = {
				"SmiteshP/nvim-navic",
				"nvim-tree/nvim-web-devicons", -- optional dependency
			},
			opts = {
				-- configurations go here
			},
		},
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			-- component_separators = { left = '', right = '' },
			-- component_separators = { left = '>', right = '<' },
			-- section_separators = { left = '', right = '' },
			section_separators = { left = "", right = "" },
      component_separators = { left = '', right = '' },
			-- component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
			disabled_filetypes = {},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "diff", "diagnostics" },
			lualine_x = {
				"encoding",
				"fileformat",
				"filesize",
				"progress",
			},
			lualine_y = { "filetype" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filesize" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = { "buffers" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "tabs" },
		},
	},
}
