return {
    -- Git integration in vim
    'tpope/vim-fugitive',
    config = function()
        -- Fugitive
        vim.keymap.set("n", "<Leader>g", vim.cmd.Git)
    end
}
