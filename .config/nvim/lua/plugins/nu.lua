return {
  'LhKipp/nvim-nu',
  config = function()
    require('nu').setup({
      -- options go here
      use_lsp_features = true
    })
  end,
}
