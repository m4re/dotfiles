local gh = function(x)
	return "https://github.com/" .. x
end

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "telescope: build extensions and setup it up in order",
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if (name == "telescope-fzf-native.nvim" or name == "telescope-ui-select.nvim") and (kind == "install" or kind == "update") then
			vim.system({ 'make' }, { cwd = ev.data.path })
		end
	end,
})


vim.pack.add({ 
    { src = gh("catppuccin/nvim"), name = "catppuccin"},
    gh("nvim-tree/nvim-web-devicons"), 
    gh("nvim-lualine/lualine.nvim"),
    gh("stevearc/oil.nvim"),
    gh("folke/which-key.nvim"),
    gh("christoomey/vim-tmux-navigator"),
    { src = gh("nvim-lua/plenary.nvim") },
    { src = gh("nvim-telescope/telescope.nvim")},
    gh("nvim-telescope/telescope-fzf-native.nvim"),
    gh("nvim-telescope/telescope-ui-select.nvim"),
})
