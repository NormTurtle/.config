--  ╭─────────────────────╮
--  │ lines for no reason │
--  ╰─────────────────────╯
M = {



  { -- visual Indent
    "echasnovski/mini.indentscope",
    event = "VeryLazy",
    config = function()
      require("mini.indentscope").setup({ symbol = "│" })
    end,
  },
}
return M
