return {{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"html",
			"javascript",
			"css",
			"java",
			"astro",
		},
		highlight = { enable = true },
	}
}}
