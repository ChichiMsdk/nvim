--[[
vim.g.SelectedLine = ""

local function update_file_with_fav(filepath, selected_line)
  local lines = ReadLinesFromFile(filepath)

  if lines[1] and lines[1]:match("^%[FAV%]") then
    -- Remove the previous "[FAV]" line
    table.remove(lines, 1)
  end

  -- Add the selected line to the top with a "[FAV]" tag
  table.insert(lines, 1, "[FAV] " .. selected_line)

  -- Save the updated lines back to the file
  WriteLinesToFile(filepath, lines)
end

function GetTableLng(tbl)
  local getN = 0
  for n in pairs(tbl) do 
    getN = getN + 1 
  end
  return getN
end

function WriteLinesToFile(filepath, lines)
  local file = io.open(filepath, "w")
  if file then
    for _, line in ipairs(lines) do
      file:write(line .. "\n")
    end
    file:close()
  else
    print("Error: Could not open file for writing: " .. filepath)
  end
end

function ReadLinesFromFile(filepath)
  local lines = {}
  for line in io.lines(filepath) do
    table.insert(lines, line)
  end
  return lines
end

local function SelectLine(buf, callback)
  -- Get the cursor's current position
  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(buf, line_number - 1, line_number, false)[1]
  -- Close the floating window
  vim.api.nvim_win_close(0, true)
  -- Call the callback function with the selected line
  callback(line)
end

local function CreateFloatWindow(lines)
  local buf = vim.api.nvim_create_buf(false, false)  -- Create a new buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)  -- Set lines to buffer
  vim.api.nvim_bufer_set_options(buf, 'modifiable', true)
  vim.api.nvim_bufer_set_options(buf, 'bufhidden', wipe)

  -- Define the window dimensions and position
  local width = vim.api.nvim_get_option("columns")
  local ypos = vim.api.nvim_get_option("lines")
  local height = GetTableLng(lines)
  local win_width = math.ceil(width * 0.5)
  local win_height = math.ceil(height * 0.5)
  if win_height < 5 then
	  win_height = 5
  end
  local row = math.ceil((ypos - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  -- Configure the window
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded",
  }
  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, opts)

  return buf, win
end

local function SetupKeyMappings(buf, callback)
  vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', '', {
    noremap = true,
    silent = true,
    callback = function() SelectLine(buf, callback) end
  })
end

local function ShowFileLines(filepath)
  local lines = ReadLinesFromFile(filepath)

  -- Create a new buffer that is modifiable
  local buf = vim.api.nvim_create_buf(false, false)  -- false for scratch buffer, false for listed buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)  -- Load the file lines into the buffer
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')  -- Wipe the buffer on close

  -- Create a floating window with the buffer
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")
  local win_width = math.ceil(width * 0.5)
  local win_height = math.ceil(height * 0.5)
  local row = math.ceil((height - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Set up an autocommand to save changes to the file when the buffer is saved or closed
  vim.api.nvim_create_autocmd({"BufWritePost", "BufUnload"}, {
    buffer = buf,
    callback = function()
      -- Get the modified lines from the buffer
      local modified_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      -- Write them back to the file
      WriteLinesToFile(filepath, modified_lines)
      print("File updated: " .. filepath)
    end
  })
end

--[[
function ShowFileLines(filepath)

  local lines = ReadLinesFromFile(filepath)
  local buf, win = CreateFloatWindow(lines)

  -- Callback function when a line is selected
  local function on_line_selected(line)
	vim.g.SelectedLine = line
    print("Selected Line: " .. vim.g.SelectedLine)  -- Do something with the selected line here
	update_file_with_fav(filepath, line)
  end

  -- Set up key mappings
  SetupKeyMappings(buf, on_line_selected)
end
--]]

vim.keymap.set("n", "<leader>zz", ':lua ShowFileLines("testfile")<CR>', { desc = "Command to scratch buffer" })

function ShowMe()
	print("Selected line: " .. (vim.g.SelectedLine or "None"))
end
vim.keymap.set("n", "<leader>zp", ':lua ShowMe()<CR>', { desc = "Command to scratch buffer" })
--]]
