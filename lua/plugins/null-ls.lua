return {
  'jose-elias-alvarez/null-ls.nvim',
  -- lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    return {
      on_attach = function(_, bufnr)
        vim.keymap.set({ 'n', 'v' }, '<leader>F', function()
          vim.lsp.buf.format({
            async = true,
            timeout = 2000,
          })
        end, { noremap = true, silent = true, buffer = bufnr, desc = "Format document" })
      end,
      sources = {
        formatting.stylua,
        formatting.black,
        formatting.prettier,
        formatting.autopep8,
        formatting.eslint,
        formatting.fish_indent,
        diagnostics.eslint,
        diagnostics.fish,
        -- diagnostics.tsc,
        code_actions.eslint,
        code_actions.gitsigns,
        diagnostics.mypy,
        diagnostics.pylint,
        diagnostics.flake8,
        diagnostics.yamllint,
        completion.spell
      },
    }
  end,
}
