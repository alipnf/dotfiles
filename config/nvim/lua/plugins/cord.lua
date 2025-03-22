return {
  "vyfor/cord.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    editor = {
      client = "1182300039712870430", -- Custom Discord Application ID untuk Valorant
      tooltip = "Playing Valorant",
    },
    text = {
      workspace = function(opts)
        return "In Game" -- Menyembunyikan nama workspace
      end,
      viewing = function(opts)
        -- Hanya menampilkan ekstensi file
        local extension = vim.fn.fnamemodify(opts.filename, ":e")
        return "Viewing *." .. extension
      end,
      editing = function(opts)
        -- Hanya menampilkan ekstensi file
        local extension = vim.fn.fnamemodify(opts.filename, ":e")
        return "Editing *." .. extension
      end,
    },
  },
}
