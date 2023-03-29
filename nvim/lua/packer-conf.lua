-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    -- Telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Treesitter (Incremental AST)
    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }
    -- Auto pairs for '(' '[' '{'
    use 'jiangmiao/auto-pairs'
    -- VimTex
    use('lervag/vimtex')
    -- Molokai Theme
    use('tomasr/molokai')
    -- Status line and tabline
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    -- Monokai pro alternative theme
    use('sainnhe/sonokai')
    -- Git status line symbols/hunk tools/blame
    use('lewis6991/gitsigns.nvim')
    -- Git integration in vim
    use('tpope/vim-fugitive')
    -- Insert unicode from latex commands using <C-l>
    use('joom/latex-unicoder.vim')
    -- Two tone theme pack
    use('atelierbram/Base2Tone-vim')
    -- Better seeking with f
    use('justinmk/vim-sneak')
    -- -- Racket REPL support
    -- use 'Olical/conjure'
    -- Diffview
    use('sindrets/diffview.nvim')
    -- Window resizing
    use('simeji/winresizer')
    -- Commenting
    use('tomtom/tcomment_vim')
    -- Replace brackets and stuff
    use('tpope/vim-surround')
    -- Debugger interface
    use('mfussenegger/nvim-dap')
    -- UI for debugger
    use('rcarriga/nvim-dap-ui')
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
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
    }
    -- Robust undo history
    use('mbbill/undotree')
    -- Rust
    use('rust-lang/rust.vim')
    -- OpenCL kernel highlighting
    use('petRUShka/vim-opencl')
end)
