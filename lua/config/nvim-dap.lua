-- https://github.com/mfussenegger/nvim-dap

-- 断点标志设置
require("dap")
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
