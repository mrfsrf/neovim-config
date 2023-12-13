-- Adds git releated signs to the gutter, as well as utilities for managing changes
-- https://github.com/lewis6991/gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
}
