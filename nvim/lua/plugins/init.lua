return {
    -- Auto pairs for '(' '[' '{'
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    -- Haskell
    'neovimhaskell/haskell-vim',
    -- VimTex
    {
        "lervag/vimtex",
        init = function()
            vim.g.vimtex_view_general_viewer = "evince"
        end
    },
    -- -- Racket REPL support
    -- 'Olical/conjure'
    -- Diffview
    'sindrets/diffview.nvim',
    -- Window resizing
    'simeji/winresizer',
    -- Commenting
    'tomtom/tcomment_vim',
    -- Explorer
    {
        'nvim-tree/nvim-tree.lua',
        config = function ()
            require("nvim-tree").setup()
        end
    }
}
