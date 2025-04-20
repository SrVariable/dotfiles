return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},

		config = function()
			require("nvim-highlight-colors").setup({
				render = "background",
				-- virtual_symbol_position = "eow",
				-- virtual_symbol = "■",
				-- virtual_symbol_prefix = " [",
				-- virtual_symbol_suffix = "] ",
				enable_hex = true,
				enable_short_hex = true,
				enable_rgb = true,
				enable_hsl = true,
				enable_ansi = true,
				enable_tailwind = true,

				custom_colors = {

					{ label = "text%-primary", color = "#ed909b" },
					{ label = "bg%-primary", color = "#ed909b" },
					{ label = "text%-primary%-tint", color = "#f7b1b9" },
					{ label = "bg%-primary%-tint", color = "#f7b1b9" },
					{ label = "text%-primary%-shade", color = "#d86573" },
					{ label = "bg%-primary%-shade", color = "#d86573" },

					{ label = "text%-theme%-blue", color = "#2c519d" },
					{ label = "bg%-theme%-blue", color = "#2c519d" },
					{ label = "text%-theme%-blue%-tint", color = "#6f93d9" },
					{ label = "bg%-theme%-blue%-tint", color = "#6f93d9" },
					{ label = "text%-theme%-blue%-shade", color = "#0e2a61" },
					{ label = "bg%-theme%-blue%-shade", color = "#0e2a61" },

					{ label = "text%-theme%-yellow", color = "#dbd168" },
					{ label = "bg%-theme%-yellow", color = "#dbd168" },

					{ label = "text%-theme%-black", color = "#222222" },
					{ label = "bg%-theme%-black", color = "#222222" },

					{ label = "text%-theme%-white", color = "#dddddd" },
					{ label = "bg%-theme%-white", color = "#dddddd" },
				},
			})

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				formatting = {
					format = require("nvim-highlight-colors").format,
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),

					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),
				sources = {
					{
						name = "lazydev",
						-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
						group_index = 0,
					},
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
}
