return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    opts = {
        provider = "claude",
        providers = {
            -- Default claude settings
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-7-sonnet-20250219",
                timeout = 30000, -- Timeout in milliseconds
                disable_tools = true, -- disable tools!
                extra_request_body = {
                    max_tokens = 20480,
                    temperature = 0,
                },
            },
        },
    },
    build = "make",
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
