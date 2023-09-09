local M = {

	{ -- Brackts, Parent, quotes, Completion
		"altermo/ultimate-autopair.nvim",
		branch = "v0.6",
		event = {
			"InsertEnter",--[[  "CmdlineEnter"  ]]
		},
		keys = { ":" },
		config = function()
			require("ultimate-autopair").setup({})
		end,
	},

	-- { -- skip to add right arrow TAB
	-- 	"abecodes/tabout.nvim",
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = function()
	-- 		require("tabout").setup({})
	-- 		vim.api.nvim_set_keymap("i", "<A-x>", "<Plug>(TaboutMulti)", { silent = true })
	-- 		vim.api.nvim_set_keymap("i", "<A-z>", "<Plug>(TaboutBackMulti)", { silent = true })
	-- 	end,
	-- 	-- config = true,
	-- },
}

return M
