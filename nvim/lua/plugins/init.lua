return {
    -- Auto pairs for '(' '[' '{'
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
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
