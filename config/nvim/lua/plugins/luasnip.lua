return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	opts = function(_, opts)
		require("luasnip").filetype_extend("typescriptreact", { "html" })
	end,
}
