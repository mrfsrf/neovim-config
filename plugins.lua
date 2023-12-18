--  You can configure plugins using the `config` key.
--  You can also configure plugins after the setup call,
--  as they will be available in your neovim runtime.
local opts = {
  defaults = {
    lazy = true, -- true, -- should plugins be lazy-loaded?
    version = nil,
    -- default `cond` you can use to globally disable a lot of plugins
    -- when running inside vscode for example
    cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
    -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "gruvbox" },
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- get a notification when changes are found
  },
}

-- Detect tabstop and shiftwidth automatically
-- 'tpope/vim-sleuth',

require("lazy").setup("plugins", opts)
