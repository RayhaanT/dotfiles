vim.cmd.colorscheme("molokai")

local function recolor(id, color_pairs)
    vim.api.nvim_set_hl(0, id, color_pairs)
end

recolor('GitSignsAdd', {fg="#60E22E", bg="#232526"})
recolor('GitSignsDelete', {fg="#F92672", bg="#232526"})
recolor('GitSignsChange', {fg="#E6DB74", bg="#232526"})
