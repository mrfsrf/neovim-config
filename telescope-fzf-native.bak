-- Fuzzy Finder Algorithm which requires local dependencies to be built.
-- Only load if `make` is available. Make sure you have the system
-- requirements installed.
--
-- OR add `nvim-telescope/telescope-fzf-native.nvim` as dependency
-- to `telescope.lua`
return {
  "nvim-telescope/telescope-fzf-native.nvim",
  -- NOTE: If you are having trouble with this installation,
  --       refer to the README for telescope-fzf-native for more instructions.
  lazy = false,
  build = "make",
  cond = function()
    return vim.fn.executable("make") == 1
  end,
}
