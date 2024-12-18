return {
    -- Telescope fuzzy finder
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fc', builtin.command_history, {})
        vim.keymap.set('n', '<leader>ff', builtin.git_files, {})

        require('telescope').setup {
            defaults = {
                -- Disable Treesitter when previewing .txt files
                preview = {
                    treesitter = false,
                },
            },
        }
    end
}
