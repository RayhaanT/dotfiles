return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'codedark',
                section_separators = '',
                component_separators = ''
            },
        },
    }
}

