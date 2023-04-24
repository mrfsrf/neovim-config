local M = {}

function M.start_screen()
  -- Clear the screen
  vim.api.nvim_command("normal! ggdG")

  -- Display the custom start screen text

  local start_text = [[

      ██████   █████                   █████   █████  ███                  
     ░░██████ ░░███                   ░░███   ░░███  ░░░                   
      ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   
      ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  
      ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  
      ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  
      █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ 
     ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  
                                                                            
    Welcome to Neovim!
    To open a file, use :e <filename>
    To create a new file, use :enew
    For help, use :help

    Happy coding!
  ]]

  local lines_table = {}
  for line in string.gmatch(start_text, '([^\n]+)\n') do
    table.insert(lines_table, line)
  end

  for idx, text in ipairs(lines_table) do
    local current_line = idx
    vim.api.nvim_buf_set_lines(0, current_line, current_line, false, {text})
    vim.api.nvim_command("normal! " .. current_line + 1 .. "G0|")
  end
   -- Set the file type to prevent syntax highlighting
  vim.api.nvim_command("setfiletype text")

  -- Mark the buffer as unmodified
  vim.api.nvim_command("setlocal nomodified")

  -- Add key mapping for "i" to create new file
  vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<ESC>:enew<CR>", {noremap = true, silent = true})

end -- /end .start_screen func

-- Automatically call the start_screen function if no file is given
vim.cmd("autocmd VimEnter * if empty(argv())")
vim.cmd("autocmd VimEnter * lua require('start_screen').start_screen()")
vim.cmd("autocmd VimEnter * endif")

return M
