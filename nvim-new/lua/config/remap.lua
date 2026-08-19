-- This file only contains remaps specific to neovim. Remaps for plugins can be
-- found in their <config>.lua

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move!'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move!'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move!'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move!'<CR>")

-- Move higlighted text 1 line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Makes cursor stay in the middle while jumping half-page up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Make search resuts stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace currently highlighted text and send it to the void buffer instead of
-- the delete register
vim.keymap.set("n", "<leader>p", "\"_dP")

-- Copy yanked text to system clip board/y+ register
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Replace word under cursor in entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make files executable on linux
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Clear search string
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Easier navigation for vim panes
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Reformat file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
