vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Disable highlighted text" })
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>", { desc = "Disable highlighted text" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
