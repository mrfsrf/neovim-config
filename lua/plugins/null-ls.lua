return {
	"nvimtools/none-ls.nvim",
	-- lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	init = function()
		if vim.lsp and vim.lsp.protocol and not vim.lsp._request_name_to_capability then
			vim.lsp._request_name_to_capability = vim.lsp.protocol._request_name_to_capability
		end
	end,
	opts = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions
		local completion = null_ls.builtins.completion
		local eslint_formatting = require("none-ls.formatting.eslint")
		local eslint_diagnostics = require("none-ls.diagnostics.eslint")
		local eslint_code_actions = require("none-ls.code_actions.eslint")
		local autopep8 = require("none-ls.formatting.autopep8")
		local flake8 = require("none-ls.diagnostics.flake8")
		local has_command = function(command, check_node_modules)
			return function(params)
				if vim.fn.executable(command) == 1 then
					return true
				end

				if not check_node_modules then
					return false
				end

				local root = params.root or vim.fs.root(params.bufname, { "package.json", ".git" })
				return root and vim.fn.executable(root .. "/node_modules/.bin/" .. command) == 1
			end
		end

		local has_eslint = has_command("eslint", true)

		return {
			on_attach = function(_, bufnr)
				vim.keymap.set({ "n", "v" }, "<leader>F", function()
					vim.lsp.buf.format({
						async = true,
						timeout = 2000,
					})
				end, { noremap = true, silent = true, buffer = bufnr, desc = "Format document" })
			end,
			sources = {
				formatting.stylua,
				formatting.black,
				formatting.prettier,
				autopep8,
				eslint_formatting.with({ runtime_condition = has_eslint }),
				formatting.fish_indent,
				eslint_diagnostics.with({ runtime_condition = has_eslint }),
				diagnostics.fish,
				-- diagnostics.tsc,
				eslint_code_actions.with({ runtime_condition = has_eslint }),
				code_actions.gitsigns,
				diagnostics.mypy,
				diagnostics.pylint,
				flake8,
				diagnostics.yamllint,
				completion.spell,
			},
		}
	end,
}
