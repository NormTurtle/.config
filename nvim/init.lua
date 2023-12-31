--  echo "<0_0>🗿"

-- Leader key before replace <SPACE>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- -- Calling me Lazy
require("Lazy")
-- Neovide
if vim.g.neovide then
  require("Neovide")
end

-- -- setting nvim
require("Option_s")
require("Autocmd")

-- Vimscript for things i dont't know lua
vim.cmd([[

" echom "<0_0>🗿"

 ]])
-- Command Abbreviations, I can't release my shift key fast enough :')
vim.cmd("cnoreabbrev Q  q")
vim.cmd("cnoreabbrev q1  q!")
vim.cmd("cnoreabbrev Q1  q!")
vim.cmd("cnoreabbrev Qa1 qa!")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev W  w")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")

-- if not vim.g.neovide then
--Colorscheme
-- vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none") -- Dimming | dim
-- local colorscheme = "oh-lucy"
-- local colorscheme = "oh-lucy-evening"
-- local colorscheme = "aura-dark-soft-text"
-- aura-dark, aura-dark-soft-text,aura-soft-dark,aura-soft-dark-soft-text
local colorscheme = "rose-pine"
-- local colorscheme = "tokyonight"
-- require("UI.Colors.rosepine")
-- local colorscheme = "blue-moon"
-- local colorscheme = "kanagawa-dragon"   -- kanagawa
-- local colorscheme = "kanagawa-wave"   -- kanagawa
-- local colorscheme = "catppuccin-frappe"
-- local colorscheme = "catppuccin-macchiato"
local colored, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colored then
  print("Colorscheme not found! Set to habamax") -- print error if colorscheme not installed
  vim.cmd("colorscheme habamax")
  return
end
-- Window Separator
-- vim.api.nvim_set_hl(0, 'WinSeparator', { bg = '#1f1d2e', fg = '#eb6f92' })

-- end
-- Transparancy
-- if not vim.g.neovide then -- no transparent on neovide
--  -- set transparent on startup
-- vim.api.nvim_command('highlight Normal guibg=transparent ctermbg=none')
-- -- set transparent on colorscheme change
-- function set_transparency()
--   vim.api.nvim_command('highlight Normal guibg=transparent ctermbg=none')
-- end
-- vim.cmd('autocmd ColorScheme * call v:lua.set_transparency()')
-- end

-- function set_transparency()
--   -- Set transparency for Normal text
--   vim.api.nvim_command('highlight Normal guibg=transparent ctermbg=none')
--
--   -- Set transparency for other highlight groups
--   vim.api.nvim_command('highlight NonText guibg=transparent ctermbg=none')
--   vim.api.nvim_command('highlight SignColumn guibg=transparent ctermbg=none')
--   vim.api.nvim_command('highlight VertSplit guibg=transparent ctermbg=none')
--   vim.api.nvim_command('highlight StatusLine guibg=transparent ctermbg=none')
--   vim.api.nvim_command('highlight StatusLineNC guibg=transparent ctermbg=none')
-- end
-- -- Call set_transparency() whenever a color scheme is loaded
-- vim.cmd('autocmd ColorScheme * call v:lua.set_transparency()')

--  Keymaps
-- Leader is set before Lazy
-- vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true } )
local key = vim.keymap -- for ease
vim.api.nvim_set_keymap('n', 'U', '<C-R>', { noremap = true } )

-- More text object
key.set("o", "ar", "a]") -- [r]ectangular bracket
key.set("o", "ac", "a}") -- [c]urly brace
key.set("o", "am", "aW") -- [m]assive word (= no shift needed)
key.set("o", "aq", 'a"') -- [q]uote
key.set("o", "az", "a'") -- [z]ingle quote
key.set("o", "ir", "i]")
key.set("o", "ic", "i}")
key.set("o", "im", "iW")
key.set("o", "iq", 'i"')
key.set("o", "iz", "i'")

-- Gui font resize MOUSE+CTRL
key.set("n", "<C-ScrollWheelUp>", ":set guifont=+<CR>")
key.set("n", "<C-ScrollWheelDown>", ":set guifont=-<CR>")

-- Line movement Soft wrap movement fix
-- key.set("n", "j", "gj") -- move vert by visual line
-- key.set("n", "k", "gk") -- move vert by visual line

-- go to  beginning and end , now hadnel with readline
-- key.set("i", "<C-b>", "<HOME>") -- "beginning of line"
-- key.set("i", "<C-e>", "<End>")--"end of line" },

-- navigate within  insert and cmd-lin
key.set("i", "<M-h>", "<Left>")  --"move left"
key.set("i", "<M-l>", "<Right>") -- "move right"
key.set("i", "<M-j>", "<Down>")  --  "move down"
key.set("i", "<M-k>", "<Up>")    --  "move up"

key.set("c", "<M-h>", "<Left>")  --"move left"
key.set("c", "<M-l>", "<Right>") -- "move right"
key.set("c", "<M-j>", "<Down>")  --  "move down"
key.set("c", "<M-k>", "<Up>")    --  "move up"

key.set("i", "<C-f>", "<Right>") -- forward-char
key.set("i", "<C-b>", "<Left>")  -- backward-char

key.set("c", "<C-f>", "<Right>") -- forward-char
key.set("c", "<C-b>", "<Left>")  -- backward-char

-- Manipulation in insert mode - cmd mode
key.set("i", "<C-l>", "<Del>") -- delete like <delete> key to the right
key.set("c", "<C-l>", "<Del>") -- delete like <delete> key to the right
-- key.set('i', '<C-h>', '<BS>') -- delete like <backspace> key to the left  😂 neovim has it default

-- Nvim is EMacs now
key.set("i", "<M-b>", "<S-Left>")  --"move left"
key.set("i", "<M-f>", "<S-Right>") -- "move right"

key.set("c", "<M-b>", "<S-Left>")  --"move left"
key.set("c", "<M-f>", "<S-Right>") -- "move right"

-- highlight last edited or inserted text
key.set("n", "<Esc>", ":nohl<CR>")

-- Visual mode
-- key.set("v", "p", '"_dP', opts)      -- persist yanked word, not overwrite it

-- I use neovim, btw
-- edit load vimrc bindings
key.set("n", "<leader>Lc", ":exe 'edit' stdpath('config').'/init.lua'<CR>")
key.set("n", "<leader>LL", "<cmd>Lazy<cr>")
--key.set("n", "<leader>P", ":e "$profile"<CR>")

-- Splits  & windows
key.set("n", "<leader>sh", "<C-w>v")     -- split window vert
key.set("n", "<leader>sv", "<C-w>s")     -- split window horiz
key.set("n", "<leader>se", "<C-w>=")     -- make window equal width
key.set("n", "<leader>sx", ":close<CR>") -- close current split

-- Tabs
key.set("n", "<leader>to", ":tabnew<CR>")   -- open new Tab
key.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
key.set("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
key.set("n", "<leader>tp", ":tabp<CR>")     -- go to prev tab

-- buffers
key.set("n", "<leader>q", ":q<CR>")  -- close buffer
key.set("n", "<M-q>", "<cmd>q<cr>")  -- close buffer
key.set("n", "<leader>n", ":bn<CR>") -- go to next tab
key.set("n", "<leader>p", ":bp<CR>") -- go to prev tab

-- Copy paste
-- key.set('n', '<C-s>', ':w<CR>') -- Save
key.set("v", "<C-c>", '"+y')         -- Copy
key.set("n", "<C-V>", '"+P')         -- Paste normal mode
key.set("v", "<C-v>", '"+P')         -- Paste visual mode
key.set("c", "<C-v>", "<C-R>+")      -- Paste command mode
key.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode

-- Plugin Binding
local opts = { noremap = true, silent = true } -- icon, color picker uses it as (opts,)

-- Games or Destroy
-- key.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- File Manager
-- key.set("n", "<leader>e", "<cmd>SFMToggle<CR>",{desc ="SFM Tree"} ) -- toogle exp file

-- Url
-- key.set("n", "gx", "<Cmd>VisitLinkUnderCursor<CR>", { desc = "Visit Links replace Netrw" })

-- Cy[cle]bu[ffer].
--
-- key.set("n", "<s-tab>", "<Cmd>CybuPrev<CR>",)
-- key.set("n", "<tab>", "<Cmd>CybuNext<CR>",)
-- key.set("n", "[b", "<Cmd>CybuLastusedPrev<CR>",)
-- key.set("n", "]b", "<Cmd>CybuLastusedNext<CR>",)

-- Colors
key.set("i", "<C-S>", "<CMD>PickColorInsert<CR>", opts)
-- Code manipulation

-- make custom commands
-- vim.api.nvim_create_user_command('my_custom_commadn', ':h k', { desc = 'Reload config' })

-- paste text but DONT copy the overridden text
key.set("x", "p", [["_dP]])
-- key.set("x", "<leader>p", [["+dP]])
-- delete text but DONT copy to clipboard
key.set({ "n", "v" }, "<leader>d", [["_d]])

-- move text in Visual mode
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- -_______________________
