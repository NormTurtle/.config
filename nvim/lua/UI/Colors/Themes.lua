return {
	-- -- Themes Mangager
	-- { 'zaldih/themery.nvim',
	--   cmd = "Themery",
	--   -- config = function() require('tsst') end
	-- },

	--Theme
	"rebelot/kanagawa.nvim", -- inspired of gruv+dracula
	{
		"techtuner/aura-neovim", -- aura theme
		event = "ColorScheme",
	},
	"Yazeed1s/oh-lucy.nvim",
	-- 'kyazdani42/blue-moon',
	-- 'voidekh/kyotonight.vim',
	-- { 'catppuccin/nvim', name = "catppuccin",},
	{ "rose-pine/neovim", name = "rose-pine" },
	-- { "kyazdani42/blue-moon" }, -- hurt blule eye
	-- "dotsilas/darcubox-nvim",
	-- -- My Beloved dark somber,stern shit
	-- 'huyvohcmc/atlas.vim', -- very minimal no code highlight 🗿
	-- "ntk148v/komau.vim", -- a Chocolatel like color scheme
	-- 'nikolvs/vim-sunbather', -- pink monochorome colorscheme
	-- { "jesseleite/nvim-noirbuddy", dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" } }, -- hot pink
}

-- {
--   Default theme if no applied
--   'kyazdani42/blue-moon',
--   version = false,
--   lazy = false,
--   priority = 1000,
--   make sure to load this before all the other start plugins config = function() require("blue-moon").setup()end,
-- },

-- some better highlight for Diagnostics
-- local c = variants[cfg.variant]
-- -- Diagnostics
-- { hg = "DiagnosticError",             fg = c.red },
-- { hg = "DiagnosticWarn",              fg = c.yellow },
-- { hg = "DiagnosticInfo",              fg = c.cyan },
-- { hg = "DiagnosticHint",              fg = c.gray05 },
-- { hg = "DiagnosticUnderlineError",    gui = "undercurl",  guisp = c.red },
-- { hg = "DiagnosticUnderlineWarn",     gui = "undercurl",  guisp = c.yellow },
-- { hg = "DiagnosticUnderlineInfo",     gui = "undercurl",  guisp = c.cyan },
-- { hg = "DiagnosticUnderlineHint",     gui = "undercurl",  guisp = c.cyan },
--
