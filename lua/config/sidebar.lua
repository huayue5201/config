-- https://github.com/sidebar-nvim/sidebar.nvim

require("sidebar-nvim").setup({
	-- 使用默认按键
	disable_default_keybindings = 1,
	-- 自定义按键
	bindings = {
		["q"] = function()
			require("sidebar-nvim").close()
		end,
	},
    -- sidbar位置
	side = "left",
	-- 隐藏sidbar状态栏
	hide_statusline = true,
	-- 组件格式
	sections = { "symbols", "files", "diagnostics", "git" },
	-- 代码大纲模块
	symbols = {
		icon = " ƒ",
	},
	-- 文件模块
	files = {
		icon = " ",
		show_hidden = false,
		ignored_paths = { "%.git$" },
	},
	-- Lsp诊断模块
	["diagnostics"] = {
		icon = " ",
	},
	-- git模块
	["git"] = {
		icon = " ",
	},
})
