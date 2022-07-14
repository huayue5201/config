-- https://github.com/rcarriga/nvim-notify

-- 设置notify为默认通知窗口
vim.notify = require("notify")

local notify_opts = {
	-- 动画样式
	-- fade_in_slide_out
	-- fade
	-- slide
	-- static
	stages = "slide",
	-- 超时时间，默认 5s
	timeout = 2000,
}
vim.notify.setup(notify_opts)
