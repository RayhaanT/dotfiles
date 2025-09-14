vim.opt.showmatch = true            -- show matching braces
vim.opt.ignorecase = true           -- case insensitive search
vim.opt.smartcase = true            -- case sensitive search if capital
vim.opt.hlsearch = true             -- highlight search 
vim.opt.incsearch = true            -- incremental search
vim.opt.tabstop = 4                 -- number of columns occupied by a tab 
vim.opt.softtabstop = 4             -- see multiple spaces as tabstops
vim.opt.expandtab = true            -- converts tabs to white space
vim.opt.shiftwidth = 4              -- width for autoindents
vim.opt.smartindent = true          -- indent new lines in context sensitive way
vim.opt.number = true               -- add line numbers
vim.opt.wildmode = "longest,list"   -- get bash-like tab completions
vim.opt.clipboard = "unnamedplus"   -- using system clipboard
vim.opt.cursorline = true           -- highlight current cursorline
vim.opt.ttyfast = true              -- Speed up scrolling in Vim

-- ignore binary file types
vim.opt.wildignore:append("*/bin/*,*.so,*.swp,*.zip,*.o,*.d")
-- ignore latex outputs
vim.opt.wildignore:append("*.aux,*.fdb_latexmk,*.fls,*.log,*.synctex.gz,*.xopp~,*.xopp,*.pdf,*.dvi")

-- o in a comment doesn't make the newline a comment as well
vim.opt.formatoptions:remove "o"

-- Make an undofile to store revision history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Don't write swaps and things
vim.opt.backup = false
vim.opt.writebackup = false

-- Delay between typing stop and running things like fugitive
vim.opt.updatetime = 300

-- termguicolors
vim.opt.termguicolors = true

-- syntax-sensitive folds
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false
vim.opt.foldlevel = 15

-- Stop the cursor from getting too close to screen bottom
vim.opt.scrolloff = 8

vim.cmd([[
  " Haskell-specific settings for indentation
  autocmd FileType haskell setlocal shiftwidth=4 softtabstop=4 expandtab
  autocmd FileType haskell setlocal smartindent
  let g:haskell_indent_before_where = 2
]])

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.o.swapfile = false

vim.cmd.colorscheme("PaperColor")
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", { bg = "#1c1c1c", fg = "#af005f" })
