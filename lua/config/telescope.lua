-- https://github.com/nvim-telescope/telescope.nvim#telescope-defaults

-- 使用Mozilla的Frecency算法从编辑历史中选择文件时提供智能优先级
require("telescope").load_extension("frecency")

-- ESC直接退出不进入n模式
local telescope_actions = require("telescope.actions")

-- aerial集成 :Telescope aerial(命令)
-- require("telescope").load_extension("aerial")

-- 项目管理
require("telescope").load_extension("projects")

require("telescope").setup({
	-- 基本配置模块
	defaults = {
		-- 按键映射
		mappings = {
			i = {
				["<esc>"] = telescope_actions.close,
			},
			n = {},
		},
	},
	-- 扩展模块
	extensions = {
		frecency = {
			db_root = "$XDG_DATA_HOME/nvim",
			show_scores = true,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
			disable_devicons = false,
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		aerial = {
			-- Display symbols as <root>.<parent>.<symbol>
			show_nesting = true,
		},
	},
	-- 弹窗UI
})

-- 调用fzf算法,由c实现
require("telescope").load_extension("fzf")
