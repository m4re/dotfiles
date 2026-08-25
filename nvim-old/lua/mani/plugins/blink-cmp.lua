return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		config = function()
			require("luasnip").setup({
				history = true,
				region_check_events = "InsertEnter",
				delete_check_events = "TextChanged,InsertLeave",
			})
		end,
	},
	version = "1.*",
	opts = {
		snippets = { preset = "luasnip" },
		-- ensure you have the `snippets` source (enabled by default)
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },

		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
	},

	opts_extend = { "sources.default" },
}
