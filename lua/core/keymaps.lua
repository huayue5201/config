-- leader设置成空格键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 退出快捷键
vim.keymap.set("n", "<leader>q", ":q<CR>")
-- 保存
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- 代码块缩进
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- 关闭当前buffer
vim.keymap.set("n", "<C-q>", "<cmd>Bdelete<CR>")
-- 切换到下一个buffer
vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>")
-- 切换到上一个buffer
vim.keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>")

-- 一键全选
vim.keymap.set("n", "<leader>gg", "ggVG")

-- 手动开启拼写检查
vim.keymap.set("n", "<leader>sp", ":setlocal spell! spelllang=en_us<CR>")

-- 复制到"*"\"+"寄存器
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')

-- 正常模式下按 ESC 取消高亮显示
vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>")

-- buffers查找
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
-- 项目文件查找
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files({ previewer = false })
end)
-- 在当前buffer内模糊搜索
vim.keymap.set("n", "<leader>fi", require("telescope.builtin").current_buffer_fuzzy_find)
-- 查找帮助信息
vim.keymap.set("n", "<F1>", require("telescope.builtin").help_tags)
-- 历史查找
vim.keymap.set("n", "<leader>fh", ":Telescope frecency<cr>")
-- 在当前目录搜索光标下字符串
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string)
-- 在当前项目搜索字符串
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").live_grep)
-- yanks搜索
vim.keymap.set("n", "<leader>fy", ":lua require('telescope').extensions.neoclip.default()<cr>")
-- 项目管理
vim.keymap.set("n", "<leader>fp", ":Telescope projects<cr>")

-- 打开侧边栏
vim.keymap.set("n", "<leader>ts", ":SidebarNvimToggle<cr>")

-- marks
-- 查看全部标签
vim.keymap.set("n", "<leader>bk", "<cmd>MarksQFListAll<cr>")
-- telescope搜索标签
vim.keymap.set("n", "<leader>fm", require("telescope.builtin").marks)

-- TODO管理
vim.keymap.set("n", "<leader>to", ":TodoTelescope<cr>")

-- tree文件树按键映射
-- 打开or关闭
vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>")

-- 侧边栏
vim.keymap.set("n", "<leader>ts", "<cmd>SidebarNvimToggle<CR>")

-- 格式化代码
vim.keymap.set("n", "<leader>bf", "<cmd>lua vim.lsp.buf.formatting_sync()<cr>")

-- notify显示历史弹窗记录
vim.keymap.set("n", "<leader>tn", "<cmd>lua require('telescope').extensions.notify.notify()<CR>")
