return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:MyHighlight",
        winblend = 0,
      },
      documentation = {
        border = "rounded",
        winhighlight = "Normal:MyHighlight",
        winblend = 0,
      },
    }
  end,
}
