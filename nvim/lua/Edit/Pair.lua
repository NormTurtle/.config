local M = {

	{ -- Brackts, Parent, quotes, Completion
		"altermo/ultimate-autopair.nvim",
		branch = "v0.6",
		event = {
			"InsertEnter",--[[  "CmdlineEnter"  ]]
		},
		keys = ":",
		config = function()
			require("ultimate-autopair").setup({})
		end,
	},

	-- { -- skip to add right arrow TAB
	-- 	"abecodes/tabout.nvim",
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = true,
	-- },
}
return M
