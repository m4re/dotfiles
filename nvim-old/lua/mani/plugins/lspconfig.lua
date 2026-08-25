return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
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
					map(
						"n",
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
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

			local servers = {
				clangd = { capabilities = capabilities },
				pyright = { capabilities = capabilities },
				lua_ls = {
					settings = {
						capabilities = capabilities,
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
				jdtls = {},
				ts_ls = {
					capabilities = capabilities,
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
				},
				vue_ls = {
					settings = {
						vtsls = {
							tsserver = {
								globalPlugins = {
									{
										name = "@vue/typescript-plugin",
										location = vim.fn.expand("$MASON/packages")
											.. "/vue-language-server"
											.. "/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
										languages = { "vue" },
										configNamespace = "typescript",
									},
								},
							},
						},
					},
					filetypes = { "vue" },
				},
				html = {},
			}

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
				"vue_ls",
				"vtsls",
			})
			for name, server in pairs(servers) do
				vim.lsp.config(name, server)
				vim.lsp.enable(name)
			end

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			--require("mason-lspconfig").setup({
			--	handlers = {
			--		function(server_name)
			--			local server = servers[server_name] or {}
			--			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			--			require("lspconfig")[server_name].setup(server)
			--		end,
			--		glsl_analyzer = function()
			--			require("lspconfig").glsl_analyzer.setup({ capabilities = capabilities })
			--		end,
			--	},
			--})
		end,
	},
}
