vim.keymap.set("n", "<leader>fs", ":NvimTreeOpen<CR>")

-- Moving selections around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quickfix navigation
vim.keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")

-- Jump to buffer using bufferline tags
vim.keymap.set("n", "ft", ":BufferLinePick<CR>", { noremap = true, silent = true })

-- Proper escaping from terminal buffers
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- New tab and close tab
vim.keymap.set("n", "<leader>nt", ":tab sp<CR>")
vim.keymap.set("n", "<leader>kt", ":tabc<CR>")

vim.g.rustfmt_autosave = 1

-- Resize windows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- lualatexing the current doc
vim.api.nvim_create_user_command(
    'Luatex',
    '!lualatex %',
    {bang = false}
)

-- disable lsp diagnostics
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })
