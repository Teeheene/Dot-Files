return {
    "mattn/emmet-vim",
    event = "VeryLazy",
    config = function()
        -- Set leader key (won't be used, but plugin requires it)
        vim.g.user_emmet_leader_key = '<C-y>'
        vim.g.user_emmet_settings = {
            javascript = {
                extends = 'jsx',
            },
        }
        
        -- Map Ctrl+E to emmet expand
        vim.keymap.set("i", "<C-e>", "<plug>(emmet-expand-abbr)", {})
        vim.keymap.set("n", "<C-e>", "<plug>(emmet-expand-abbr)", {})
    end,
}
