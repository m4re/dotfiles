local gh = function(x)
	return "https://github.com/" .. x
end

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "telescope: build extensions and setup it up in order",
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if
			(name == "telescope-fzf-native.nvim" or name == "telescope-ui-select.nvim")
			and (kind == "install" or kind == "update")
		then
			vim.system({ "make" }, { cwd = ev.data.path })
		end
	end,
})

vim.pack.add({
	{ src = gh("catppuccin/nvim"), name = "catppuccin" },
	gh("nvim-tree/nvim-web-devicons"),
	gh("nvim-lualine/lualine.nvim"),
	gh("stevearc/oil.nvim"),
	--gh("refractalize/oil-git-status.nvim"),
	{ src = gh("nvim-treesitter/nvim-treesitter"), build = ":TSUpdate" },
	gh("folke/which-key.nvim"),
	gh("christoomey/vim-tmux-navigator"),
	gh("nvim-lua/plenary.nvim"),
	gh("nvim-telescope/telescope.nvim"),
	gh("nvim-telescope/telescope-fzf-native.nvim"),
	gh("nvim-telescope/telescope-ui-select.nvim"),
	gh("neovim/nvim-lspconfig"),
	gh("folke/lazydev.nvim"),
	gh("L3MON4D3/LuaSnip"),
	{ src = gh("saghen/blink.cmp"), version = "v1" },
	gh("saghen/blink.lib"),
	{ src = gh("saghen/blink.pairs"), version = vim.version.range("*") },
	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
	gh("Bilal2453/luvit-meta"),
	gh("folke/lazydev.nvim"),
	{ src = gh("mrcjkb/rustaceanvim"), version = vim.version.range("^9") },
	gh("j-hui/fidget.nvim"),
	gh("stevearc/conform.nvim"),
	gh("nvim-mini/mini.nvim"),
})

require("blink.pairs").download():pwait(60000)
