local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Space for leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

return require('lazy').setup({
    -- Telescope fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    -- Treesitter (Incremental AST)
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    -- Auto pairs for '(' '[' '{'
    'jiangmiao/auto-pairs',
    -- VimTex
    'lervag/vimtex',
    -- Molokai Theme
    'tomasr/molokai',
    -- Status line and tabline
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- Monokai pro alternative theme
    'sainnhe/sonokai',
    -- Git status line symbols/hunk tools/blame
    'lewis6991/gitsigns.nvim',
    -- Git integration in vim
    'tpope/vim-fugitive',
    -- Insert unicode from latex commands using <C-l>
    'joom/latex-unicoder.vim',
    -- Two tone theme pack
    'atelierbram/Base2Tone-vim',
    -- Better seeking with f
    'justinmk/vim-sneak',
    -- -- Racket REPL support
    -- 'Olical/conjure'
    -- Diffview
    'sindrets/diffview.nvim',
    -- Window resizing
    'simeji/winresizer',
    -- Commenting
    'tomtom/tcomment_vim',
    -- Replace brackets and stuff
    'tpope/vim-surround',
    -- Debugger interface
    'mfussenegger/nvim-dap',
    -- UI for debugger
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            {'nvim-neotest/nvim-nio'},
        }
    },
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
    -- Robust undo history
    'mbbill/undotree',
    -- Rust
    'simrat39/rust-tools.nvim',
    -- OpenCL kernel highlighting
    'petRUShka/vim-opencl',
})
