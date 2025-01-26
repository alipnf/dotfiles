return {
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip").filetype_extend("javascriptreact", { "html" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
