return {
    -- LSP install manager
    {
        'williamboman/mason.nvim',
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
        },
        config = function()
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'clangd', 'pyright', 'texlab' },
                automatic_enable = {
                    exclude = { 'rust_analyzer' },
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

            -- ocamllsp is installed via opam, not mason
            vim.lsp.enable('ocamllsp')

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf, remap = false }

                    local prev_diagnostic = function()
                        vim.diagnostic.jump({ count = -1 })
                    end
                    local next_diagnostic = function()
                        vim.diagnostic.jump({ count = 1 })
                    end

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gh", "<cmd>LspClangdSwitchSourceHeader<cr>", opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "[d", prev_diagnostic, opts)
                    vim.keymap.set("n", "]d", next_diagnostic, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
                end,
            })
        end,
    },

    -- Completion engine
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
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
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                })
            })
        end
    },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
