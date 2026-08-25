require("catppuccin").setup({
	flavour = "mocha",
	styles = {
		functions = { "italic" },
		keywords = { "bold" },
	},
	transparent_background = true,
})

vim.cmd.colorscheme("catppuccin-nvim")
