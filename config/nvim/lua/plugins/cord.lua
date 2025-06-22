return {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {
        editor = {
            -- client = "1182300039712870430", -- Custom Discord Application ID untuk Valorant
            tooltip = "Lazyvim",
        },
        buttons = {
            {
                label = function(opts)
                    return opts.repo_url and "View Repository" or "View Profile"
                end,
                url = function(opts)
                    return opts.repo_url or "https://github.com/alipnf"
                end,
            },
        },
    },
}
