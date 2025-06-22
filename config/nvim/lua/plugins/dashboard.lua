return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      width = 120, -- increase dashboard width for git status
      height = 40, -- optimize dashboard height
      sections = {
        { icon = " ", title = "Keymaps", section = "keys", indent = 3, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 3, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 3, padding = 1 },
        {
          icon = " ",
          title = "Git Status",
          section = "terminal",
          cmd = "git --no-pager diff --stat -B -M -C",
          height = 6,
          padding = 1,
          indent = 3,
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
        },
        { section = "startup", padding = 1 },
      },
    },
  },
}
