vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)

-- Moving selections around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")

-- Jump to buffer using bufferline tags
vim.keymap.set("n", "gb", ":BufferLinePick<CR>", { noremap = true, silent = true })

-- Proper escaping from terminal buffers
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.g.rustfmt_autosave = 1

-- Latex unicoder
vim.keymap.set("i", "<C-l>", "<Esc>:call unicder#start(1)<CR>")

-- lualatexing the current doc
vim.api.nvim_create_user_command(
    'Luatex',
    '!lualatex %',
    {bang = false}
)
