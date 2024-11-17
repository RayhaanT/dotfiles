return {
    {
        -- Jupytext
        {
            'GCBallesteros/jupytext.nvim',
            opts = {
                style = "quarto",
                output_extension = "qmd",
                force_ft = "quarto",
            },
        },
        -- Images
        {
            -- see the image.nvim readme for more information about configuring this plugin
            "3rd/image.nvim",
            dependencies = {
                'leafo/magick',
            },
            opts = {
                backend = "kitty",
                max_width = 100,
                max_height = 20,
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
                vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>",
                    { silent = true, desc = "run operator selection" })
                vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>",
                    { silent = true, desc = "re-evaluate cell" })
                vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>",
                    { silent = true, desc = "evaluate visual selection" })
                vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>",
                    { silent = true, desc = "hide output" })
                vim.keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>",
                    { silent = true, desc = "show/enter output" })

                vim.g.molten_image_provider = "image.nvim"
                vim.g.molten_output_win_max_height = 30

                vim.g.molten_auto_open_output = false
                vim.g.molten_wrap_output = true
                -- virtual "inline" text output
                vim.g.molten_virt_text_output = true
                vim.g.molten_virt_lines_off_by_1 = true
                -- Keep images out of virtual output
                vim.g.molten_image_location = "float"
            end,
        },
        -- LSP in markdown
        {
            "quarto-dev/quarto-nvim",
            dependencies = {
                "jmbuhr/otter.nvim",
            },
            config = function()
                -- Need to do this before getting the runner
                -- For some reason doesn't work to put this in opts
                local quarto = require("quarto")
                quarto.setup({
                    lspFeatures = {
                        languages = { "python" },
                        chunks = "all",
                        diagnostics = {
                            enabled = true,
                            triggers = { "BufWritePost" },
                        },
                        completion = {
                            enabled = true,
                        },
                    },
                    codeRunner = {
                        enabled = true,
                        default_method = "molten",
                    },
                })

                local runner = require("quarto.runner")
                vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
                vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
            end,
        },
        -- Only on ipynb files
        ft = { 'ipynb' },
    },
}