vim.api.nvim_create_user_command("SelectFunc", function()
	require("treesitter-function").select()
end, {})
vim.api.nvim_create_user_command("DeleteFunc", function()
	require("treesitter-function").delete()
end, {})
vim.api.nvim_create_user_command("ChangeFunc", function()
	require("treesitter-function").change()
end, {})

vim.keymap.set("n", "vaf", ":SelectFunc<CR>", {})
vim.keymap.set("n", "daf", ":DeleteFunc<CR>", {})
vim.keymap.set("n", "caf", ":ChangeFunc<CR>", {})
