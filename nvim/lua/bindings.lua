vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fs", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

local opts = {noremap = true, silent = true}
-- Jump to buffer using bufferline tags
vim.keymap.set("n", "gb", ":BufferLinePick<CR>", opts)

local silent = { silent = true }

vim.keymap.set("n", "gd", "<Plug>(coc-definition)", silent)
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", silent)
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", silent)
vim.keymap.set("n", "gr", "<Plug>(coc-references)", silent)
vim.keymap.set("n", "rn", "<Plug>(coc-rename)", silent)

vim.g.rustfmt_autosave = 1

vim.g.UltiSnipsExpandTrigger = "<C-SPC>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-z>"

vim.keymap.set("i", "<C-l>", "<Esc>:call unicder#start(1)<CR>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.cmd([[
let g:sneak#label = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
]])
