require('bufferline').setup {
    options = {
        mode = "tabs", -- set to "buffers" to show all buffers
        numbers = "ordinal",
        buffer_close_icon = ' ',
        modified_icon = '●',
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        show_close_icon = false,
        persist_buffer_sort = true,
        always_show_bufferline = false,
    }
}

