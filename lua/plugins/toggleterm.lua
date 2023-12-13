-- https://github.com/akinsho/toggleterm.nvim
-- A neovim plugin to persist and toggle multiple terminals during an editing session
return {
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = true,
    lazy = false
  }
  -- or
  -- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
}
