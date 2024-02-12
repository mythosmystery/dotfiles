local M = {}

M.move_line_up = function()
	if vim.fn.line(".") > 1 then
		vim.cmd("m -2")
	end
end

M.move_line_down = function()
	if vim.fn.line(".") < vim.fn.line("$") then
		vim.cmd("m +1")
	end
end

return M
