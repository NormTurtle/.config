local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		-- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-b>"] = cmp.mapping.scroll_docs(4),
		["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
		["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item(cmp_select_opts)
			else
				cmp.complete()
			end
		end),
		["<C-n>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item(cmp_select_opts)
			else
				cmp.complete()
			end
		end),
		-- This are soem changed by me upper are made by lsp0zero
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		-- Safety CR
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
				else
					fallback()
				end
			end,
			s = cmp.mapping.confirm({ select = true }),
			c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		}),
	}),
})
--  ╭──────────────────╮
--  │ ChoiceNode-Popup │
--  ╰──────────────────╯

local current_nsid = vim.api.nvim_create_namespace("LuaSnipChoiceListSelections")
local current_win = nil

local function window_for_choiceNode(choiceNode)
	local buf = vim.api.nvim_create_buf(false, true)
	local buf_text = {}
	local row_selection = 0
	local row_offset = 0
	local text
	for _, node in ipairs(choiceNode.choices) do
		text = node:get_docstring()
		-- find one that is currently showing
		if node == choiceNode.active_choice then
			-- current line is starter from buffer list which is length usually
			row_selection = #buf_text
			-- finding how many lines total within a choice selection
			row_offset = #text
		end
		vim.list_extend(buf_text, text)
	end

	vim.api.nvim_buf_set_text(buf, 0, 0, 0, 0, buf_text)
	local w, h = vim.lsp.util._make_floating_popup_size(buf_text)

	-- adding highlight so we can see which one is been selected.
	local extmark = vim.api.nvim_buf_set_extmark(
		buf,
		current_nsid,
		row_selection,
		0,
		{ hl_group = "incsearch", end_line = row_selection + row_offset }
	)

	-- shows window at a beginning of choiceNode.
	local win = vim.api.nvim_open_win(buf, false, {
		relative = "win",
		width = w,
		height = h,
		bufpos = choiceNode.mark:pos_begin_end(),
		style = "minimal",
		border = "rounded",
	})

	-- return with 3 main important so we can use them again
	return { win_id = win, extmark = extmark, buf = buf }
end

function choice_popup(choiceNode)
	-- build stack for nested choiceNodes.
	if current_win then
		vim.api.nvim_win_close(current_win.win_id, true)
		vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	end
	local create_win = window_for_choiceNode(choiceNode)
	current_win = {
		win_id = create_win.win_id,
		prev = current_win,
		node = choiceNode,
		extmark = create_win.extmark,
		buf = create_win.buf,
	}
end

function update_choice_popup(choiceNode)
	vim.api.nvim_win_close(current_win.win_id, true)
	vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	local create_win = window_for_choiceNode(choiceNode)
	current_win.win_id = create_win.win_id
	current_win.extmark = create_win.extmark
	current_win.buf = create_win.buf
end

function choice_popup_close()
	vim.api.nvim_win_close(current_win.win_id, true)
	vim.api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
	-- now we are checking if we still have previous choice we were in after exit nested choice
	current_win = current_win.prev
	if current_win then
		-- reopen window further down in the stack.
		local create_win = window_for_choiceNode(current_win.node)
		current_win.win_id = create_win.win_id
		current_win.extmark = create_win.extmark
		current_win.buf = create_win.buf
	end
end

vim.cmd([[
augroup choice_popup
au!
au User LuasnipChoiceNodeEnter lua choice_popup(require("luasnip").session.event_node)
au User LuasnipChoiceNodeLeave lua choice_popup_close()
au User LuasnipChangeChoice lua update_choice_popup(require("luasnip").session.event_node)
augroup END
]])

-- Hint node-type with virtual text
local types = require("luasnip.util.types")
require("luasnip").config.setup({
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "Red" } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { "●", "Orange" } },
			},
		},
	},
})
