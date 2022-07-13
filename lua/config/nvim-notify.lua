-- https://github.com/rcarriga/nvim-notify
-- nvim-notify消息弹窗UI

local async = require("plenary.async")
local notify = require("notify").async

require("notify").setup({
	notify_opts = {
		-- 动画样式
		-- fade_in_slide_out
		-- fade
		-- slide
		-- static
		stages = "slide",
		-- 超时时间，默认 5s
		timeout = 2000,
	},
})
