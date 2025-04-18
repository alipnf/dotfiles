return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  config = function()
    require("nvim-silicon").setup({
      pad_horiz = 30,
      pad_vert = 30,
      font = "JetBrainsMono Nerd Font=34",
      theme = "Dracula",
      output = function()
        return "~/Pictures/Screenshot/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
      end,
      to_clipboard = true,
    })
  end,
}
