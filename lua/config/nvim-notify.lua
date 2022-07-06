-- https://github.com/rcarriga/nvim-notify
-- nvim-notify消息弹窗UI
local notify_opts = {
    -- 动画样式
    -- fade_in_slide_out
    -- fade
    -- slide
    -- static
    stages = "slide",
    -- 超时时间，默认 5s
    timeout = 2000
}

local async = require("plenary.async")
local notify = require("notify").async

vim.notify = require("notify")

vim.notify.setup(notify_opts)
-- 使用案例：
-- 信息、级别、标题
-- 级别有：info、warn、error、debug、trace
-- 示例：
-- vim.notify("hello world", "info", {title = "info"})
