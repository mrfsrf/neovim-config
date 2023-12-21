-- Fuzzy Finder (files, lsp, etc)
return {
  {
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
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          }
        },
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
