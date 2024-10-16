require("lazy").setup({
	require("mani/plugins/autopairs"),

	require("mani/plugins/catppuccin"),

	require("mani/plugins/tokyonight"),

	require("mani/plugins/telescope"),

	require("mani/plugins/treesitter"),

	require("mani/plugins/harpoon"),

	require("mani/plugins/oil"),

	require("mani/plugins/oil-git-status"),

	require("mani/plugins/fugitive"),

	require("mani/plugins/lspconfig"),

	require("mani/plugins/cmp"),

	require("mani/plugins/debug"),

	require("mani/plugins/lint"),

	require("mani/plugins/undotree"),

	require("mani/plugins/indentline"),

	require("mani/plugins/lualine"),

	require("mani/plugins/mini"),

	require("mani/plugins/vim-tmux-navigator"),

	require("mani/plugins/which-key"),

	require("mani/plugins/gitsigns"),

	require("mani/plugins/conform"),

	require("mani/plugins/rustacean"),

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
