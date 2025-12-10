return {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>lf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
    },
}
