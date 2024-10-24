require("base.myharpoon.utils")

function update_file_with_fav(filepath, selected_line)
	local lines = read_lines_from_file(filepath)
	if not lines then return end

	if selected_line then
		selected_line = string.gsub(selected_line, '[ \t]+%f[\r\n%z]', '')
	end
	if not selected_line or string.len(selected_line) <= 1 then
		return
	end
	local nbLine = tableLength(lines)
	for i = 0, nbLine + 1 do
		if lines[i] and string.sub(lines[i], 1, 7) == "[FAV]->" then
			table.remove(lines, i)
		end
	end
	table.insert(lines, 1, "[FAV]->" .. selected_line)
	write_lines_to_file(filepath, lines)
end

local function on_line_selected(filepath, line)
	if line and string.sub(line, 1, 7) ~= "[FAV]->" then
		-- print("Selected Line: " .. line)
		update_file_with_fav(filepath, line)
		if string.find(filepath, "/.cmds") then
			vim.g.CmdLine = line
		else if string.find(filepath, "/.make") then
			vim.g.MakeLine = line
		end
	end
end
end

-- Function to create a floating window with an editable buffer linked to the file
function show_file_lines(filepath)
	filepath = vim.fn.getcwd() .. '/' .. filepath
	local lines = read_lines_from_file(filepath)
	local win_id, buf = create_window()
	if lines then
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		highlight_fav_lines(buf)
	end

	vim.api.nvim_create_autocmd({"BufWriteCmd", "BufLeave", "BufWritePost", "BufUnload"}, {
		buffer = buf,
		callback = function()
			local modified_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
			write_lines_to_file(filepath, modified_lines)
			-- print("File updated: " .. filepath)
		end
	})
	vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', '',
	{ noremap = true, silent = true, callback = function() select_line(filepath, buf, on_line_selected) end })
end

function select_line(filepath, buf, callback)
	local line_number = vim.api.nvim_win_get_cursor(0)[1]
	local line = vim.api.nvim_buf_get_lines(buf, line_number - 1, line_number, false)[1]
	vim.api.nvim_win_close(0, true)
	if line then
		callback(filepath, line)
	end
end

vim.api.nvim_set_keymap("n", "<leader>cc", ":lua show_file_lines('.cmds')<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cm", ":lua show_file_lines('.make')<CR>", { silent = true, noremap = true })
