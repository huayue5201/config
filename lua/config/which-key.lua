-- https://github.com/folke/which-key.nvim

require("which-key").setup({
	plugins = {
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
})

local wk = require("which-key")

wk.register({
	["<leader>"] = {
		m = {
			name = "Commands",
			a = { "<cmd>PackerProfile<cr>", "插件加载分析(packer.nvim)" },
			b = { "<cmd>ColorizerToggle<cr>", "颜色编码预览(nvim-colorizer)" },
			c = { "<cmd>Neorg sync-parsers<cr>", "neorg语法解析器加载" },
			e = { "<cmd>TSInstallInfo<cr>", "treesitter解析器列表" },
			f = { "<cmd>TSUpdate<cr>", "更新treesitter解析器" },
			g = { "<cmd>checkhealth<cr>", "nvim健康测试" },
			h = { "<cmd>source $MYVIMRC<cr>", "应用nvim配置" },
			i = { "<cmd>NullLsInfo<cr>", "查看当前文件类型linter/Formatter(null-nvim)" },
			j = { "<cmd>LspInfo<cr>", "lsp状态查看" },
		},
		f = {
			name = "File",
		},
	},
})
