return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      buttons = false,
      show_time = false,
      editing_text = "Ngodading",
      workspace_text = "Undefined",
    })
  end,
}
