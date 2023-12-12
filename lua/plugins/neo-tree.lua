-- https://github.com/nvim-neo-tree/neo-tree.nvim
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.keymap.set('n', '<leader>f', ':Neotree<CR>', { silent = true })
vim.keymap.set('n', '<leader>ft', ':Neotree toggle<CR>', { silent = true })
--[[ vim.keymap.set('n', '<leader>wl', ':wincmd h<CR>', { silent = true }) ]]
--[[ vim.keymap.set('n', '<leader>wh', ':NeoTreeFind<CR>', { silent = true }) ]]

-- nnoremap / :Neotree toggle current reveal_force_cwd<cr>
-- nnoremap | :Neotree reveal<cr>
-- nnoremap gd :Neotree float reveal_file=<cfile> reveal_force_cwd<cr>
-- nnoremap <leader>b :Neotree toggle show buffers right<cr>
-- nnoremap <leader>s :Neotree float git_status<cr>
-- vim.keymap.set('n', '<leader>b', ':Neotree toggle show buffers right<CR>', { silent = true })

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
    }
  end,
}

