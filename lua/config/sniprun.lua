-- https://github.com/michaelb/sniprun

require("sniprun").setup({
	-- 运行结果显示模式
	display = {
		-- "Classic", --# display results in the command-line  area
		"VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

		-- "VirtualTextErr",          --# display error results as virtual text
		-- "TempFloatingWindow",      --# display results in a floating window
		-- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText__
		"Terminal",                --# display results in a vertical split
		-- "TerminalWithCode",        --# display results and code history in a vertical split
		-- "NvimNotify",              --# display with the nvim-notify plugin
		-- "Api"                      --# return output to a programming interface
	},
})

-- 运行代码
vim.keymap.set("v", "<leader>ru", "<Plug>SnipRun", { silent = true })
vim.keymap.set("n", "<leader>ru", "<Plug>SnipRun", { silent = true })
vim.keymap.set("n", "<leader>rf", "<Plug>SnipRunOperator", { silent = true })
-- 清除文本
vim.keymap.set("n", "<leader>rc", "<Plug>SnipClose", { silent = true })
-- 停止运行
vim.keymap.set("n", "<leader>rd", "<Plug>SnipReset", { silent = true })
