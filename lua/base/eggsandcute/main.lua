if vim.fn.has('win32') then
    ffi = require("ffi")

    vim.g.Eggs = nil

    if not my_dll then
	ffi.cdef[[
	typedef struct chString_t{char *view; int size; int index; } chString;
	typedef struct EntryList_t{ chString *entries; int entry_numb; int entry_max; } EntryList;
	EntryList* get_entry_list(const char* path);
	EntryList* update_entry_list(const char* path, const char* new_line, int line_nr);
	]]
	my_dll = ffi.load("C:\\devel\\eggsandcute\\bin\\eggsandcute.dll")
	-- my_dll = ffi.load("C:\\Users\\chiha\\AppData\\Local\\nvim\\eggsandcute.dll")
    end

    Eggs_entry_list = nil
    Eggs_winid = nil
    Eggs_buf = nil

    function eggs_get_entry_list()
	local path = vim.fn.getcwd()
	local table_entries = {}
	local entry = my_dll.get_entry_list(path)
	return entry
    end

    -- NOTE: Sends the new_line and its position
    function eggs_update_entry_list(new_line, line_nr)
	local path = vim.fn.getcwd()
	if new_line == nil or new_line == '' then
	    return
	end
	entry_list = my_dll.update_entry_list(path, new_line, line_nr)
	if entry_list == nil then 
	    vim.api.nvim_win_close(0, true)
	    eggs_show_line_entries("Commands")
	end
	return 
    end

    function eggs_entry_list_to_lua_table(entry_list)
	if entry_list == nil then return nil end

	local lines = {}
	for i=0,entry_list.entry_numb,1 do
	    if entry_list.entries[i].size > 0 then
		line = ffi.string(entry_list.entries[i].view, entry_list.entries[i].size)
		table.insert(lines, line)
	    end
	end

	return lines
    end

    local text_changed = false

    function set_autocmd(buf, entry_list)

	vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
	    buffer = buf,
	    callback = function()
		text_changed = true
	    end,
	})

	vim.api.nvim_create_autocmd({"TextYankPost", "InsertLeave"},  {
	    buffer = buf,
	    callback = function(entry_list)
		if text_changed then
		    local line_nr = vim.api.nvim_win_get_cursor(Eggs_winid)[1]
		    local new_line = vim.api.nvim_buf_get_lines(Eggs_buf, line_nr - 1, line_nr, false)[1]
		    entry_list = eggs_update_entry_list(new_line, line_nr)
		    text_changed = false
		end  
	    end
	})
	vim.api.nvim_create_autocmd({"BufWinLeave", "WinClosed" }, {
	    buffer = buf,
	    callback = function(buf)
		Eggs_winid = nil
		Eggs_buf = nil
	    end
	})
    end

    -- Set up an autocommand to call prevent_enter when entering insert mode

    -- Function to create a floating window with an editable buffer linked to the file
    function eggs_show_line_entries(title)
	Eggs_entry_list = eggs_get_entry_list()
	local lines = eggs_entry_list_to_lua_table(Eggs_entry_list)

	if Eggs_winid == nil then
	    Eggs_winid, Eggs_buf = create_window(nil, title)

	    vim.api.nvim_buf_set_lines(Eggs_buf, 0, -1, false, lines)
	    eggs_highlight_fav_lines()

	    set_autocmd(Eggs_buf, Eggs_entry_list)

	    vim.api.nvim_buf_set_keymap(Eggs_buf, 'n', '<CR>', '', { 
		noremap = true, silent = true, callback = function() eggs_select_line(Eggs_buf, eggs_on_line_selected) end 
	    })
	    vim.api.nvim_buf_set_keymap(Eggs_buf, 'i', '<CR>', '<C-[><CR>', { noremap = true, silent = true })
	else
	    if Eggs_winid ~= nil and vim.api.nvim_win_is_valid(Eggs_winid) then
		vim.api.nvim_win_close(Eggs_winid, true)
	    end
	    if Eggs_buf ~= nil and vim.api.nvim_buf_is_valid(Eggs_buf) then
		vim.api.nvim_buf_delete(Eggs_buf, {force = true})
	    end
	    Eggs_winid = nil
	    Eggs_buf = nil
	end
    end

    vim.api.nvim_set_hl(0, 'EggsFg', {fg='#ffdd33'})
    vim.api.nvim_set_hl(0, 'EggsBg', {bg='#282828'})
    vim.api.nvim_set_hl(0, 'Eggs', {bg='#282828'})

    function eggs_highlight_fav_lines()
	if vim.g.Eggs == nil then return end
	local line_nr = vim.g.Eggs[2] - 1

	if line_nr < 0 then print("Why the fuck is line < 0 ????") line_nr = 0 end
	vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)
	vim.api.nvim_buf_add_highlight(0, -1, 'EggsFg', line_nr, 0, -1)
	vim.api.nvim_buf_add_highlight(0, -1, 'EggsBg', line_nr, 0, -1)
    end

    function eggs_on_line_selected(line, line_number)
	vim.g.Eggs = {line, line_number}
	eggs_highlight_fav_lines()
    end

    function eggs_select_line(buf, callback)
	local line_number = vim.api.nvim_win_get_cursor(Eggs_winid)[1]
	local line = vim.api.nvim_buf_get_lines(buf, line_number - 1, line_number, false)[1]
	-- vim.api.nvim_win_close(0, true)
	if line then
	    callback(line, line_number)
	end
    end

    function eggs_print_list()
	local path = vim.fn.getcwd()
	local entry = my_dll.get_entry_list(path)
	if entry == nil then return end
	print("Total number of entries: " .. tostring(entry.entry_numb))
	for i=0,entry.entry_numb,1 do
	    if entry.entries[i].size > 0 then
		local str_bytes = ffi.string(entry.entries[i].view, entry.entries[i].size)
		if str_bytes then
		    print("[" .. tostring(i) .. "] " .. "\"" .. str_bytes .. "\"" .. " of size " .. tostring(entry.entries[i].size))
		end
	    end
	end
    end
end
