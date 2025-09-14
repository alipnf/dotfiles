return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()

          -- Extend HTML snippets to work in JSX, TSX, Astro
          local ft_extend = require("luasnip").filetype_extend
          ft_extend("javascriptreact", { "html" })
          ft_extend("typescriptreact", { "html" })
          ft_extend("astro", { "html" })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "astro",
        "html",
        "tsx",
        "javascript",
        "typescript",
      })
    end,
  },
}
