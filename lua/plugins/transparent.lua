return {
	"xiyaowong/transparent.nvim",
	opts = {},
	setup = function()
		local trasparent = require("transparent")
		trasparent.clear_prefix("lualine")
		trasparent.clear_prefix("NeoTree")
		trasparent.clear_prefix("BufferLine")
	end,
}
