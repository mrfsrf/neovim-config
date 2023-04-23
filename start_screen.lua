local M = {}

function M.start_screen()
  -- Clear the screen
  vim.api.nvim_command("normal! ggdG")

  -- Display the custom start screen text
  local start_text = {
    [[                                                                       ]],
    [[  ██████   █████                   █████   █████  ███                  ]],
    [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
    [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
    [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
    [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
    [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
    [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
    [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
    [[                                                                       ]],
    "Welcome to Neovim!",
    "To open a file, use :e <filename>",
    "To create a new file, use :enew",
    "For help, use :help",
    "",
    "Happy coding!",
  }

  -- Center the cursor vertically and horizontally
  local lines = vim.o.lines
  local columns = vim.o.columns
  local start_line = math.floor((lines - #start_text) / 2)

  for idx, text in ipairs(start_text) do
    local start_column = math.floor((columns - #text) / 2)
    local current_line = start_line + idx - 1
    vim.api.nvim_buf_set_lines(0, current_line, current_line, false, {text})
    vim.api.nvim_command("normal! " .. current_line + 1 .. "G" .. start_column + 1 .. "|")
  end

   -- Set the file type to prevent syntax highlighting
  vim.api.nvim_command("setfiletype text")

  -- Mark the buffer as unmodified
  vim.api.nvim_command("setlocal nomodified")
end -- /end .start_screen func

-- Automatically call the start_screen function if no file is given
vim.cmd("autocmd VimEnter * if empty(argv())")
vim.cmd("autocmd VimEnter * lua require('start_screen').start_screen()")
vim.cmd("autocmd VimEnter * endif")

return M
