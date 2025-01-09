vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("config-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Enable spell-checking when opening certain filetypes",
	pattern = { "text", "markdown", "plaintex" },
	callback = function()
		vim.schedule(function()
			vim.opt.spelllang = { "en_us", "de_at" }
			vim.opt.spell = true
			vim.opt.textwidth = 80
		end)
	end,
})
