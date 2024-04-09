return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		keys = {
			{ "<leader>gg", ":LazyGit<cr>", { noremap = true, silent = true, desc = "LazyGit" } },
		},
	},
}