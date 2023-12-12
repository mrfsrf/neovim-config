return { -- Theme inspired by Atom
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false, 
  config = function()
    local gruvbox = require("gruvbox")
    gruvbox.setup({
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "soft", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
      transparent = true,
    })
    vim.cmd.colorscheme("gruvbox")
    vim.o.background = "dark"
    vim.cmd("highlight Cursor guifg=#EBDBB4")
  end,
}
