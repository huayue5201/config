-- https://github.com/akinsho/toggleterm.nvim

-- 终端配置
require("toggleterm").setup({
	open_mapping = [[<c-\>]], -- 开关键
	-- 终端样式设置vertical/horizontal/tab/float
	-- 从下面弹出
	direction = "horizontal",
})
