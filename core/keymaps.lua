-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Split panes keymaps
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":split<CR>", { noremap = true, silent = true })

-- Navigate trough open buffers
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })
-- Fine cmd line
vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

-- Close
vim.keymap.set("n", "<Leader>Q", ":close<CR>", { noremap = true, silent = true })

-- Save file
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true })

-- Move line up/down
vim.keymap.set("n", "<A-Up>", ":m-2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", ":m+<CR>", { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- [[ Terminal setup ]]
local terminal_toggle = 0

function _G.toggle_terminal()
  if terminal_toggle == 0 then
    vim.cmd("botright split term://" .. vim.env.SHELL)
    vim.cmd("set nobuflisted")
    vim.cmd("set nornu")
    vim.cmd("set nonu")
    terminal_toggle = 1
  else
    vim.cmd("close")
    terminal_toggle = 0
  end
  -- Ensure that the terminal buffer is in focus
  vim.cmd("startinsert")
end
--
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

vim.keymap.set("n", "<leader>t", ":lua _G.toggle_terminal()<CR>", { noremap = true, silent = true })

-- run python scripts
vim.keymap.set("n", "<leader>!", ":!python3 %<CR>", { noremap = true, silent = true })
