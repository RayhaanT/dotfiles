return {
    {
        -- Text objects
        {
            'GCBallesteros/vim-textobj-hydrogen',
            dependencies = { 'kana/vim-textobj-user' }
        },
        -- Jupytext
        {
            'goerz/jupytext.vim',
            dependencies = { 'GCBallesteros/vim-textobj-hydrogen' },
            config = function()
                -- Uses # %% to delineate chunks
                -- Necessary for text objects to work
                vim.g.jupytext_fmt = 'py:percent'
            end
        },
        -- Images
        {
            -- see the image.nvim readme for more information about configuring this plugin
            "3rd/image.nvim",
            dependencies = {
                'leafo/magick',
            },
            opts = {
                backend = "ueberzug",
                max_width = 100,
                max_height = 50,
                max_height_window_percentage = math.huge,
                max_width_window_percentage = math.huge,
                window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            },
        },
        -- REPL management
        {
            "benlubas/molten-nvim",
            version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
            dependencies = { "3rd/image.nvim" },
            build = ":UpdateRemotePlugins",
            init = function()
                vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>",
                    { silent = true, desc = "Initialize the plugin" })
                vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>",
                    { silent = true, desc = "run operator selection" })
                vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>",
                    { silent = true, desc = "evaluate line" })
                vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>",
                    { silent = true, desc = "re-evaluate cell" })
                vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>",
                    { silent = true, desc = "evaluate visual selection" })
                vim.keymap.set("n", "<leader>rd", ":MoltenDelete<CR>",
                    { silent = true, desc = "molten delete cell" })
                vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>",
                    { silent = true, desc = "hide output" })
                vim.keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>",
                    { silent = true, desc = "show/enter output" })

                vim.g.molten_image_provider = "image.nvim"
                vim.g.molten_output_win_max_height = 70
            end,
        },
        -- Only on ipynb files
        ft = { 'ipynb' },
    },
}
