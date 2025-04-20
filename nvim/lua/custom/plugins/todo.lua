return {
	-- Highlight todo, notes, etc in comments
	-- PERF:
	-- TODO:
	-- NOTE:
	-- HACK:
	-- FIX:
	-- WARNING:
	-- IMPORTANT:
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
			keywords = {
				NOTE = { color = "error" },
				TODO = { color = "info" },
			},
			highlight = {
				multiline = false,
				after = "",
			},
		},
	},
}
