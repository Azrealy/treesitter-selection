local ts_utils = require("nvim-treesitter.ts_utils")
local api = vim.api
local M = {}

local get_master_node = function()
	local node = ts_utils.get_node_at_cursor()
	local root = ts_utils.get_root_for_node(node)
	if not node then
		error("No node at cursor")
	end
	local start_row = node:start()
	local parent = node:parent()
	while parent ~= nil and parent:start() == start_row and parent ~= root do
		node = parent
		parent = node:parent()
	end
	return node
end
M.select = function()
	local node = get_master_node()
	local bufnr = api.nvim_get_current_buf()
	ts_utils.update_selection(bufnr, node)
end

M.delete = function(for_change)
	local node = get_master_node()
	local bufnr = api.nvim_get_current_buf()
	local space = for_change and " " or ""
	local start_row, start_col, end_row, end_col = node:range()
	api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { space })
end

M.change = function()
	M.delete(true)
	vim.cmd("startinsert")
end
return M
