
-- TP Plugins
vim.keymap.set("n", "<leader>m", ":Mason<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { silent = true })

-- Github Copilot keymaps
-- vim.keymap.set("n", "<C-c>", "<Plug>(Copilot-n)", {})
-- vim.keymap.set("x", "<C-c>", "<Plug>(Copilot-x)", {})

-- Neo Tree
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.keymap.set('n', '<leader>f', ':Neotree<CR>', { silent = true })
vim.keymap.set('n', '<leader>ft', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>fs', ':Neotree float git_status<CR>', { silent = true })

-- nnoremap / :Neotree toggle current reveal_force_cwd<cr>
-- nnoremap | :Neotree reveal<cr>
-- nnoremap gd :Neotree float reveal_file=<cfile> reveal_force_cwd<cr>
-- nnoremap <leader>b :Neotree toggle show buffers right<cr>
-- nnoremap <leader>s :Neotree float git_status<cr>

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>si", require("telescope.builtin").git_files, { desc = "[G]it [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>rf", require("telescope.builtin").oldfiles, { desc = "[S]earch [R]ecent files" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
-- builtin.lsp_references({opts})
vim.keymap.set(
	"n",
	"<leader>sl",
	require("telescope.builtin").lsp_references,
	{ desc = "[S]earch [LSP]lsp_document_symbols" }
)
