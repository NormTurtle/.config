M = {
	-- this is pure magic, i love this guy
	-- lsp in floating winodow https://github.com/max397574/dyn_help.nvim
    -- for Lint https://github.com/mfussenegger/nvim-lint
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		event = "BufReadPre",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", opts = true },
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- lua lsp
					-- "stylua", -- lua Formater
					"jsonls", -- Json
					-- "jq", -- Json Formate
					"taplo", --  Toml
					"marksman", -- markdown
				},
			})
			local lsp = require("lsp-zero").preset({
				-- for CMP only
				-- manage_nvim_cmp = {
				-- 	set_extra_mappings = true,
				-- },
			})
			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({
					buffer = bufnr,
					preserve_mappings = false,
				})
			end)
			-- Sign on Column
			-- lsp.set_sign_icons({
			-- 	error = "✘",
			-- 	warn = "▲W",
			-- 	hint = "⚑H",
			-- 	info = "»I",
			-- })
			-- Automatic installl server
			-- lsp.ensure_installed({
			-- 	-- Replace these with whatever servers you want to install
			-- 	"lua_ls", -- lua lsp
			-- 	-- "stylua", -- lua Formater
			-- 	"jsonls", -- Json
			-- 	-- "jq", -- Json Formate
			-- 	"taplo", --  Toml
			-- 	"marksman", -- markdown
			-- })
			-- Format using LSp
			-- lsp.format_on_save({
			--   format_opts = {
			--     async = false,
			--     timeout_ms = 1000,
			--   },
			--   servers = {
			--     ["lua_ls"] = { "lua" },
			--     -- ["rust_analyzer"] = { "rust" },
			--     -- if you have a working setup with null-ls
			--     -- you can specify filetypes it can format.
			--     -- ['null-ls'] = {'javascript', 'typescript'},
			--   },
			-- })
			-- (Optional) Configure lua language server for neovim LUA_LS
			-- require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			lsp.setup()
		end,
	},

	-- { -- Ui Lsp
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- lines of Lsp
	-- 	event = "BufReadPost",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 		vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
	-- 	end,
	-- },
	-- some lsp ui
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {},
	},
}
return M
