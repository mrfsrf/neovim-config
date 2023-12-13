-- Fuzzy Finder (files, lsp, etc)
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  -- opts = {},
  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help telescope.setup()`
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
      },
    })
  end,
}
