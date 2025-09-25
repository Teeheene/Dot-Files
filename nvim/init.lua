-- Configs
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.termguicolors = true
vim.o.background = "light"
vim.opt.rtp:append(vim.fn.stdpath("config") .. "/lua/plugins/strawberry")
vim.cmd("colorscheme strawberry-light")

local links = {
  ["@variable"] = "Identifier",
  ["@variable.builtin"] = "Special",
  ["@function"] = "Function",
  ["@function.builtin"] = "Special",
  ["@keyword"] = "Keyword",
  ["@keyword.function"] = "Keyword",
  ["@string"] = "String",
  ["@comment"] = "Comment",
  ["@type"] = "Type",
  ["@tag"] = "Label",
  ["@attribute"] = "PreProc",
  ["@number"] = "Number",
}

for from, to in pairs(links) do
  vim.cmd(("hi! link %s %s"):format(from, to))
end

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
  	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  	{ "nvim-lualine/lualine.nvim" },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
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
		end,
	},
	{
		"barrett-ruth/live-server.nvim",
		build = "npm install -g live-server",
  		cmd = { "LiveServerStart", "LiveServerStop" },
  		config = true,
	},
})

-- Optional plugin configs
require("lualine").setup()
require("nvim-autopairs").setup()
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
})


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

-- Optional: also toggle with Ctrl-B
vim.keymap.set("n", "<C-b>", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree with Ctrl-B" })

