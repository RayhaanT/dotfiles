vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)

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
vim.keymap.set("n", "<leader>t", ":tab sp<CR>")
vim.keymap.set("n", "<leader>k", ":tabc<CR>")

vim.g.rustfmt_autosave = 1

-- Latex unicoder
vim.keymap.set("i", "<C-l>", "<Esc>:call unicder#start(1)<CR>")

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

-- swap header and source
vim.keymap.set("n", "<C-b>", function()
    if vim.bo.filetype == "cpp" then
        local hname = vim.fn.expand('%')
        print(name)
        local fh = io.open(hname, "r")
        if f ~= nil then
            io.close(fh)
            vim.cmd('edit ' .. hname)
        else
            hname = vim.fn.expand('%:r.hpp')
            vim.cmd('edit ' .. hname)
        end
    else
        local sname = vim.fn.expand('%:r.c')
    end
end)
