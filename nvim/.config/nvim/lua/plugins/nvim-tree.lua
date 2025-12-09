return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
					},
				},
			},
		})

		-- Toggle with Ctrl-B
		vim.keymap.set("n", "<C-b>", function()
			require("nvim-tree.api").tree.toggle()
		end, { desc = "Toggle NvimTree with Ctrl-B" })
	end,
}
