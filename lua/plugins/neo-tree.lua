-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  lazy = false,
  -- event = "LazyDone",
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

