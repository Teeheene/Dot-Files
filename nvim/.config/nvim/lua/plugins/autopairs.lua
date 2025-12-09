return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")

			npairs.setup()

			-- Add custom rule for pairing < > in certain filetypes
			npairs.add_rules({
				Rule("<", ">", { "html", "xml", "javascriptreact", "typescriptreact", "svelte", "vue", "markdown" })
			})

			-- Integration with nvim-cmp (safe)
			local ok, cmp = pcall(require, "cmp")
			if ok then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				filetypes = { "html", "xml", "javascriptreact", "typescriptreact" },
			})
		end,
	},
}

