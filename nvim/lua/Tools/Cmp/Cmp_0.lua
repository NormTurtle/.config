M = {

	{ --  Completion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippets
			"VonHeikemen/lsp-zero.nvim",
			{ "L3MON4D3/LuaSnip", version = "2.*", dependencies = "rafamadriz/friendly-snippets" },
			"saadparwaiz1/cmp_luasnip", -- Luasnip source for cmp
			"onsails/lspkind.nvim", -- icon on Completion
			-- Text
			"f3fora/cmp-spell", -- spelling is bad 😔
			"hrsh7th/cmp-buffer", -- suggestion form current file
			"hrsh7th/cmp-emoji", -- super use : : emojie in colon
			"hrsh7th/cmp-nvim-lsp", -- cmp form LSP idk?
			"lukas-reineke/cmp-rg", -- Ripgrep
			{ "tzachar/cmp-fuzzy-buffer", dependencies = "tzachar/fuzzy.nvim" },
			-- { "tzachar/cmp-fuzzy-path", dependencies = "tzachar/fuzzy.nvim" }, -- Fuzzy path search
			-- Path
			-- 			-- "FelipeLema/cmp-async-path", -- // paths cmp
			"hrsh7th/cmp-path", -- paths //
			-- 			-- 'dmitmel/cmp-digraphs',
		},
		config = function()
			require("Tools.Cmp.Lua_snip") -- Maping are in Lua_snip
			local cmp = require("cmp")
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end
			cmp.setup({
				experimental = {
					ghost_text = true,
				},

				view = {
					entries = "native", -- can be "custom", "wildmenu" or "native"
					-- entries = { name = "custom", selection_order = "near_cursor" },
				},
				snippet = {
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require("snippy").expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
					documentation = {
						max_height = 15,
						max_width = 60,
					},
				},
				formatting = {
					fields = { "abbr", "menu", "kind" },
					format = function(entry, item)
						local short_name = {
							nvim_lsp = "LSP",
							nvim_lua = "nvim",
						}
						local menu_name = short_name[entry.source.name] or entry.source.name
						item.menu = string.format("[%s]", menu_name)
						return item
					end,
				},
				sources = cmp.config.sources({
					-- { name = "snippy" }, -- For snippy users.
					{ name = "nvim_lsp" },
					-- { name = 'vsnip' }, -- For vsnip users.
					-- { name = "luasnip" }, -- For luasnip users.
					{ name = "luasnip", option = { show_autosnippets = true } },
					-- { name = 'luasnip_choice' },
					-- { name = 'ultisnips' }, -- For ultisnips users.
				}, {
					{ name = "buffer" },
					{ name = "spell" },
					{ name = "emoji" },
					{ name = "rg" },
					{ name = "fuzzy_buffer" },
					-- { name = 'async_path' },
					-- {  name = "path", },
					{ name = "fuzzy_path", option = { fd_timeout_msec = 1500 } },

					-- { name = 'digraphs' }, --
					{ name = "neorg" },
				}),
			})

			-- Adding icons
			local lspkind = require("lspkind")
			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations text', 'text_symbol', 'symbol_text', 'symbol'
						maxwidth = 40, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						menu = {
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							rg = "[RipG]",
							-- nvim_lua = "[Lua]",
							buffer = "[Buf]",
							emoji = "[Emoji]",
							spell = "[Spell]",
							path = "[Path]",
							neorg = "[Neorg]",
							-- snippy = "[Snippy]",
							-- fuzzy_path = "[Fz_path]",
							-- latex_symbols = "[Latex]",
						},
						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							return vim_item
						end,
					}),
				},
			})
		end,
	},
}

return M
