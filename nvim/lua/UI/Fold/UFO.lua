vim.o.foldenable = true -- enable fold for nvim-ufo
vim.o.foldlevel = 99 -- set high foldlevel for nvim-ufo
vim.o.foldlevelstart = 99 -- start with all code unfolded
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]


-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- Improved Code Folding
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Fold less" })
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Fold more" })
vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek fold" })
-- Again with <TABS>
-- vim.keymap.set('n', '<Tab>', require('ufo').openAllFolds)
-- vim.keymap.set('n', '<S-Tab>', require('ufo').closeAllFolds)

-- -- Option 2: nvim lsp as LSP client
-- -- Tell the server the capability of foldingRange,
-- -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true
-- }
-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities
--         -- you can add other fields for setting up lsp server in this table
--     })
-- end
-- require('ufo').setup()
-- --
--
-- -- Option 3: treesitter as a main provider instead
-- -- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
-- use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return {'treesitter', 'indent'}
--     end
-- })
-- -- --
-- --
-- -- -- Option 4: disable all providers for all buffers
-- -- -- Not recommend, AFAIK, the ufo's providers are the best performance in Neovim
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return ''
    end
})
