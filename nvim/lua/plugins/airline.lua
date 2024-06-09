return {
    {
        -- Status line and tabline
        'vim-airline/vim-airline',
        config = function()
            vim.g.airline_powerline_fonts = 1
            vim.g.airline_theme = 'molokai'

            vim.opt.showmode = false

            vim.g.airline_left_sep = ''
            vim.g.airline_left_alt_sep = ''
            vim.g.airline_right_sep = ''
            vim.g.airline_right_alt_sep = ''

            vim.cmd([[
            let g:airline_symbols.branch = ''
            let g:airline_symbols.readonly = ''
            let g:airline_symbols.linenr = ''
            ]])
        end
    },
    'vim-airline/vim-airline-themes',
}

