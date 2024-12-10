return {
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Completion engine
            {'hrsh7th/nvim-cmp'},
            -- Use words from buffer as completions sources
            {'hrsh7th/cmp-buffer'},
            -- Use filepaths as completions sources
            {'hrsh7th/cmp-path'},
            -- Use luasnip snippets as cmp source
            {'saadparwaiz1/cmp_luasnip'},
            -- Use lsp output as cmp source
            {'hrsh7th/cmp-nvim-lsp'},
            -- Cmp source for nvim Lua API
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippet engine
            {'L3MON4D3/LuaSnip'},
            -- Various snippets
            {'rafamadriz/friendly-snippets'},
        },
        config = function()
            local lsp = require('lsp-zero')

            lsp.preset('recommended')

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {'rust_analyzer', 'clangd', 'pyright', 'texlab'},
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })

            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ['<C-m>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
            })

            cmp.setup({
                mapping = cmp_mappings,
            })

            lsp.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = {
                    error = 'E',
                    warn = 'W',
                    hint = 'H',
                    info = 'I'
                }
            })

            lsp_attach = function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}

                -- Keybinds
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
            end

            -- Keybinds won't be made if buffer does not have LSP support
            lsp.on_attach(lsp_attach)

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = true,
            })
        end
    },
}
