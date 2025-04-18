vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Disable highlighted text" })
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>", { desc = "Disable highlighted text" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>n", "<cmd>bn<CR>", { desc = "Switch to [N]ext buffer" })
vim.keymap.set("n", "<leader>p", "<cmd>bp<CR>", { desc = "Switch to [P]revious buffer" })
vim.keymap.set("n", "<leader>d", "<cmd>bd!<CR>", { desc = "[D]eletes current buffer" })
vim.keymap.set("i", "jk", "<ESC><right>", { desc = "Quit insert mode" })
