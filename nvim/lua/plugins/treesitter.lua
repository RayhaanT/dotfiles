return {
    -- Treesitter (Incremental AST)
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all"
            ensure_installed = { "c", "lua", "rust", "python" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,

                disable = function(lang, buf)
                    -- Disable treesitter on opencl kernels
                    local buf_name = vim.fn.expand("%")
                    if string.find(buf_name, "%.cl") then
                        return true
                    end

                    -- Disable on large files
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                additional_vim_regex_highlighting = false,
            },
        }
    end
}
