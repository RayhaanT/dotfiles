return {
    {
        -- Better seeking
        'ggandor/leap.nvim',
        config = function()
            vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
            vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
            vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
            require('leap').add_repeat_mappings(';', ',', {
                relative_directions = true,
                modes = {'n', 'x', 'o'},
            })
        end
    }
}
