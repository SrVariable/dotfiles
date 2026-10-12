vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.foldcolumn = "2"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.inccommand = "split"
-- vim.opt.colorcolumn = "80"

vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.g.have_nerd_font = true
vim.opt.showmode = false

vim.opt.termguicolors = true

vim.opt.autochdir = true
vim.diagnostic.config({ virtual_text = false })

vim.opt.conceallevel = 0
-- vim.api.nvim_create_augroup("RestoreCursorShape", { clear = true })
-- vim.api.nvim_create_autocmd("VimLeave", {
-- 	group = "RestoreCursorShape",
-- 	command = "set guicursor=a:ver20-blinkwait400-blinkoff400-blinkon400",
-- })

vim.api.nvim_create_augroup("RestoreCursorPosition", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
	group = "RestoreCursorPosition",
	callback = function(args)
		local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line("$")
		local not_commit = vim.b[args.buf].filetype ~= "commit"

		if valid_line and not_commit then
			vim.cmd([[normal! g`"]])
		end
	end,
})

-- Oil buffers are scratch buffers deleted after cleanup_delay_ms, so the '" mark is lost;
-- keep the cursor per directory for the whole session instead.
local oil_cursor = {}
vim.api.nvim_create_autocmd("BufLeave", {
	group = "RestoreCursorPosition",
	pattern = "oil://*",
	callback = function(args)
		oil_cursor[vim.api.nvim_buf_get_name(args.buf)] = vim.api.nvim_win_get_cursor(0)
	end,
})
vim.api.nvim_create_autocmd("User", {
	group = "RestoreCursorPosition",
	pattern = "OilEnter",
	callback = function(args)
		local buf = args.data.buf
		local pos = oil_cursor[vim.api.nvim_buf_get_name(buf)]
		if not pos then
			return
		end
		-- Oil positions the cursor in a scheduled callback after rendering; run after it
		vim.schedule(function()
			if not vim.api.nvim_buf_is_valid(buf) or vim.api.nvim_get_current_buf() ~= buf then
				return
			end
			-- If Oil already jumped to an entry (e.g. going up with "-"), respect it
			if vim.api.nvim_win_get_cursor(0)[1] ~= 1 then
				return
			end
			local line = math.min(pos[1], vim.api.nvim_buf_line_count(buf))
			vim.api.nvim_win_set_cursor(0, { line, pos[2] })
		end)
	end,
})

--vim.api.nvim_create_autocmd("FileType", {
--	pattern = { "javascript", "typescript" },
--	callback = function()
--		vim.opt_local.shiftwidth = 4
--		vim.opt_local.tabstop = 4
--		vim.opt_local.softtabstop = 4
--		vim.opt_local.expandtab = true
--	end,
--})

-- To save foldings
vim.api.nvim_create_augroup("AutoView", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "AutoView",
	pattern = "*",
	command = "silent! mkview",
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = "AutoView",
	pattern = "*",
	command = "silent! loadview",
})

-- <C-c> leaves insert mode without firing InsertLeave; ModeChanged fires for every mode switch
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = { "*:[iR]*", "[iR]*:*" },
	callback = function()
		vim.opt.relativenumber = vim.v.event.new_mode:find("^[iR]") == nil
	end,
})

vim.g.python_indent = {
	open_paren = "shiftwidth()",
	nested_paren = "shiftwidth()",
	continue = "shiftwidth()",
	closed_paren_align_last_line = false,
}
