Vim�UnDo� ��R]��$�	v���$wo��,�F���p"[4�Q               �         .   .   .   .   )    d�8�    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             d�7    �   �   �        					backdrop = true,5��    �                    e                    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             d�7    �   �   �        							shade = 9,5��    �                                        5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             d�7     �   �   �        							shade = 1,5��    �                                        5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             d�71    �   �   �        '						highlight = { backdrop = false },5��    �                    �                    5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             d�7b    �              		event = "VeryLazy",5��                         "                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            -          �          v       d�7�    �   ,   �     �   		config = function()   			require("flash").setup({   -				-- labels = "abcdefghijklmnopqrstuvwxyz",   *				labels = "asdfghjklqwertyuiopzxcvbnm",   				search = {   "					-- search/jump in all windows   					multi_window = true,   					-- search direction   					forward = true,   >					-- when `false`, find only matches in the given direction   					wrap = true,   B					-- Each mode will take ignorecase and smartcase into account.   					-- * exact: exact match    					-- * search: regular search   					-- * fuzzy: fuzzy search   :					-- * fun(str): custom function that returns a pattern   @					--   For example, to only match at the beginning of a word:   					--   mode = function(str)   					--     return "\\<" .. str   					--   end,   					mode = "fuzzy",   					-- behave like `incsearch`   					incremental = true,   4					-- Excluded filetypes and custom window filters   					exclude = {   						"notify",   						"cmp_menu",   						"noice",   						"flash_prompt",   						function(win)   '							-- exclude non-focusable windows   <							return not vim.api.nvim_win_get_config(win).focusable   
						end,   					},   @					-- Optional trigger character that needs to be typed before   C					-- a jump label can be used. It's NOT recommended to set this,   )					-- unless you know what you're doing   					trigger = "",   B					-- max pattern length. If the pattern length is equal to this   E					-- labels will no longer be skipped. When it exceeds this length   <					-- it will either end in a jump or terminate the search   '					max_length = nil, ---@type number?   				},   				jump = {   %					-- save location in the jumplist   					jumplist = true,   					-- jump position   6					pos = "start", ---@type "start" | "end" | "range"   %					-- add pattern to search history   					history = true,   &					-- add pattern to search register   					register = false,   "					-- clear highlight after jump   7					-- automatically jump when there is only one match   					nohlsearch = false,   					autojump = true,   >					-- You can force inclusive/exclusive jumps by setting the   ?					-- `inclusive` option. By default it will be automatically   					-- set based on the mode.   '					inclusive = nil, ---@type boolean?   7					-- jump position offset. Not used for range jumps.   					-- 0: default   7					-- 1: when pos == "end" and pos < current position   "					offset = nil, ---@type number   				},   				highlight = {   					label = {   						-- allow uppercase labels   						uppercase = false,   ?						-- add a label for the first match in the current window.   ;						-- you can always jump to the first match with `<CR>`   						current = true,   '						-- show the label after the match   -						after = true, ---@type boolean|number[]   (						-- show the label before the match   /						before = false, ---@type boolean|number[]   &						-- position of the label extmark   M						style = "inline", ---@type "eol" | "overlay" | "right_align" | "inline"   O						-- flash tries to re-use labels that were already assigned to a position,   T						-- when typing more characters. By default only lower-case labels are re-used.   7						reuse = "lowercase", ---@type "lowercase" | "all"   I						-- for the current window, label targets closer to the cursor first   						distance = true,   .						-- minimum pattern length to show labels   %						-- Ignored for custom labelers.   						min_pattern_length = 0,   >						-- Enable this to use rainbow colors to highlight labels   9						-- Can be useful for visualizing Treesitter ranges.   						rainbow = {   							enabled = true,    							-- number between 1 and 9   							shade = 2,   						},   					},   -					-- show a backdrop with hl FlashBackdrop   					backdrop = false,   $					-- Highlight the search matches   					matches = true,   					-- extmark priority   					priority = 5000,   					groups = {   						match = "FlashMatch",   						current = "FlashCurrent",   !						backdrop = "FlashBackdrop",   						label = "FlashLabel",   					},   				},   .				-- action to perform when picking a label.   ;				-- defaults to the jumping logic depending on the mode.   :				---@type fun(match:Flash.Match, state:Flash.State)|nil   				action = nil,   0				-- initial pattern to use when opening flash   				pattern = "",   >				-- When `true`, flash will try to continue the last search   				continue = false,   @				-- You can override the default options for a specific mode.   >				-- Use it with `require("flash").jump({mode = "forward"})`   (				---@type table<string, Flash.Config>   				modes = {   4					-- options used when flash is activated through   (					-- a regular search with `/` or `?`   					search = {   0						enabled = true, -- enable flash for search   '						highlight = { backdrop = false },   E						jump = { history = true, register = false, nohlsearch = true },   						search = {   E							-- `forward` will be automatically set to the search direction   *							-- `mode` is always set to `search`   D							-- `incremental` is set to `true` when `incsearch` is enabled   						},   					},   4					-- options used when flash is activated through   /					-- `f`, `F`, `t`, `T`, `;` and `,` motions   					char = {   						enabled = true,   N						-- by default all keymaps are enabled, but you can disable some of them,   (						-- by removing them from the list.   .						keys = { "f", "F", "t", "T", ";", "," },   						search = { wrap = true },   &						highlight = { backdrop = true },   !						jump = { register = true },   					},   .					-- options used for treesitter selections   '					-- `require("flash").treesitter()`   					treesitter = {   ,						labels = "abcdefghijklmnopqrstuvwxyz",   						jump = { pos = "range" },   						highlight = {   A							label = { before = true, after = true, style = "inline" },   							backdrop = false,   							matches = false,   						},   					},   %					-- options used for remote flash   					remote = {   4						remote_op = { restore = true, motion = true },   					},   				},   =				-- options for the floating window that shows the prompt,   				-- for regular jumps   				prompt = {   					enabled = true,   /					prefix = { { "⚡", "FlashPromptIcon" } },   					win_config = {   						relative = "editor",   B						width = 1, -- when <=1 it's a percentage of the editor width   						height = 1,   ?						row = -1, -- when negative it's an offset from the bottom   =						col = 0, -- when negative it's an offset from the right   						zindex = 1000,   					},   				},   /				-- options for remote operator pending mode   				remote_op = {   0					-- restore window views and cursor position   &					-- after doing a remote operation   					restore = false,   :					-- For `jump.pos = "range"`, this setting is ignored.   G					-- `true`: always enter a new motion when doing a remote operation   A					-- `false`: use the window's cursor position and jump target   O					-- `nil`: act as `true` for remote windows, `false` for the current window   					motion = false,   				},   			})   		end,5��    ,       �       �       �      �            5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             d�7�     �   ,   .        		-- config = function()5��    ,                     �                    5�_�      	              �       ����                                                                                                                                                                                                                                                                                                                                                             d�7�    �   �   �        			-- end,5��    �                     �      
              5�_�                 	   �       ����                                                                                                                                                                                                                                                                                                                                                             d�7�    �   �   �              �   �   �      �   �   �      5��    �                      �              	       �    �                     �                    �    �                    �              ]       5�_�   	                �       ����                                                                                                                                                                                                                                                                                                                                                             d�8$     �   �   �              require("flash").jump({5��    �                    �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             d�8&     �   �   �              require("flash").5��    �                     �                     �    �                     �                     �    �                     �                     �    �                    �                    �    �                     �                     �    �                     �                     �    �                    �                    �    �                    �                    �    �                    �                    �    �                     �                     �    �                     �                     �    �                     �                     �    �                    �                    �    �                     �                     �    �                     �                     �    �                     �                     �    �                     �                     �    �                    �                    �    �                    �                    �    �                    �                    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             d�8*     �   �   �              require("flash").setup5��    �                     �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             d�8+     �   �   �  	    �   �   �                )�   �   �              require("flash").setup()5��    �                    �                     �    �                      �                     �    �                     �                    �    �                     �                     �    �                      �                     5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8.     �   �   �                jump({   B  search = { forward = true, wrap = false, multi_window = false },   })5��    �                      �      S               5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8/     �   �   �      �   �   �      5��    �                      �              S       5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�81     �   �   �                )5��    �                                            5�_�                    �   
    ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�83     �   �   �  	            jump({5��    �   
                  �                     5�_�                    �   
    ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�83     �   �   �  	            jump{5��    �   
                  �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�85     �   �   �  	      })5��    �                                           5�_�                    �   
    ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�86     �   �   �  	      
      jump5��    �   
                  �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�87     �   �   �  	            jump = 5��    �                     �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�88     �   �   �  	            jump = {}5��    �                     �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�89     �   �   �  	      }5��    �                                           5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8:     �   �   �           5��    �                      �                     5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8;     �   �   �                jump = {5��    �                     �                    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8;     �   �   �          B  search = { forward = true, wrap = false, multi_window = false },5��    �                     �                    5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8<     �   �   �          },5��    �                                            5�_�                     �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8>     �   �   �                require("flash").setup(5��    �                     �                    5�_�      !               �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8D     �   �   �            require("flash").setup(5��    �                     �                     �    �                    �                    �    �                     �                     5�_�       "           !   �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8G     �   �   �            require("flash").setup(5��    �                     �                     5�_�   !   #           "   �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8H     �   �   �            require("flash").setup({}5��    �                     �                     5�_�   "   $           #   �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8J     �   �   �            },�   �   �      5��    �                                           5�_�   #   %           $   �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8L     �   �   �            },}5��    �                                           5�_�   $   &           %   �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8T     �   �   �            },},5��    �                                           5�_�   %   '           &   �       ����                                                                                                                                                                                                                                                                                                                            �           �           V        d�8Y   
 �   �   �            },}5��    �                                           5�_�   &   (           '   �        ����                                                                                                                                                                                                                                                                                                                            �          �          V       d�8h    �   �   �              require("flash").setup({       jump = {   F      search = { forward = true, wrap = false, multi_window = false },       },})5��    �                      �      z               5�_�   '   )           (         ����                                                                                                                                                                                                                                                                                                                                                             d�8�     �              5��                         �#                     5�_�   (   .           )   �        ����                                                                                                                                                                                                                                                                                                                                                             d�8�    �   �   �      5��    �                      �              	       �    �                     �                    �    �                     �                     �    �                      �                     5�_�   )       ,       .   �        ����                                                                                                                                                                                                                                                                                                                                                             d�8�    �   �   �      �   �   �     	   {   $    "nvim-telescope/telescope.nvim",       optional = true,       opts = function(_, opts)   (      local function flash(prompt_bufnr)           require("flash").jump({             pattern = "^",   7          highlight = { label = { after = { 0, 0 } } },          �   �   �      �   �   �                  search = {               mode = "search",               exclude = {                 function(win)   [                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"                 end,               },             },   "          action = function(match)   ^            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)   2            picker:set_selection(match.pos[1] - 1)             end,   
        })   	      end   I      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {           mappings = {             n = { s = flash },   $          i = { ["<c-s>"] = flash },   
        },         })       end,     }5��    �                     �              �       �    �                    �               �      5�_�   )   -   *   .   ,   �        ����                                                                                                                                                                                                                                                                                                                                                             d�8�     �   �   �         5��    �                      �                     �    �                      �                     �    �                     �                     �    �                      �                     5�_�   ,               -   �        ����                                                                                                                                                                                                                                                                                                                                                             d�8�    �   �   �      �   �   �        B-- to use this, make sure to set `opts.modes.char.enabled = false`   &local Config = require("flash.config")   *local Char = require("flash.plugins.char")   2for _, motion in ipairs({ "f", "t", "F", "T" }) do   2  vim.keymap.set({ "n", "x", "o" }, motion, functi�   �   �      �   �   �     
   6  vim.keymap.set({ "n", "x", "o" }, motion, function()   &    require("flash").jump(Config.get({         mode = "char",         search = {   !        mode = Char.mode(motion),           max_length = 1,         },       }, Char.motions[motion]))     end)   end5��    �                  2   �              �       �    �   2           	      �               �       5�_�   )   +       ,   *   �        ����                                                                                                                                                                                                                                                                                                                                                             d�8�    �   �   �      �   �   �        B-- to use this, make sure to set `opts.modes.char.enabled = false`   &local Config = require("flash.config")   *local Char = require("flash.plugins.char")   2for _, motion in ipairs({ "f", "t", "F", "T" }) do   2  vim.keymap.set({ "n", "x", "o" }, motion, functi�   �   �  
    �   �   �  
   
   6  vim.keymap.set({ "n", "x", "o" }, motion, function()   &    require("flash").jump(Config.get({         mode = "char",         search = {   !        mode = Char.mode(motion),           max_length = 1,         },       }, Char.motions[motion]))     end)   end5��    �                  2   �              �       �    �   2           	      �               �       5�_�   *               +   �       ����                                                                                                                                                                                                                                                                                                                                                             d�8�     �   �   �        end,5��    �                     \!                     5�_�   	      
         �       ����                                                                                                                                                                                                                                                                                                                                                             d�7�   	 �   �   �        C  search = { forward = false, wrap = false, multi_window = false },5��    �                     �      C       D       5�_�                     �       ����                                                                                                                                                                                                                                                                                                                                                             d�8     �   �   �              require("flash").setup         ({5��    �                     �                     �    �                     �                     �    �                    �                    �    �                     �                     �    �                    �                    �    �                    �                    �    �                    �                    �    �                    �                     5�_�   	              
   �       ����                                                                                                                                                                                                                                                                                                                                                             d�7�     �   �   �         5��    �                      �                     �    �                     �                    �    �                     �                     �    �                      �                     5��