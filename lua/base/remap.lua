vim.g.mapleader = " "
vim.g.term_open = false
vim.g.cmdFile = '.cmds'
vim.g.makeFile = '.make'

vim.cmd('source ~/Appdata/Local/nvim/lua/remap.vim')

---------------------------------- functions -----------------------------------
-- Redirect output of command to scratch buffer
function Scratch()-- {{{
  vim.ui.input({ prompt = "Command: ", completion = "command" }, function(input)
    if input == nil then
      return
    elseif input == "scratch" then
      input = "echo('')"
    end

    local cmd = vim.api.nvim_exec(input, true)
    local output = {}
    for line in cmd:gmatch("[^\n]+") do
      table.insert(output, line)
    end
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
    vim.api.nvim_win_set_buf(0, buf)
  end)
end-- }}}

-- Build
function MakeCommand()-- {{{
  vim.cmd(":lua vim.g.MakeLine = GetFavCommand(vim.fn.getcwd() .. '/.make')")
  if vim.g.MakeLine then
    vim.cmd(tostring(vim.g.MakeLine))
  else
    print("No make command found. Add one in .make")
  end
end-- }}}

function ExecCommand(key)
  local temp = vim.g[key]
  temp = GetFavCommand(vim.fn.getcwd() .. '/.make')
  if temp then
    vim.cmd(tostring(temp))
    vim.g[key] = temp
  else
    print("No cmd command found. Add one in .make or .cmd")
  end
end

-- 'cd' utility function
function Mycd(cmd)
  local current_d = vim.fn.expand('%:p:h')
  if current_d then
    vim.cmd(cmd .. ' ' .. current_d)
  end
end

function SendCommandToggleTerm()-- {{{
  -- local command = Get_cmd_txt()
  vim.cmd(":lua vim.g.CmdLine = GetFavCommand(vim.fn.getcwd() .. '/.cmds')")
  local command = vim.g.CmdLine
  if command then
    -- vim.cmd("1TermExec cmd=" .. command)
    if Wincmd1x:is_open() then
      Wincmd1x:send(command, false)
    else
      Wincmd1x:toggle(120, "vertical")
      Wincmd1x:send(command, false)
      Wincmd1x:close()
    end
  else
    print("No command found. Add one in .cmds")
  end
end-- }}}

function _Wincmd1x_toggle()-- {{{
  if Wincmd1x:is_float() and Wincmd1x:is_open() then
    Wincmd1x:close()
    Wincmd1x:open(120, "vertical")
    -- vim.cmd[[wincmd H]]
  elseif Wincmd1x:is_open() then
    Wincmd1x:close()
  else
    Wincmd1x:open(120, "vertical")
    -- vim.cmd[[wincmd H]]
  end
end-- }}}

function _Wincmd2x_toggle()-- {{{
  if Wincmd1x:is_split() and Wincmd1x:is_open() then
    Wincmd1x:close()
    Wincmd1x:open(10, "float")
  else
    Wincmd1x:toggle(10, "float")
  end
end-- }}}
