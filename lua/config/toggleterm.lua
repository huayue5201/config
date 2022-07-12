-- https://github.com/akinsho/toggleterm.nvim

-- 终端配置

require("toggleterm").setup({
	open_mapping = [[<c-\>]], -- 开关键
	-- 终端样式设置vertical/horizontal/tab/float
	-- 从下面弹出
	direction = "horizontal",
})

-- 切换终端映射
function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- 打开或关闭所有终端
vim.keymap.set("n", "<F2>", "<cmd>ToggleTermToggleAll<CR>")
vim.keymap.set("t", "<F2>", "<cmd>ToggleTermToggleAll<CR>")
