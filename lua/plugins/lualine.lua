return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox"
      }
    })
  end
}
