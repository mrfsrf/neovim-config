return {
  "jay-babu/mason-null-ls.nvim",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
    -- config = function()
    --   require("mrfsrf.null-ls.config") -- require your null-ls config here (example below)
    -- end,
}
