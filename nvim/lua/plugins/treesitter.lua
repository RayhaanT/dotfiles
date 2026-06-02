return {
    'nvim-treesitter/nvim-treesitter',
    cmd = { "TSInstall", "TSUpdate", "TSUninstall", "TSInstallInfo" },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "rust", "python" },
            sync_install = false,
            auto_install = false,
        })
    end
}
