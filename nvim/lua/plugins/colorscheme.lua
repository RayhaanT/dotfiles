return {
    {
        -- Molokai theme
        'tomasr/molokai',
        config = function()
            local function recolor(id, color_pairs)
                vim.api.nvim_set_hl(0, id, color_pairs)
            end

            -- recolor('GitSignsAdd', {fg="#60E22E", bg="#232526"})
            -- recolor('GitSignsDelete', {fg="#F92672", bg="#232526"})
            -- recolor('GitSignsChange', {fg="#E6DB74", bg="#232526"})
        end,
    },
    -- Two tone theme pack
    'atelierbram/Base2Tone-vim',
    'NLKNguyen/papercolor-theme',
    'EdenEast/nightfox.nvim',
    'ayu-theme/ayu-vim',
}

