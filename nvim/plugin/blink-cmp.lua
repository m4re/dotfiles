require("blink.cmp").setup({
	snippets = { preset = "luasnip" },
	-- ensure you have the `snippets` source (enabled by default)
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
            lua = { inherit_defaults = true, "lazydev" }
        },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		},
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
})
