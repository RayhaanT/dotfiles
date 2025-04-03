return {
    -- LSP install manager
    {
        'williamboman/mason.nvim',
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
        },

        config = function()
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'clangd', 'pyright', 'texlab' },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })
        end
    },

    -- Basic LSP support
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.diagnostic.config({
                virtual_text = true,
            })

            local lsp_config = require('lspconfig')
            lsp_config['ocamllsp'].setup({})

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf, remap = false }

                    -- Keybinds
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    -- vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
                end,
            })
        end,
        opts = {
            setup = {
                rust_analyzer = function()
                    return true
                end,
            },
        },
    },

    -- Completion engine
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                })
            })
        end
    },
    -- Use words from buffer as completions sources
    { 'hrsh7th/cmp-buffer' },
    -- Use filepaths as completions sources
    { 'hrsh7th/cmp-path' },
    -- Use luasnip snippets as cmp source
    { 'saadparwaiz1/cmp_luasnip' },
    -- Use lsp output as cmp source
    { 'hrsh7th/cmp-nvim-lsp' },
    -- Cmp source for nvim Lua API
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippet engine
    { 'L3MON4D3/LuaSnip' },
    -- Various snippets
    { 'rafamadriz/friendly-snippets' },
}
