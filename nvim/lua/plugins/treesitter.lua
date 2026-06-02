return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "rust", "python" },
            sync_install = false,
            auto_install = true,
        }

        -- Disable treesitter on opencl kernels
        vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
            pattern = "*.cl",
            callback = function(ev)
                vim.treesitter.stop(ev.buf)
            end,
        })

        -- Disable treesitter on large files (>100KB)
        vim.api.nvim_create_autocmd("BufReadPost", {
            callback = function(ev)
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
                if ok and stats and stats.size > 100 * 1024 then
                    vim.treesitter.stop(ev.buf)
                end
            end,
        })

        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
}
