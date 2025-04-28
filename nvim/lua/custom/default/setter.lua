vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.wrap = false
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
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

vim.opt.conceallevel = 2

vim.api.nvim_create_augroup("RestoreCursorShape", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
	group = "RestoreCursorShape",
	command = "set guicursor=a:ver20-blinkwait400-blinkoff400-blinkon400",
})

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
