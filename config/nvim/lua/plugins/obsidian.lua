return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "alipnf",
        path = "/home/alipnf/alipnf-obsidian",
      },
    },

    note_frontmatter_func = function(note)
      return {
        id = note.id,
        aliases = note.aliases,
        tags = note.tags,
        author = "Alipnf",
        created_at = os.date("%Y-%m-%d"),
      }
    end,
  },
}
