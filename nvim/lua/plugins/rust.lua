return {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    config = function()
        vim.g.rustaceanvim = {
            server = {
                on_attach = function(client, bufnr)
                    vim.lsp.inlay_hint.enable()
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ['rust-analyzer'] = {
                    },
                },
            },
        }
    end
}
