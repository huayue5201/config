-- https://github.com/mfussenegger/nvim-dap

require("dap")
-- 断点标志设置
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
