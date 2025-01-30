-- Tags
vim.keymap.set("n", "gr", "<C-]")
vim.keymap.set("n", "gb", "<C-t")

-- Buffers
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>b", ":bp<CR>")
vim.keymap.set("n", "<leader>d", ":bd!<CR>")

-- Remove highlight
vim.keymap.set("n", "<C-c>", ":noh<CR>")
vim.keymap.set("n", "<ESC>", ":noh<CR>")
