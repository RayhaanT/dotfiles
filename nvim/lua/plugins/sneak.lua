return {
    {
        -- Better seeking with f
        'justinmk/vim-sneak',
        config = function()
            vim.cmd([[ let g:sneak#label = 1 ]])
            vim.keymap.set("n", "s", "<Plug>Sneak_s")
            vim.keymap.set("n", "S", "<Plug>Sneak_S")
        end
    }
}
