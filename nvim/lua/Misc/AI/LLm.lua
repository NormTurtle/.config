--  ╭────────────────────────╮
--  │ Multi language modele  │
--  ╰────────────────────────╯

M = {

  { -- multi language model free palm 2 api
    "gsuuon/llm.nvim",
    cmd = { "Llm", },
    config = function()
      require('llm').setup({
        default_prompt = require('llm.prompts.starters').palm,
        hl_group = 'Substitute',
      })
    end
  },

}
return M

