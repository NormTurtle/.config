return
  {


 { -- Easy of github issue on editor
  'pwntester/octo.nvim',
    cmd = "Octo",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require"octo".setup()
  end
},

 { "sindrets/diffview.nvim" },

}
