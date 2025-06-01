vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Disable highlighted text" })
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>", { desc = "Disable highlighted text" })
vim.keymap.set({ "n", "v" }, "K", "<Nop>", { desc = "Disable opening man page" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>n", "<cmd>bn<CR>", { desc = "Switch to [N]ext buffer" })
vim.keymap.set("n", "<leader>p", "<cmd>bp<CR>", { desc = "Switch to [P]revious buffer" })
vim.keymap.set("n", "<leader>d", "<cmd>bd!<CR>", { desc = "[D]eletes current buffer" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>", { desc = "[T]ab [C]reate" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "[T]ab [N]ext" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<CR>", { desc = "[T]ab [P]revious" })

vim.keymap.set("i", "jk", "<ESC><right>", { desc = "Quit insert mode" })

local function create_section(title, comment_chars)
	title = title .. " Section"
	local padding = 80 - (2 * #comment_chars) - 4
	local l_padding = math.floor((padding - #title) / 2)
	local r_padding = (#title % 2 == 0) and l_padding or (l_padding + 1)

	local sep_rev = comment_chars:reverse()

	local section = comment_chars .. " @" .. string.rep("-", padding) .. "@ " .. sep_rev .. "\n"
	section = section
		.. comment_chars
		.. " |"
		.. string.rep(" ", l_padding)
		.. title
		.. string.rep(" ", r_padding)
		.. "| "
		.. sep_rev
		.. "\n"
	section = section .. comment_chars .. " @" .. string.rep("-", padding) .. "@ " .. sep_rev

	return section
end

local function choose_comment_chars(filetype)
	local comment_charss = {
		c = "//",
		cpp = "//",
		lua = "--",
		python = "#",
		sh = "#",
		vim = '"',
		javascript = "//",
		typescript = "//",
		rust = "//",
		go = "//",
		default = "#",
	}
	return comment_charss[filetype] or comment_charss.default
end

local function insert_section()
	-- Prompt for title
	vim.ui.input({ prompt = "Section title: " }, function(input)
		if not input or input == "" then
			print("Cancelled")
			return
		end

		local ft = vim.bo.filetype
		local sep = choose_comment_chars(ft)
		local section_text = create_section(input, sep)

		local row = unpack(vim.api.nvim_win_get_cursor(0))
		vim.api.nvim_buf_set_lines(0, row, row, false, vim.split(section_text, "\n"))
	end)
end

vim.keymap.set("n", "<leader>se", insert_section, { desc = "Insert Section Header" })
