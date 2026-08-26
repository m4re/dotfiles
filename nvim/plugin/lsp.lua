vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(mode, keys, func, desc)
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("n", "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("n", "gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("v", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		vim.diagnostic.config({
			virtual_lines = true,
		})

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

local servers = {
	"clangd",
	"pyright",
	"lua_ls",
	"jdtls",
	"ts_ls",
	"vue_ls",
	"html",
	"cssls",
}

local formatters = {
	"stylua",
	"prettierd",
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = vim.tbl_extend("keep", servers, formatters),
})

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

vim.lsp.config("ts_ls", {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
