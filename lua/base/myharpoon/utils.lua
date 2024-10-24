function tableLength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

local function file_exists(filepath)
	if not filepath then return end
	local stat = vim.loop.fs_stat(filepath)
	return (stat and stat.type) or false
end

function read_lines_from_file(filepath)
	local lines = {}
	if not file_exists(filepath) then
		return nil
	end
	local file = io.open(filepath, "r")
	for line in io.lines(filepath) do
		table.insert(lines, line)
	end
	return lines
end

function write_lines_to_file(filepath, lines)
	if not filepath then
		print("Failed: " .. lines[1])
		return
	end
	local nbLine = tableLength(lines)
	for i = 2, nbLine do
		if lines[i] and string.sub(lines[i], 1, 7) == "[FAV]->" then
			table.remove(lines, i)
		end
	end
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

function save_myfile() 
	local list = Buffer.get_contents(self.bufnr)
	local length = #list
	for i, v in ipairs(list) do
		if v == "" then
			list[i] = nil
		end
	end
end

function create_window(opts)
	local win = vim.api.nvim_list_uis()

	local Realwidth = vim.api.nvim_get_option("columns")
	local width = 100
	local height = 8
	local bufnr = vim.api.nvim_create_buf(false, true)
	if opts == null then
		opts = {
			relative = "editor",
			title = "Commands",
			title_pos = "center",
			row = math.floor(((vim.o.lines - height) / 2) - 1),
			col = math.floor((Realwidth - width) / 2),
			width = width,
			height = height,
			style = "minimal",
			border = "single",
		}
	end

	local win_id = vim.api.nvim_open_win(bufnr, true, opts)

	-- Buffer.setup_autocmds_and_keymaps(bufnr)

	local win_id = win_id
	vim.api.nvim_set_option_value("number", true, {
		win = win_id,
	})

	-- local win = vim.api.nvim_open_win(buf, true, opts)
	return win_id, bufnr
end

vim.api.nvim_set_hl(0, 'FavHighlightFg', {fg='#ffdd33'})
vim.api.nvim_set_hl(0, 'FavHighlightBg', {bg='#282828'})
vim.api.nvim_set_hl(0, 'FavHighlight', {bg='#282828'})

-- Function to highlight lines containing "[FAV]"
function highlight_fav_lines(bufnr)
	local line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]

	if line and string.sub(line, 1, 7) == "[FAV]->" then
		vim.api.nvim_buf_add_highlight(0, -1, 'FavHighlightFg', 0, 0, -1)
		vim.api.nvim_buf_add_highlight(0, -1, 'FavHighlightBg', 0, 0, -1)
	end
end
