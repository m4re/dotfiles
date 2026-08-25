return {
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vim.fn.expand("$MASON/packages")
					.. "/vue-language-server"
					.. "/node_modules/@vue/language-server",
				languages = { "vue" },
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
